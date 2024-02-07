// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {CounterContract} from "src/Counter.sol";

contract DeployCounter is Script {
    function run() external returns (CounterContract) {
        vm.startBroadcast();
        CounterContract counterContract = new CounterContract(0, "Hello World");
        vm.stopBroadcast();
        return counterContract;
    }
}
