// SPDX-License-Identifier:MIT
pragma solidity >=0.4.22 <0.9.0;

contract Donation {
     address public owner;
    //address owner = 0x817E7802A5954c5FCF827e9B90DD5Ce875ab8A9F;
    mapping(address => uint256) donationList;

    event Donate(address indexed sender, uint256 value);
    event Withdraw(address indexed owner, uint256 value);

    modifier onlyOwner(){
        require(msg.sender == owner,"Only owner can access this function");
        _;
    }

    constructor(){
        //將合約的擁有者設定成建立合約的人
        owner = msg.sender;
    }

    //收受時間幣的函式
    function donate() public payable{
        donationList[msg.sender] += msg.value;
        emit Donate(msg.sender,msg.value);

        address payable receiver = payable(owner);
        uint256 value = address(this).balance;
        receiver.transfer(value);
        emit Withdraw(receiver, value);
    }

    //查詢總時間幣
    function getHistory() public view returns (uint256){
        return donationList[msg.sender];
    }
        
}