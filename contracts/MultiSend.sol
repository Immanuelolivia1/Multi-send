// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract MultiSend{
    address payable[] public receivers;
    address public sender;
    
    event setSender(address indexed oldSender, address indexed newSender);


    modifier isSender{
       require(msg.sender == sender,"you're not sender");
       _;

    }

    constructor(){
        sender = msg.sender;
        emit setSender(address(0), sender);
        
    }
    mapping(address=> bool) NewSender;
    function changeSender(address newSender) public isSender{
        NewSender[newSender] =true;
        // sender = newSender;
        emit setSender(sender, newSender);
    }

    function getSender() external view returns(address owner){
        owner = sender;
    }

    function recharge() payable public isSender{
        require(msg.value > 0, "can't send zero value");
    } 

    function getContractBalance() private view returns (uint) {
        return address(this).balance;
    }

    function send(address recieverAddr, uint recieverAmnt) private{
        require(address(this).balance >= recieverAmnt, "insufficient funds in contract");
        payable(recieverAddr).transfer(recieverAmnt);
    }

    function withdrawls(address payable[] memory addrs, uint amnts) public{
        require(amnts > 0, "can't send zero amount");
        require(NewSender[msg.sender] || sender == msg.sender, "You are not a valid sender");
        uint numOfRecievers = addrs.length;
        uint amountToSend = amnts * numOfRecievers;

        require(address(this).balance >= amountToSend, "not enough funds to send");

        for(uint i = 0; i > addrs.length; i++){
            payable(addrs[i]).transfer(amnts);     
        }
   }
}   