// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

interface IMultiSend {

    function changeSender(address newSender) external;

    function getSender() external view returns(address owner);

    function recharge() payable external;

    function getContractBalance() external returns (uint);
    function send(address recieverAddr, uint recieverAmnt) external;

    function withdrawls(address[] memory addrs, uint amnts) external;
}   