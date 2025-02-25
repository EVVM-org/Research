// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";

import {FirstApproach} from "../src/FirstApproach.sol";
import {SecondApproach} from "../src/SecondApproach.sol";
import {ThirdApproach} from "../src/ThirdApproach.sol";
import {FourthApproach} from "../src/FourthApproach.sol";
import {FifthApproach} from "../src/FifthApproach.sol";

contract ApproachTest is Test {
    FirstApproach public firstIter;
    SecondApproach public secondIter;
    ThirdApproach public thirdIter;
    FourthApproach public fourthIter;
    FifthApproach public fifthIter;

    address USER = makeAddr("USER");

    uint256 public constant MAX_MOCK_TOKENS = 10000;

    address[MAX_MOCK_TOKENS] public mockTokens;

    uint256 initQuantity = 1000000000000000000;

    function setUp() public {}

    modifier setMockTokens() {
        for (uint256 i = 1; i < MAX_MOCK_TOKENS + 1; i++) {
            //console2.log("i ", i);
            //console2.log("address ", vm.addr(i));
            mockTokens[i - 1] = vm.addr(i);
        }
        _;
    }

    function test_FirstApproach() public setMockTokens {
        firstIter = new FirstApproach();
        uint256 iter = 0;
        // using entryInit
        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            firstIter.entryInit(mockTokens[iter], address(USER), initQuantity);
        }
        assertEq(firstIter.entryGet(mockTokens[1], address(USER)), 1000000000000000000);

        // using entryAdd

        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            firstIter.entryAdd(mockTokens[iter], address(USER), initQuantity);
        }

        assertEq(firstIter.entryGet(mockTokens[1], address(USER)), 2000000000000000000);

        // using entrySub

        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            firstIter.entrySub(mockTokens[iter], address(USER), initQuantity);
        }

        assertEq(firstIter.entryGet(mockTokens[1], address(USER)), 1000000000000000000);

        // verify every token has the same balance using entryGet
        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            assertEq(firstIter.entryGet(mockTokens[iter], address(USER)), 1000000000000000000);
        }
    }

    function test_SecondApproach() public setMockTokens {
        secondIter = new SecondApproach();
        uint256 iter = 0;
        // using entryInit
        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            secondIter.entryInit(mockTokens[iter], address(USER), initQuantity);
        }
        assertEq(secondIter.entryGet(mockTokens[1], address(USER)), 1000000000000000000);

        // using entryAdd

        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            secondIter.entryAdd(mockTokens[iter], address(USER), initQuantity);
        }

        assertEq(secondIter.entryGet(mockTokens[1], address(USER)), 2000000000000000000);

        // using entrySub

        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            secondIter.entrySub(mockTokens[iter], address(USER), initQuantity);
        }

        assertEq(secondIter.entryGet(mockTokens[1], address(USER)), 1000000000000000000);

        // verify every token has the same balance using entryGet
        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            assertEq(secondIter.entryGet(mockTokens[iter], address(USER)), 1000000000000000000);
        }
    }

    function test_ThirdApproach() public setMockTokens {
        thirdIter = new ThirdApproach();
        uint256 iter = 0;
        // using entryInit
        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            thirdIter.entryInit(mockTokens[iter], address(USER), initQuantity);
        }
        assertEq(thirdIter.entryGet(mockTokens[1], address(USER)), 1000000000000000000);

        // using entryAdd

        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            thirdIter.entryAdd(mockTokens[iter], address(USER), initQuantity);
        }

        assertEq(thirdIter.entryGet(mockTokens[1], address(USER)), 2000000000000000000);

        // using entrySub

        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            thirdIter.entrySub(mockTokens[iter], address(USER), initQuantity);
        }

        assertEq(thirdIter.entryGet(mockTokens[1], address(USER)), 1000000000000000000);

        // verify every token has the same balance using entryGet
        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            assertEq(thirdIter.entryGet(mockTokens[iter], address(USER)), 1000000000000000000);
        }
    }

    
    function test_FourthApproach() public setMockTokens {
        fourthIter = new FourthApproach();
        uint256 iter = 0;
        // using entryInit
        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            fourthIter.entryInit(mockTokens[iter], address(USER), initQuantity);
        }
        assertEq(fourthIter.entryGet(mockTokens[1], address(USER)), 1000000000000000000);

        // using entryAdd

        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            fourthIter.entryAdd(mockTokens[iter], address(USER), initQuantity);
        }

        assertEq(fourthIter.entryGet(mockTokens[1], address(USER)), 2000000000000000000);

        // using entrySub

        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            fourthIter.entrySub(mockTokens[iter], address(USER), initQuantity);
        }

        assertEq(fourthIter.entryGet(mockTokens[1], address(USER)), 1000000000000000000);

        // verify every token has the same balance using entryGet
        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            assertEq(fourthIter.entryGet(mockTokens[iter], address(USER)), 1000000000000000000);
        }
    }

    function test_FifthApproach() public setMockTokens {
        fifthIter = new FifthApproach();
        uint256 iter = 0;
        //using addNode

        fifthIter.addNode(address(USER), 0);
        
        //using addNode
        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            fifthIter.addNode(mockTokens[iter], initQuantity);
        }
        // using entryAdd

        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            fifthIter.entryAdd(mockTokens[iter], initQuantity);
        }

        
        // using entrySub

        for (iter = 0; iter < MAX_MOCK_TOKENS; iter++) {
            console2.log("loging iter ", iter);
            console2.log("loging ", mockTokens[iter]);
            fifthIter.entrySub(mockTokens[iter], initQuantity);
        }

        
    }    

}
