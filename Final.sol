pragma solidity >=0.7.0 <0.9.0;
///SPDX-License-Identifier: UNLICENSED

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
    function mixTraits(uint256[14] raider, uint256[14] trainer, uint256 targetBlock) public returns (uint256[14] child){
    
        uint256[14] peasent;
        ///targetBlock will be set to cooldownEndBlock
        ///Array will be broken down as such: 
        
        /// 0: type of class
        ///     Soldier = 1, Tank = 2, Mage = 3, Trickster = 4
        /// 1: generation
        ///generation determines class based off parents
        if (raider[1]%2 == 1) {
            peasent[0] = raider[0];
        } else {
            peasent[0] = trainer[0]
        }
        peasent[1] = radier[1]+1
        
        /// 2: special ability of said class
            /// Soldier: 1 = Lethal Blow, 2 = Lunge, 3 = Parry
            /// Tank: 4 = Slam, 5 = Turtle, 6 = Daze
            /// Mage: 7 = Cripple, 8 = Burn, 9 = Heal
            /// Trickster: 10 = Backstab, 11 = Poison, 12 = Illusion
            
        ///sets the special ability based of generation
        if (peasent[0] == 1) {
            if (peasent[1]%3 == 1) {
                peasent[2] = 1;
            }
            if (peasent[1]%3 == 2) {
                peasent[2] = 2;
            }
            if (peasent[1]%3 == 0) {
                peasent[2] = 3;
            }
        }
        if (peasent[0] == 2) {
            if (peasent[1]%3 == 1) {
                peasent[2] = 4;
            }
            if (peasent[1]%3 == 2) {
                peasent[2] = 5;
            }
            if (peasent[1]%3 == 0) {
                peasent[2] = 6;
            }
        }
        if (peasent[0] == 3) {
            if (peasent[1]%3 == 1) {
                peasent[2] = 7;
            }
            if (peasent[1]%3 == 2) {
                peasent[2] = 8;
            }
            if (peasent[1]%3 == 0) {
                peasent[2] = 9;
            }
        }
        if (peasent[0] == 0) {
            if (peasent[1]%3 == 1) {
                peasent[2] = 10;
            }
            if (peasent[1]%3 == 2) {
                peasent[2] = 11;
            }
            if (peasent[1]%3 == 0) {
                peasent[2] = 12;
            }
        }
    
        /// 3-12: specific traits (indexes)
        /// 3 = Strength, 4 = Constitution, 5 = Dexterity, 6 = Aggression, 7 = Stamina, 8 = Defense, 9 = Experience, 10 = Intelligence, 11 = Moral, 12 = Luck
        
        ///IF BOTH PARENTS SOLDIERS
        if (peasent[0] == 1 && raider[0] == 1 && raider[0] != 1) {
            if (raider[6] == 75) {
                peasent[6] = 75;
            } else {
                peasent[6] = raider[6]-1
            }
            if (raider[7] == 75) {
                peasent[7] = 75;
            } else {
                peasent[7] = raider[7]-1
            }
        }
        if (peasent[0] == 1 && trainer[0] == 1 && raider[0] != 1) {
            if (trainer[6] == 75) {
                peasent[6] = 75;
            } else {
                peasent[6] = trainer[6]-1
            }
            if (trainer[7] == 75) {
                peasent[7] = 75;
            } else {
                peasent[7] = trainer[7]-1
            }
        }
        if (peasent[0] == 1 && trainer[0] == 1 && raider[0] == 1) {
            if (trainer[6] == 75 && raider[6] == 75) {
                peasent[6] = 75;
            }
            if (trainer[6] == 75 || raider[6] == 75){
                if ((trainer[6]+raider[6])/2 >= 76) {
                    if (peasent[1]%2 == 1) {
                        peasent[6] = ((trainer[6]+raider[6])/2)-1
                    } else {
                        peasent[6] = (trainer[6]+raider[6])/2
                    }
                }
            }
            if (trainer[6] > 75 || raider[6] > 75) {
                if (peasent[1]%2 == 1) {
                    peasent[6] = ((trainer[6]+raider[6])/2)-1
                } else {
                    peasent[6] = (trainer[6]+raider[6])/2
                }
            }
            
            if (trainer[7] == 75 && raider[7] == 75) {
                peasent[7] = 75;
            }
            if (trainer[7] == 75 || raider[7] == 75){
                if ((trainer[7]+raider[7])/2 >= 76) {
                    if (peasent[1]%2 == 1) {
                        peasent[7] = ((trainer[7]+raider[7])/2)-1
                    } else {
                        peasent[7] = (trainer[7]+raider[7])/2
                    }
                }
            }
            if (trainer[7] > 75 || raider[7] > 75) {
                if (peasent[1]%2 == 1) {
                    peasent[7] = ((trainer[7]+raider[7])/2)-1
                } else {
                    peasent[7] = (trainer[7]+raider[7])/2
                }
            }
        }
        //IF PEASENT IS SOLDIER
        if (peasent[0] == 1) {
            if (peasent[1]%2 = 1) {
                peasent[3] = ((raider[3]+trainer[3])/2)-1
                peasent[4] = ((raider[4]+trainer[4])/2)-1
                peasent[5] = ((raider[5]+trainer[5])/2)-1
                peasent[8] = ((raider[8]+trainer[8])/2)-1
                peasent[9] = ((raider[9]+trainer[9])/2)-1
                peasent[10] = ((raider[10]+trainer[10])/2)-1
                peasent[11] = ((raider[11]+trainer[11])/2)-1
                peasent[12] = ((raider[12]+trainer[12])/2)-1
            } else {
                peasent[3] = ((raider[3]+trainer[3])/2)
                peasent[4] = ((raider[4]+trainer[4])/2)
                peasent[5] = ((raider[5]+trainer[5])/2)
                peasent[8] = ((raider[8]+trainer[8])/2)
                peasent[9] = ((raider[9]+trainer[9])/2)
                peasent[10] = ((raider[10]+trainer[10])/2)
                peasent[11] = ((raider[11]+trainer[11])/2)
                peasent[12] = ((raider[12]+trainer[12])/2)
            }
        }
        
        ///IF BOTH PARENTS TANK
        if (peasent[0] == 2 && raider[0] == 2 && raider[0] != 2) {
            if (raider[4] == 75) {
                peasent[4] = 75;
            } else {
                peasent[4] = raider[4]-1
            }
            if (raider[8] == 75) {
                peasent[8] = 75;
            } else {
                peasent[8] = raider[8]-1
            }
        }
        if (peasent[0] == 2 && trainer[0] == 2 && raider[0] != 2) {
            if (trainer[4] == 75) {
                peasent[4] = 75;
            } else {
                peasent[4] = trainer[4]-1
            }
            if (trainer[8] == 75) {
                peasent[8] = 75;
            } else {
                peasent[8] = trainer[8]-1
            }
        }
        if (peasent[0] == 2 && trainer[0] == 2 && raider[0] == 2) {
            if (trainer[4] == 75 && raider[4] == 75) {
                peasent[4] = 75;
            }
            if (trainer[4] == 75 || raider[4] == 75){
                if ((trainer[4]+raider[4])/2 >= 76) {
                    if (peasent[1]%2 == 1) {
                        peasent[4] = ((trainer[4]+raider[4])/2)-1
                    } else {
                        peasent[4] = (trainer[4]+raider[4])/2
                    }
                }
            }
            if (trainer[4] > 75 || raider[4] > 75) {
                if (peasent[1]%2 == 1) {
                    peasent[4] = ((trainer[4]+raider[4])/2)-1
                } else {
                    peasent[4] = (trainer[4]+raider[4])/2
                }
            }
            
            if (trainer[8] == 75 && raider[8] == 75) {
                peasent[8] = 75;
            }
            if (trainer[8] == 75 || raider[8] == 75){
                if ((trainer[8]+raider[8])/2 >= 76) {
                    if (peasent[1]%2 == 1) {
                        peasent[8] = ((trainer[8]+raider[8])/2)-1
                    } else {
                        peasent[8] = (trainer[8]+raider[8])/2
                    }
                }
            }
            if (trainer[8] > 75 || raider[8] > 75) {
                if (peasent[1]%2 == 1) {
                    peasent[8] = ((trainer[8]+raider[8])/2)-1
                } else {
                    peasent[8] = (trainer[8]+raider[8])/2
                }
            }
        }
        //IF PEASENT IS TANK
        if (peasent[0] == 2) {
            if (peasent[1]%2 = 1) {
                peasent[3] = ((raider[3]+trainer[3])/2)-1
                peasent[5] = ((raider[5]+trainer[5])/2)-1
                peasent[6] = ((raider[6]+trainer[6])/2)-1
                peasent[7] = ((raider[7]+trainer[7])/2)-1
                peasent[9] = ((raider[9]+trainer[9])/2)-1
                peasent[10] = ((raider[10]+trainer[10])/2)-1
                peasent[11] = ((raider[11]+trainer[11])/2)-1
                peasent[12] = ((raider[12]+trainer[12])/2)-1
            } else {
                peasent[3] = ((raider[3]+trainer[3])/2)
                peasent[5] = ((raider[5]+trainer[5])/2)
                peasent[6] = ((raider[6]+trainer[6])/2)
                peasent[7] = ((raider[7]+trainer[7])/2)
                peasent[9] = ((raider[9]+trainer[9])/2)
                peasent[10] = ((raider[10]+trainer[10])/2)
                peasent[11] = ((raider[11]+trainer[11])/2)
                peasent[12] = ((raider[12]+trainer[12])/2)
            }
        }
        
        ///IF BOTH PARENTS MAGE
        if (peasent[0] == 3 && raider[0] == 3 && raider[0] != 3) {
            if (raider[9] == 75) {
                peasent[9] = 75;
            } else {
                peasent[9] = raider[9]-1
            }
            if (raider[10] == 75) {
                peasent[10] = 75;
            } else {
                peasent[10] = raider[10]-1
            }
        }
        if (peasent[0] == 3 && trainer[0] == 3 && raider[0] != 3) {
            if (trainer[9] == 75) {
                peasent[9] = 75;
            } else {
                peasent[9] = trainer[9]-1
            }
            if (trainer[10] == 75) {
                peasent[10] = 75;
            } else {
                peasent[10] = trainer[10]-1
            }
        }
        if (peasent[0] == 3 && trainer[0] == 3 && raider[0] == 3) {
            if (trainer[9] == 75 && raider[9] == 75) {
                peasent[9] = 75;
            }
            if (trainer[9] == 75 || raider[9] == 75){
                if ((trainer[9]+raider[9])/2 >= 76) {
                    if (peasent[1]%2 == 1) {
                        peasent[9] = ((trainer[9]+raider[9])/2)-1
                    } else {
                        peasent[9] = (trainer[9]+raider[9])/2
                    }
                }
            }
            if (trainer[9] > 75 || raider[9] > 75) {
                if (peasent[1]%2 == 1) {
                    peasent[9] = ((trainer[9]+raider[9])/2)-1
                } else {
                    peasent[9] = (trainer[9]+raider[9])/2
                }
            }
            
            if (trainer[10] == 75 && raider[10] == 75) {
                peasent[10] = 75;
            }
            if (trainer[10] == 75 || raider[10] == 75){
                if ((trainer[10]+raider[10])/2 >= 76) {
                    if (peasent[1]%2 == 1) {
                        peasent[10] = ((trainer[10]+raider[10])/2)-1
                    } else {
                        peasent[10] = (trainer[10]+raider[10])/2
                    }
                }
            }
            if (trainer[10] > 75 || raider[10] > 75) {
                if (peasent[1]%2 == 1) {
                    peasent[10] = ((trainer[10]+raider[10])/2)-1
                } else {
                    peasent[10] = (trainer[10]+raider[10])/2
                }
            }
        }
        //IF PEASENT IS MAGE
        if (peasent[0] == 3) {
            if (peasent[1]%2 = 1) {
                peasent[3] = ((raider[3]+trainer[3])/2)-1
                peasent[4] = ((raider[4]+trainer[4])/2)-1
                peasent[5] = ((raider[5]+trainer[5])/2)-1
                peasent[6] = ((raider[6]+trainer[6])/2)-1
                peasent[7] = ((raider[7]+trainer[7])/2)-1
                peasent[8] = ((raider[8]+trainer[8])/2)-1
                peasent[11] = ((raider[11]+trainer[11])/2)-1
                peasent[12] = ((raider[12]+trainer[12])/2)-1
            } else {
                peasent[3] = ((raider[3]+trainer[3])/2)
                peasent[4] = ((raider[4]+trainer[4])/2)
                peasent[5] = ((raider[5]+trainer[5])/2)
                peasent[6] = ((raider[6]+trainer[6])/2)
                peasent[7] = ((raider[7]+trainer[7])/2)
                peasent[8] = ((raider[8]+trainer[8])/2)
                peasent[11] = ((raider[11]+trainer[11])/2)
                peasent[12] = ((raider[12]+trainer[12])/2)
            }
        }
    
        ///IF BOTH PARENTS TRICKSTER
        if (peasent[0] == 4 && raider[0] == 4 && raider[0] != 4) {
            if (raider[9] == 75) {
                peasent[9] = 75;
            } else {
                peasent[9] = raider[9]-1
            }
            if (raider[5] == 75) {
                peasent[5] = 75;
            } else {
                peasent[5] = raider[5]-1
            }
        }
        if (peasent[0] == 4 && trainer[0] == 4 && raider[0] != 4) {
            if (trainer[9] == 75) {
                peasent[9] = 75;
            } else {
                peasent[9] = trainer[9]-1
            }
            if (trainer[5] == 75) {
                peasent[5] = 75;
            } else {
                peasent[5] = trainer[5]-1
            }
        }
        if (peasent[0] == 4 && trainer[0] == 4 && raider[0] == 4) {
            if (trainer[9] == 75 && raider[9] == 75) {
                peasent[9] = 75;
            }
            if (trainer[9] == 75 || raider[9] == 75){
                if ((trainer[9]+raider[9])/2 >= 76) {
                    if (peasent[1]%2 == 1) {
                        peasent[9] = ((trainer[9]+raider[9])/2)-1
                    } else {
                        peasent[9] = (trainer[9]+raider[9])/2
                    }
                }
            }
            if (trainer[9] > 75 || raider[9] > 75) {
                if (peasent[1]%2 == 1) {
                    peasent[9] = ((trainer[9]+raider[9])/2)-1
                } else {
                    peasent[9] = (trainer[9]+raider[9])/2
                }
            }
            
            if (trainer[5] == 75 && raider[5] == 75) {
                peasent[5] = 75;
            }
            if (trainer[5] == 75 || raider[5] == 75){
                if ((trainer[5]+raider[5])/2 >= 76) {
                    if (peasent[1]%2 == 1) {
                        peasent[5] = ((trainer[5]+raider[5])/2)-1
                    } else {
                        peasent[5] = (trainer[5]+raider[5])/2
                    }
                }
            }
            if (trainer[5] > 75 || raider[5] > 75) {
                if (peasent[1]%2 == 1) {
                    peasent[5] = ((trainer[5]+raider[5])/2)-1
                } else {
                    peasent[5] = (trainer[5]+raider[5])/2
                }
            }
        }
        //IF PEASENT IS TRICKSTER
        if (peasent[0] == 4) {
            if (peasent[1]%2 = 1) {
                peasent[3] = ((raider[3]+trainer[3])/2)-1
                peasent[4] = ((raider[4]+trainer[4])/2)-1
                peasent[6] = ((raider[6]+trainer[6])/2)-1
                peasent[7] = ((raider[7]+trainer[7])/2)-1
                peasent[8] = ((raider[8]+trainer[8])/2)-1
                peasent[10] = ((raider[10]+trainer[10])/2)-1
                peasent[11] = ((raider[11]+trainer[11])/2)-1
                peasent[12] = ((raider[12]+trainer[12])/2)-1
            } else {
                peasent[3] = ((raider[3]+trainer[3])/2)
                peasent[4] = ((raider[4]+trainer[4])/2)
                peasent[6] = ((raider[6]+trainer[6])/2)
                peasent[7] = ((raider[7]+trainer[7])/2)
                peasent[8] = ((raider[8]+trainer[8])/2)
                peasent[10] = ((raider[10]+trainer[10])/2)
                peasent[11] = ((raider[11]+trainer[11])/2)
                peasent[12] = ((raider[12]+trainer[12])/2)
            }
        }
    
        /// 13: Raider/Trainer
        ///     1 = Raider, 2 = Trainer
        ///Right now Ill temporarily set the ration to 4/7 of peasents to be trainers
        if (peasent[1]&7 == 1 || peasent[1]&7 == 2 || peasent[1]&7 == 3 || peasent[1]&7 == 4) {
            peasent[13] = 2;
        } else {
            peasent[13] = 1;
        }
        
        /// 14: Cooldown block
        /// Right now I'll set the cooldown block for raider for 1 month, trainers = 0
        if (peasent[13] == 2) {
            peasent[14] = 0
        }
        if (peasent[13] == 1) {
            peasent[14] = 1
        }
        
        return peasent;
    }
   
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
        // zero otherwise. A non-zero value here is how we know a raider killa
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
    
    
contract KillaBreeding is KillaOwnership {

    /// The Pregnant event is fired when two killas successfully breed and the pregnancy
    ///  timer begins for the raider.
    event Pregnant(address owner, uint256 raiderId, uint256 trainerId, uint256 cooldownEndBlock);

    ///  The minimum payment required to use breedWithAuto(). This fee goes towards
    ///  the gas cost paid by whatever calls giveBirth()
    ///  SET THE FEE FOR THE BIRTH
    uint256 public autoBirthFee;

    // Keeps track of number of pregnant raiders.
    uint256 public pregnantRadiers;

    ///  The address of the sibling contract that is used to implement the
    ///  genetic combination algorithm.
    Genetic public geneticAlgo;

    /// @dev Update the address of the genetic contract,
    /// @param _address An address of a GeneticAlgo contract instance to be used from this point forward.
    function setGeneticAlgoAddress(address _address) external {
        Genetic candidateContract = Genetic(_address);

        require(candidateContract.genetics());

        // Set the new contract address
        geneticAlgo = candidateContract;
    }

    /// @dev Checks that a given killa is able to breed. Requires that the
    ///  current cooldown is finished and also checks that there is
    ///  no pending pregnancy.
    function _isReadyToBreed(Killa _kil) internal view returns (bool) {
        // In addition to checking the cooldownEndBlock, we also need to check to see if
        // the killa has a pending birth; there can be some period of time between the end
        // of the pregnacy timer and the birth event.
        return (_kil.trainerWithId == 0) && (_kil.cooldownEndBlock <= uint64(block.number));
    }

    /// @dev Check if a trainer has authorized breeding with this raider. True if both trainer
    ///  and radier have the same owner, or if the trainer has given mating permission to
    ///  the raiders's owner (via approveBreeding()).
    function _isBreedingPermitted(uint256 _trainerId, uint256 _raiderId) internal view returns (bool) {
        address raiderOwner = killaIndexToOwner[_raiderId];
        address trainerOwner = killaIndexToOwner[_trainerId];

        // Breeding is okay if they have same owner, or if the raider's owner was given
        // permission to breed with this trainer.
        return (radierOwner == trainerOwner || breedAllowedToAddress[_trainerId] == radierOwner);
    }

    /// @dev Set the cooldownEndTime for the given Killa
    /// @param _killa A reference to the Killa in storage which needs its timer started.
    function _triggerCooldown(Killa storage _killa) internal {
        // Compute an estimation of the cooldown time in blocks.
        _killa.cooldownEndBlock = uint64(block.number);
    }

    /// @notice Grants approval to another user to breed with one of your Killas.
    /// @param _addr The address that will be able to breed with your Killa. Set to
    ///  address(0) to clear all breeding approvals for this Killa.
    /// @param _trainerId A Killa that you own that _addr will now be able to breed with.
    function approveBreeding(address _addr, uint256 _trainerId)
        external
    {
        require(_owns(msg.sender, _trainerId));
        breedAllowedToAddress[_trainerId] = _addr;
    }

    /// @dev Updates the minimum payment required for calling giveBirthAuto()
    function setAutoBirthFee(uint256 val) external {
        autoBirthFee = val;
    }

    /// @dev Checks to see if a given raider is pregnant and (if so) if the gestation
    ///  period has passed.
    function _isReadyToGiveBirth(Killa _raider) private view returns (bool) {
        return (_raider.trainerWithId != 0) && (_raider.cooldownEndBlock <= uint64(block.number));
    }

    /// @notice Checks that a given raider is able to breed (i.e. it is not pregnant or
    ///  in the middle of a breeding cooldown).
    /// @param _killaId reference the id of the Killa, any user can inquire about it
    function isReadyToBreed(uint256 _killaId)
        public
        view
        returns (bool)
    {
        require(_killaId > 0);
        Killa storage kil = killas[_killaId];
        return _isReadyToBreed(kil);
    }

    /// @dev Checks whether a raider is currently pregnant.
    /// @param _killaId reference the id of the killa, any user can inquire about it
    function isPregnant(uint256 _killaId)
        public
        view
        returns (bool)
    {
        require(_killaId > 0);
        // A killa is pregnant if and only if this field is set
        return killas[_killaId].trainerWithId != 0;
    }

    /// @dev Internal check to see if a given trainer and raider are a valid mating pair. DOES NOT
    ///  check ownership permissions (that is up to the caller).
    /// @param _raider A reference to the Killa struct of the potential raider.
    /// @param _raiderId The raider's ID.
    /// @param _trainer A reference to the Killa struct of the potential trainer.
    /// @param _trainerId The traine's ID
    function _isValidMatingPair(
        Kitty storage _raider,
        uint256 _raiderId,
        Kitty storage _trainer,
        uint256 _trainerId
    )
        private
        view
        returns(bool)
    {
        // A Killa can't breed with itself
        if (_raiderId == _trainerId) {
            return false;
        }

        // Killa can't breed with their parents.
        if (_raider.raiderId == _trainerId || _raider.trainerId == _trainerId) {
            return false;
        }
        if (_trainer.raiderId == _raiderId || _trainer.trainerId == _raiderId) {
            return false;
        }

        // We can short circuit the sibling check (below) if either killa is
        // gen zero (has a matron ID of zero).
        if (_trainer.raiderId == 0 || _raider.raiderId == 0) {
            return true;
        }

        // Killas can't breed with full or half siblings.
        if (_trainer.raiderId == _raider.raiderId || _trainer.raiderId == _raider.trainerId) {
            return false;
        }
        if (_trainer.trainerId == _raider.raiderId || _trainer.trainerId == _raider.trainerId) {
            return false;
        }
        return true;
    }


    /// @notice Checks to see if two killas can breed together, including checks for
    ///  ownership and breeding approvals. Does NOT check that both killas are ready for
    ///  breeding (i.e. breedWith could still fail until the cooldowns are finished).
    function canBreedWith(uint256 _raiderId, uint256 _trainerId)
        external
        view
        returns(bool)
    {
        require(_raiderId > 0);
        require(_trainerId > 0);
        Killa storage raider = killas[_raiderId];
        Killa storage trainer = killas[_trainerId];
        return _isValidMatingPair(raider, _raiderId, trainer, _trainerId) &&
            _isBreedingPermitted(_trainerId, _raiderId);
    }

    /// @dev Internal utility function to initiate breeding, assumes that all breeding
    ///  requirements have been checked.
    function _breedWith(uint256 _raiderId, uint256 _trainerId) internal {
        // Grab a reference to the Kitties from storage.
        Killa storage trainer = killas[_traineId];
        Killa storage raider = killas[_raiderId];

        // Mark the raider as pregnant, keeping track of who the trainer is.
        raider.trainerWithId = uint32(_trainerId);

        // Trigger the cooldown for both parents.
        _triggerCooldown(trainer);
        _triggerCooldown(raider);

        // Clear breeding permission for both parents
        delete breedAllowedToAddress[_raiderId];
        delete breedAllowedToAddress[_trainerId];

        // Every time a killa gets pregnant, counter is incremented.
        pregnantKillas++;

        // Emit the pregnancy event.
        Pregnant(killaIndexToOwner[_raiderId], _raiderId, _trainerId, raider.cooldownEndBlock);
    }

    /// @notice Breed a Killa you own (as raider) with a trainer that you own, or for which you
    ///  have previously been given Breeding approval. Will either make your killa pregnant, or will
    ///  fail entirely. Requires a pre-payment of the fee given out to the first caller of giveBirth()
    /// @param _raiderId The ID of the Killa acting as raider (will end up pregnant if successful)
    /// @param _trainerId The ID of the Killa acting as trainer (will begin its breeding cooldown if successful)
    function breedWithAuto(uint256 _raiderId, uint256 _trainerId)
        external
        payable
    {
        // Checks for payment.
        require(msg.value >= autoBirthFee);

        // Caller must own the raider.
        require(_owns(msg.sender, _raiderId));

        // Check that raider and trainer are both owned by caller, or that the trainer
        // has given breeding permission to caller (i.e. raiders's owner).
        // Will fail for _trainerId = 0
        require(_isBreedingPermitted(_trainerId, _raiderId));

        // Grab a reference to the potential raider
        Killa storage raider = killas[_raiderId];

        // Make sure raider isn't pregnant, or in the middle of a breeding cooldown
        require(_isReadyToBreed(raider));

        // Grab a reference to the potential trainer
        Killa storage trainer = killas[_trainerId];

        // Make sure trainer isn't in the middle of a breeding cooldown
        require(_isReadyToBreed(trainer));

        // Test that these killas are a valid mating pair.
        require(_isValidMatingPair(
            raider,
            _raiderId,
            trainer,
            _trainerId
        ));

        // All checks passed
        _breedWith(_raiderId, _killaId);
    }

    /// @notice Have a pregnant raider give birth
    /// @param _raiderId A Killa ready to give birth.
    /// @return The Killa ID of the new killa.
    /// @dev Looks at a given Killa and, if pregnant and if the gestation period has passed,
    ///  combines the genes of the two parents to create a new killa. The new Killa is assigned
    ///  to the current owner of the radier. Upon successful completion, both the raider and the
    ///  new killa will be ready to breed again. Note that anyone can call this function (if they
    ///  are willing to pay the gas), but the new killa always goes to the mother's owner.
    function giveBirth(uint256 _raiderId)
        external
        returns(uint256)
    {
        // Grab a reference to the raider in storage.
        Killa storage raider = killas[_raiderId];

        // Check that the raider is a valid killa.
        require(raider.birthTime != 0);

        // Check that the raider is pregnant, and that its time to give birth
        require(_isReadyToGiveBirth(raider));

        // Grab a reference to the trainer in storage.
        uint256 trainerId = raider.trainerWithId;
        Killa storage trainer = killas[trainerId];

        // Determine the higher generation number of the two parents
        uint16 parentGen = raider.generation;
        if (trainer.generation > raider.generation) {
            parentGen = trainer.generation;
        }

        // Call the gene mixing operation.
        uint256 childGenes = geneticAlgo.mixTraits(raider.traits, trainer.traits, raider.cooldownEndBlock - 1);

        // Make the new killa
        address owner = killaIndexToOwner[_raiderId];
        uint256 killaId = _createKilla(_raiderId, raider.trainerWithId, parentGen + 1, childGenes, owner);

        // Clear the reference to trainer from the raider
        delete raider.trainerWithId;

        // Every time a killa gives birth counter is decremented.
        pregnantKillas--;

        // Send the balance fee to the person who made birth happen.
        msg.sender.send(autoBirthFee);

        // return the new killas's ID
        return killaId;
    }
}

/// @dev The main Killas contract, keeps track of killas 
contract KillaCore{
    
    // Set in case the core contract is broken and an upgrade is required
    address public newContractAddress;

    /// @notice Creates the main Killa smart contract instance.
    function KillaCore() public {

        // start with the invalid killa 0 - so we don't have generation-0 parent issues
        _createKitty(0, 0, 0, uint256(-1), address(0));
    }


    /// @notice Returns all the relevant information about a specific killa.
    /// @param _id The ID of the killa of interest.
    function getKilla(uint256 _id)
        external
        view
        returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 trainerWithId,
        uint256 birthTime,
        uint256 raiderId,
        uint256 trainerId,
        uint256 generation,
        uint256 traits
    ) {
        Killa storage kil = killas[_id];

        // if this variable is 0 then it's not gestating
        isGestating = (kil.trainerWithId != 0);
        isReady = (kil.cooldownEndBlock <= block.number);
        cooldownIndex = uint256(kil.cooldownIndex);
        nextActionAt = uint256(kil.cooldownEndBlock);
        trainerWithId = uint256(kil.trainerWithId);
        birthTime = uint256(kil.birthTime);
        raiderId = uint256(kil.raiderId);
        trainerId = uint256(kik.trainerId);
        generation = uint256(kil.generation);
        traits = kil.traits;
    }
}
