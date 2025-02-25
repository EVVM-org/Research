// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

contract ThirdApproach {

    mapping(bytes32 userTokenHash => uint256 quantity) private data;

    function entryInit(
        address _token,
        address _user,
        uint256 _initQuantity
    ) external {
        
        data[ sha256(abi.encodePacked(_user, _token))] = _initQuantity;
        
    }

    function entryAdd(
        address _token,
        address _user,
        uint256 _addQuantity
    ) external {
        data[sha256(abi.encodePacked(_user, _token))] += _addQuantity;
    }

    function entrySub(
        address _token,
        address _user,
        uint256 _subQuantity
    ) external {
        data[sha256(abi.encodePacked(_user, _token))]  -= _subQuantity;
    }

    function entryGet(address _token, address _user) external view returns (uint256) {
        return data[sha256(abi.encodePacked(_user, _token))] ;
    }
}
