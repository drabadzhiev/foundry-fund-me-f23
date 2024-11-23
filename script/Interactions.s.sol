// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.1 ether;

    function fundFundMe(address mostRecentDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployed)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded FundMe with %s", SEND_VALUE);
    }

    function run() external {
        address MostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        FundFundMe(MostRecentDeployed);
    }
}
contract WithdrawFundMe is Script {
    uint256 constant SEND_VALUE = 0.1 ether;

    function withdrawFundMe(address mostRecentDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployed)).withdraw();
        vm.stopBroadcast();
        console.log("Withdraw FundMe  balance");
    }

    function run() external {
        address MostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        withdrawFundMe(MostRecentDeployed);
    }
}
