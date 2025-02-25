// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.0;

import {IMailbox} from "./IMailbox.sol";

contract sender {
    IMailbox public mailbox =
        IMailbox(0xfFAEF09B3cd11D9b20d1a19bECca54EEC2884766);

    function send(address _to, uint32 chain) public payable {
        // send message from sepolia to mumbai TestRecipient
        bytes32 messageId = mailbox.dispatch{value: msg.value}(
            chain,
            _castAddr(_to),
            bytes("Hello from eth sepolia")
        );
    }

    function _castAddr(address addr_) public pure returns (bytes32) {
        return bytes32(uint256(uint160(addr_)));
    }
}

import "./IMessageRecipient.sol";
contract reciever {
    uint32 lastOrigin;
    bytes32 lastSender;
    bytes lastData;
    function handle(
        uint32 _origin,
        bytes32 _sender,
        bytes calldata _data
    ) external payable virtual {
        lastOrigin = _origin;
        lastSender = _sender;
        lastData = _data;
    }

    function seeData() public view returns(uint32, bytes32, bytes memory) {
        return (lastOrigin, lastSender, lastData);
    }
}
