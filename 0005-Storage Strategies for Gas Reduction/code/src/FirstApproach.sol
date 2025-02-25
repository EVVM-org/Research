// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

contract FirstApproach {
    
    mapping(address user => mapping(address token => uint256 quantity)) public data;

    function entryInit(
        address _token,
        address _user,
        uint256 _initQuantity
    ) public {
        data[_user][_token] = _initQuantity;
    }

    function entryAdd(
        address _token,
        address _user,
        uint256 _addQuantity
    ) public {
        data[_user][_token] += _addQuantity;
    }

    function entrySub(
        address _token,
        address _user,
        uint256 _subQuantity
    ) public {
        data[_user][_token] -= _subQuantity;
    }

    function entryGet(address _token, address _user) public view returns (uint256) {
        return data[_user][_token];
    }
}
