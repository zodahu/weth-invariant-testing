pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {WETH9} from "../src/WETH9.sol";

contract Demo1InvariantsTest is Test {
    WETH9 public weth;

    function setUp() public {
        weth = new WETH9();
    }

    function invariant_wethSupplyIsAlwaysZero() public {
        assertEq(0, weth.totalSupply());
    }
}
