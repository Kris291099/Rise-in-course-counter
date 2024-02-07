// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {CounterContract} from "src/Counter.sol";
import {DeployCounter} from "script/DeployCounter.s.sol";

contract CounterTest is Test {
    CounterContract public counterContract;
    address owner;

    function setUp() external {
        owner = msg.sender;
        DeployCounter deployer = new DeployCounter();
        counterContract = deployer.run();
    }

    function testIncrementCounter() public {
        // Act: Call the increment function
        vm.prank(owner);

        // Assert: Check that the counter has been incremented
        uint expected = 1;
        counterContract.increment_counter();
        assert(expected == counterContract.get_counter_value());
    }

    function testDecrementCounter() public {
        vm.prank(owner);

        // Arrange: Ensure the counter is at least  1 to decrement
        counterContract.increment_counter();

        // Assert: Check that the counter has been decremented
        uint expected = 0;
        vm.prank(owner);
        counterContract.decrement_counter();
        assert(expected == counterContract.get_counter_value());
    }

    // Test incrementing the counter
    function testInitialCounterValue() public {
        uint expected = 0;
        uint actual = counterContract.get_counter_value();
        assertEq(actual, expected, "The counter should start at  0.");
    }

    // Test that the counter description is retrieved correctly
    function testGetDescription() public {
        string memory expected = "Hello World";
        string memory actual = counterContract.get_counter_description();
        assertEq(
            actual,
            expected,
            "The counter description should match the initialized value."
        );
    }
}
