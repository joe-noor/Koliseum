contract ERC721 {
    // Required methods ------- MAY NEED MORE
    function totalSupply() public view returns (uint256 total);
    function balanceOf(address _owner) public view returns (uint256 balance);
    function ownerOf(uint256 _tokenId) external view returns (address owner);
    function approve(address _to, uint256 _tokenId) external;
    function transfer(address _to, uint256 _tokenId) external;
    function transferFrom(address _from, address _to, uint256 _tokenId) external;

    // Events -------- MAY NEED MORE
    event Transfer(address from, address to, uint256 tokenId);
    event Approval(address owner, address approved, uint256 tokenId);

    // ERC-165 Compatibility
    function supportsInterface(bytes4 _interfaceID) external view returns (bool);
}


contract Genetics { 
    /// a boolean to indicate this is the contract we expect to be
    function genetics() public pure returns (bool);

    /// given traits/heritages of raiders/trainers, return a genetic combination of traits/heritages
    /// trait/heritage 1 genes of raider
    /// trait/heritage 2 genes of trainer
    /// the traits/heritages that are supposed to be passed down the child Killa
    function mixTriats(uint256 trait1, uint256 trait2, uint256 targetBlock) public returns (uint256);
    function mixHeritages(uint256 heritage1, uint256 heritage2, uint256 targetBlock) public returns (uint256)
}


contract KillaBase { 
    /*** EVENTS ***/

    /// The Mint event is fired whenever a new Killa comes into existence. This obviously
    ///  includes any time a killa is created through the startmint method, but it is also called
    ///  when a new first generation killa is created.
    event Mint(address owner, uint256 killaID, uint256 raiderID, uint256 trainerID, uint256 trait, uint256 heritage); //OLD WAS BIRTH

    /// Transfer event as defined in current draft of ERC721. Emitted every time a killa
    ///  ownership is assigned, including when was is bred.
    event Transfer(address from, address to, uint256 tokenId);


    /// The main Killa struct. Every Killa in the Koliseum is represented by a copy
    ///  of this structure, so great care was taken to ensure that it fits neatly into
    ///  exactly two 256-bit words. Note that the order of the members in this structure
    ///  is important because of the byte-packing rules used by Ethereum.
    struct Killa { 
        // A killas's traits never change.
        uint256 traits;
        
        // A killas's heritages never change.
        uint256 heritages;

        // The timestamp from the block when this killa came into existence.
        uint64 birthTime;

        // The minimum timestamp after which this killa can engage in breeding
        // activities again. This same timestamp is used for the trainer/raider countdown.
        uint64 cooldownEndBlock;

        // The ID of the parents of this killa, set to 0 for first generation killas.
        uint32 raiderId;
        uint32 trainerId;

        // Set to the ID of the trainer killa for raider killa that it is breeding with,
        // zero otherwise. A non-zero value here is how we know a radier killa
        // is being bred. Used to retrieve the genes for the new
        // killa when the new killa comes into existence.
        uint32 trainerWithId;

        // The generation "number" of this killa. Killas minted by the minting contract
        // for sale are called (whatever first generation killas whld b called) and have a generation number of 0. The
        // generation number of all other killas is the larger of the two generation
        // numbers of their parents, plus one.
        // (i.e. max(raider.generation, trainer.generation) + 1)
        uint16 generation;
    }

    // An approximation of currently how many seconds are in between blocks.
    uint256 public secondsPerBlock = 15;

    /// An array containing the Killa struct for all Killas in existence. The ID
    ///  of each killa is actually an index into this array.  ID 0 is a an invalid killa
    Killa[] killas;

    /// A mapping from killa IDs to the address that owns them. All killas have
    ///  some valid owner address, even first generation killas are created with a non-zero owner.
    mapping (uint256 => address) public killaIndexToOwner;

    // A mapping from owner address to count of tokens that address owns.
    //  Used internally inside balanceOf() to resolve ownership count.
    mapping (address => uint256) ownershipTokenCount;

    /// A mapping from KillaIDs to an address that has been approved to call
    ///  transferFrom(). Each Killa can only have one approved address for transfer
    ///  at any time. A zero value means no approval is outstanding.
    mapping (uint256 => address) public killaIndexToApproved;

    /// A mapping from KillaIDs to an address that has been approved to use
    ///  this Killa for breeding via breedWith(). Each trainer Killa can only have one approved
    ///  address for breeding at any time. A zero value means no approval is outstanding.
    mapping (uint256 => address) public breedAllowedToAddress;

    /// Assigns ownership of a specific Killa to an address.
    function _transfer(address _from, address _to, uint256 _tokenId) internal {
        // Since the number of killas is capped to 2^32 atm we can't overflow this
        ownershipTokenCount[_to]++;
        // transfer ownership
        killaIndexToOwner[_tokenId] = _to;
        // When creating new killas _from is 0x0, but we can't count that address.
        if (_from != address(0)) {
            ownershipTokenCount[_from]--;
            // once the killa is transferred also clear trainer allowances
            delete breedAllowedToAddress[_tokenId];
            // clear any previously approved ownership exchange
            delete killaIndexToApproved[_tokenId];
        }
        // Emit the transfer event.
        Transfer(_from, _to, _tokenId);
    }

    ///  An internal method that creates a new killa and stores it. This
    ///  method doesn't do any checking and should only be called when the
    ///  input data is known to be valid. Will generate both a Birth event
    ///  and a Transfer event.
    ///  _raiderId The killa ID of the raider of this killa (zero for first generation)
    ///  _trainerId The killa ID of the trainer of this killa zero for first generation)
    ///  _generation The generation number of this cat, must be computed by caller.
    ///  _traits The killa's traits.
    ///  _heritages The killa's heritages.
    ///  _owner The inital owner of this killa, must be non-zero (except for the invalid Killa, ID 0)
    function _createKilla(
        uint256 _raiderId,
        uint256 _trainerId,
        uint256 _generation,
        uint256 _traits,
        uint256 _heritages,
        address _owner
    )
        internal
        returns (uint)
    {
        
        //MAY NEED VERIFICATION FOR UINT

        Killa memory _killa = Killa({
            traits: _traits,
            heritages: _heritages,
            birthTime: uint64(now),
            cooldownEndBlock: 0,
            raiderId: uint32(_raiderId),
            trainerId: uint32(_trainerId),
            trainerWithId: 0,
            generation: uint16(_generation)
        });
        uint256 newKillaId = killas.push(_killas) - 1;

        require(newKillaId == uint256(uint32(newKillaId)));

        // emit the birth event
        Birth(
            _owner,
            newKillaId,
            uint256(_killa.raiderId),
            uint256(_killa.trainerId),
            _killa.genes
        );

        // This will assign ownership, and also emit the Transfer event as
        // per ERC721 draft
        _transfer(0, _owner, newKillaId);

        return newKillaId;
    }


///  This contract deals with all the ERC721 compliance
contract KillaOwnership is KillaBase, ERC721 { 

    /// Name and symbol of the non fungible token, as defined in ERC721.
    string public constant name = ""; //NAME OF THE TOKEN
    string public constant symbol = ""; //SYMBOL OF THE TOKEN

    // The contract that will return killa metadata
    ERC721Metadata public erc721Metadata;

    ///  Introspection interface as per ERC-165 compliance
    ///  Returns true for any standardized interfaces implemented by this contract. We implement
    ///  ERC-165 and ERC-721.
    function supportsInterface(bytes4 _interfaceID) external view returns (bool)
    {

        return ((_interfaceID == InterfaceSignature_ERC165) || (_interfaceID == InterfaceSignature_ERC721));
    }

    ///  Checks if a given address is the current owner of a particular Killa.
    ///  _against the address we are validating against.
    ///  _tokenId killa id, only valid when > 0
    function _owns(address _against, uint256 _tokenId) internal view returns (bool) {
        return killaIndexToOwner[_tokenId] == _against;
    }

    ///  Checks if a given address currently has transferApproval for a particular Killa.
    ///  _against the address we are confirming killa is approved for.
    ///  _tokenId killa id, only valid when > 0
    function _approvedFor(address _against, uint256 _tokenId) internal view returns (bool) {
        return killaIndexToApproved[_tokenId] == _against;
    }

    ///  Marks an address as being approved for transferFrom(), overwriting any previous
    ///  approval. Setting _approved to address(0) clears all transfer approval.
    function _approve(uint256 _tokenId, address _approved) internal {
        killaIndexToApproved[_tokenId] = _approved;
    }

    ///  Returns the number of Killas owned by a specific address.
    ///  _owner The owner address to check.
    ///  Required for ERC-721 compliance
    function balanceOf(address _owner) public view returns (uint256 count) {
        return ownershipTokenCount[_owner];
    }

    ///  Transfers a Killa to another address. 
    ///  _to The address of the recipient, can be a user or contract.
    ///  _tokenId The ID of the Killa to transfer.
    ///  Required for ERC-721 compliance.
    function transfer(
        address _to,
        uint256 _tokenId
    )
        external
        whenNotPaused
    {
        //prevents against a unexpected 0x0 default.
        require(_to != address(0));
        // Disallow transfers to this contract
        require(_to != address(this));
        // You can only send your own killa.
        require(_owns(msg.sender, _tokenId));

        // Reassign ownership, clear pending approvals, emit Transfer event.
        _transfer(msg.sender, _to, _tokenId);
    }

    ///  Grant another address the right to transfer a specific Killa via transferFrom(). 
    ///  _to The address to be granted transfer approval. Pass address(0) to
    ///  clear all approvals.
    ///  _tokenId The ID of the Killa that can be transferred if this call succeeds.
    ///  Required for ERC-721 compliance.
    function approve(
        address _to,
        uint256 _tokenId
    )
        external
        whenNotPaused
    {
        // Only an owner can grant transfer approval.
        require(_owns(msg.sender, _tokenId));

        // Register the approval (replacing any previous approval).
        _approve(_tokenId, _to);

        // Emit approval event.
        Approval(msg.sender, _to, _tokenId);
    }

    ///  Transfer a Killa owned by another address, for which the calling address
    ///  has previously been granted transfer approval by the owner.
    ///  _from The address that owns the Killa to be transfered.
    ///  _to The address that should take ownership of the Killa. Can be any address,
    ///  including the caller.
    ///  _tokenId The ID of the Killa to be transferred.
    ///  Required for ERC-721 compliance.
    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    )
        external
        whenNotPaused
    {
        // prevents against a unexpected 0x0 default.
        require(_to != address(0));
        // Disallow transfers to this contract
        require(_to != address(this));
        // Check for approval and valid ownership
        require(_approvedFor(msg.sender, _tokenId));
        require(_owns(_from, _tokenId));

        // Reassign ownership
        _transfer(_from, _to, _tokenId);
    }

    ///  Returns the total number of Killas currently in existence.
    ///  Required for ERC-721 compliance.
    function totalSupply() public view returns (uint) {
        return killas.length - 1;
    }

    ///  Returns the address currently assigned ownership of a given Killa.
    ///  Required for ERC-721 compliance.
    function ownerOf(uint256 _tokenId)
        external
        view
        returns (address owner)
    {
        owner = killaIndexToOwner[_tokenId];

        require(owner != address(0));
    }

    ///  Returns a list of all Killa IDs assigned to an address.
    ///  _owner The owner whose Killas we are interested in.
    ///  This method shldnt be called by smart contract code
    function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
        uint256 tokenCount = balanceOf(_owner);

        if (tokenCount == 0) {
            return new uint256[](0);
        } else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 totalKillas = totalSupply();
            uint256 resultIndex = 0;

            // We count on the fact that all killas have IDs starting at 1 and increasing
            // sequentially up to the totalKilla count.
            uint256 killaId;

            for (killaId = 1; killaId <= totalKillas; killaId++) {
                if (killaIndexToOwner[killaId] == _owner) {
                    result[resultIndex] = killaId;
                    resultIndex++;
                }
            }

            return result;
        }
    }
