// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title A simple linked list implementation in Solidity
contract FifthApproach {
    struct Node {
        uint256 data;
        address next;
    }

    mapping(address => Node) private  nodes;
    address private head;

    constructor() {
        head = address(0);
    }

    /// @notice Adds a new node to the list
    /// @param _addr The address to be used as the node identifier
    /// @param _data The data to be stored in the node
    function addNode(address _addr, uint256 _data) external payable {
        require(nodes[_addr].next == address(0), "Node already exists");
        nodes[_addr] = Node({data: _data, next: head});
        head = _addr;
    }

    /// @notice Retrieves a node's data and the next node's address
    /// @param _addr The address of the node to retrieve
    /// @return The data and the next node's address
    function getNode(address _addr) external view returns (uint256, address) {
        Node memory node = nodes[_addr];
        return (node.data, node.next);
    }

    /// @notice Updates a node's data
    /// @param _addr The address of the node to update
    /// @param _newData The new data to be stored in the node
    function updateNodeData(address _addr, uint256 _newData) internal {
        require(nodes[_addr].next != address(0) || head == _addr, "Node does not exist");
        nodes[_addr].data = _newData;
    }

    /// @notice Removes a node from the list
    /// @param _addr The address of the node to remove
    function removeNode(address _addr) external payable {
        require(nodes[_addr].next != address(0) || head == _addr, "Node does not exist");
        address iterator = head;
        address prev = address(0);
        while (iterator != _addr && iterator != address(0)) {
            prev = iterator;
            iterator = nodes[iterator].next;
        }
        if (prev == address(0)) {
            head = nodes[head].next; // Removing the head node
        } else {
            nodes[prev].next = nodes[iterator].next; // Removing a middle or tail node
        }
        delete nodes[_addr];
    }

    function entryAdd(address _addr, uint256 number) external payable {
        updateNodeData(_addr, nodes[_addr].data + number);
    }

    function entrySub(address _addr, uint256 number) external payable {
        updateNodeData(_addr, nodes[_addr].data - number);
    }
}
