// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "lib/forge-std/src/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe){
        
        // Before startBroadCast -> not a real transaction
        HelperConfig helperconfig = new HelperConfig();
        address ethUsdPriceFeed  = helperconfig.activeNetworkConfig();

        // After startBroadCast -> real transaction
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
