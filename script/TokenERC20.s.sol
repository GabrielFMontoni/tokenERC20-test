// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {TokenERC20} from "../src/TokenERC20.sol";

contract TokenERC20Script is Script {
    TokenERC20 token;

    function setUp() public {}


    function run() public {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);


        // deploy do contrato
        token = new TokenERC20();

        console2.log("Address: ", address(token));

    
        
        vm.stopBroadcast();
    }
}
//cast call --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url "http://127.0.0.1:8545" 0x68B1D87F95878fE05B998F19b66F4baba5De1aed "getValue()(bool)"