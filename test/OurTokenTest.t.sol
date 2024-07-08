// SPDX-License-Identifier: MIT

// pragma solidity ^0.8.18;

// import {Test} from "forge-std/Test.sol";
// import {DeployOurToken} from "../script/DeployOurToken.s.sol";
// import {OurToken} from "../src/OurToken.sol";

// contract OurTokenTest is Test {
//     DeployOurToken deployer;
//     OurToken ourToken;

//     address harry = makeAddr("harry");
//     address jerry = makeAddr("jerry");

//     uint256 public constant STARTING_BALANCE = 1000 ether;
//     uint256 public constant INITIAL_SUPPLY = 10000 ether;

//     function setUp() public {
//         deployer = new DeployOurToken();
//         ourToken = deployer.run();

//         vm.prank(msg.sender);
//         ourToken.transfer(harry, STARTING_BALANCE);
//     }

//     // Test the initial supply and minting
//     function testInitialSupply() public {
//         assertEq(ourToken.totalSupply(), INITIAL_SUPPLY);
//     }

//     // Test harry's balance
//     function testHarryBalance() public {
//         assertEq(STARTING_BALANCE, ourToken.balanceOf(harry));
//     }

//     // Test allowances and transferFrom
//     function testAllowancesWorks() public {
//         uint256 initialAllowance = 1000 ether;

//         vm.prank(harry);
//         ourToken.approve(jerry, initialAllowance);

//         uint256 transferAmount = 500 ether;

//         vm.prank(jerry);
//         ourToken.transferFrom(harry, jerry, transferAmount);

//         assertEq(ourToken.balanceOf(jerry), transferAmount);
//         assertEq(ourToken.balanceOf(harry), STARTING_BALANCE - transferAmount);
//     }

//     // Test approval event
//     function testApprovalEvent() public {
//         uint256 initialAllowance = 1000 ether;

//         vm.prank(harry);
//         vm.expectEmit(true, true, true, true);
//         emit Approval(harry, jerry, initialAllowance);
//         ourToken.approve(jerry, initialAllowance);
//     }

//     // Test transfer event
//     function testTransferEvent() public {
//         uint256 transferAmount = 500 ether;

//         vm.prank(harry);
//         vm.expectEmit(true, true, true, true);
//         emit Transfer(harry, jerry, transferAmount);
//         ourToken.transfer(jerry, transferAmount);
//     }

//     // Test transfer of zero tokens
//     function testZeroTransfer() public {
//         vm.prank(harry);
//         ourToken.transfer(jerry, 0);

//         assertEq(ourToken.balanceOf(harry), STARTING_BALANCE);
//         assertEq(ourToken.balanceOf(jerry), 0);
//     }

//     // Test transfer more than available balance
//     function testInsufficientBalance() public {
//         uint256 transferAmount = 2000 ether;

//         vm.prank(harry);
//         vm.expectRevert("ERC20: transfer amount exceeds balance");
//         ourToken.transfer(jerry, transferAmount);
//     }

//     // Test increase allowance
//     function testIncreaseAllowance() public {
//         uint256 initialAllowance = 500 ether;
//         uint256 additionalAllowance = 500 ether;

//         vm.prank(harry);
//         ourToken.approve(jerry, initialAllowance);

//         vm.prank(harry);
//         ourToken.increaseAllowance(jerry, additionalAllowance);

//         assertEq(
//             ourToken.allowance(harry, jerry),
//             initialAllowance + additionalAllowance
//         );
//     }

//     // Test decrease allowance
//     function testDecreaseAllowance() public {
//         uint256 initialAllowance = 1000 ether;
//         uint256 reductionAmount = 500 ether;

//         vm.prank(harry);
//         ourToken.approve(jerry, initialAllowance);

//         vm.prank(harry);
//         ourToken.decreaseAllowance(jerry, reductionAmount);

//         assertEq(
//             ourToken.allowance(harry, jerry),
//             initialAllowance - reductionAmount
//         );
//     }

//     // Test transferFrom with insufficient allowance
//     function testInsufficientAllowance() public {
//         uint256 initialAllowance = 500 ether;
//         uint256 transferAmount = 1000 ether;

//         vm.prank(harry);
//         ourToken.approve(jerry, initialAllowance);

//         vm.prank(jerry);
//         vm.expectRevert("ERC20: insufficient allowance");
//         ourToken.transferFrom(harry, jerry, transferAmount);
//     }

//     // Test approve and transferFrom with full allowance usage
//     function testFullAllowanceUsage() public {
//         uint256 initialAllowance = 500 ether;
//         uint256 transferAmount = 500 ether;

//         vm.prank(harry);
//         ourToken.approve(jerry, initialAllowance);

//         vm.prank(jerry);
//         ourToken.transferFrom(harry, jerry, transferAmount);

//         assertEq(ourToken.allowance(harry, jerry), 0);
//         assertEq(ourToken.balanceOf(jerry), transferAmount);
//         assertEq(ourToken.balanceOf(harry), STARTING_BALANCE - transferAmount);
//     }
// }

//............................................................................................................

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    DeployOurToken deployer;
    OurToken ourToken;

    address harry = makeAddr("harry");
    address jerry = makeAddr("jerry");

    uint256 public constant STARTING_BALANCE = 1000 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(msg.sender);
        ourToken.transfer(harry, STARTING_BALANCE);
    }

    function testHarryBalance() public {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(harry));
    }

    function testAllowancesWorks() public {
        //transferFrom
        uint256 initialAllowance = 1000 ether;

        vm.prank(harry);
        ourToken.approve(jerry, initialAllowance);

        uint256 transferAmount = 500 ether;

        vm.prank(jerry);
        ourToken.transferFrom(harry, jerry, transferAmount);

        assertEq(ourToken.balanceOf(jerry), transferAmount);
        assertEq(ourToken.balanceOf(harry), STARTING_BALANCE - transferAmount);
    }
}
