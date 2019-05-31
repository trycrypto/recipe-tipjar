pragma solidity  >=0.4.24;

contract TipJar {

    /********************************************************************************************/
    /*                                       DATA VARIABLES                                     */
    /********************************************************************************************/

    struct Item {
        string title;
        string url;
        uint256 tips;
    }

    mapping(bytes32 => Item) public items;
    bytes32[] public itemLookup;

    /********************************************************************************************/
    /*                                       CONSTRUCTOR                                        */
    /********************************************************************************************/

    constructor() public 
    {
        setContractOwner(); // Required...do NOT delete
    }

    /********************************************************************************************/
    /*                                         FUNCTIONS                                        */
    /********************************************************************************************/

    function addItem(string title, string url) external requireContractOwner {

        bytes32 key = keccak256(abi.encodePacked(title,url));
        items[key] = Item({
            title: title,
            url: url,
            tips: 0
        });

        itemLookup.push(key);
    }

    function getItems() external view returns(bytes32[] memory) {
        return itemLookup;
    }

    function getItem(bytes32 key) external view returns(string memory, string memory, uint256) {
        return (items[key].title, items[key].url, items[key].tips);
    }

    function tip(bytes32 key) external payable returns(string memory, string memory, uint256) {
        uint total = items[key].tips + msg.value;
        assert(total >= items[key].tips);

        items[key].tips = total;
        contractOwner.transfer(msg.value);
        emit TipReceived(items[key].title, msg.value, msg.sender);

        return (items[key].title, items[key].url, items[key].tips);

    }

    /********************************************************************************************/
    /*                                           EVENTS                                         */
    /********************************************************************************************/

    event TipReceived(string title, uint256 tip, address indexed tipper);


    /********************************************************************************************/
    /*                                       CONTRACT OWNER                                     */
    /********************************************************************************************/
    
    address public contractOwner;          // Account used to deploy contract

    modifier requireContractOwner()
    {
        require(msg.sender == contractOwner, "Caller is not contract owner");
        _;
    }

    function setContractOwner() internal {
        contractOwner = msg.sender;
    }


    /********************************************************************************************/
    /*                                         SMART PAGE                                       */
    /********************************************************************************************/
    bytes32 public smartPageConfig;         // Hash of SmartPage configuration

    function updateSmartPageConfig(bytes32 configHash) external requireContractOwner {
        require(configHash[0] != 0, "Invalid SmartPage Config hash");

        smartPageConfig = configHash;
    }

    function getSmartPageConfig() external view returns(bytes32) {
        return smartPageConfig;
    }


}   

