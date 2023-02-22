pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {WETH9} from "../src/WETH9.sol";
import {Handler} from "./handlers/Demo3.Handler.sol";

contract Demo3InvariantsTest is Test {
    WETH9 public weth;
    Handler public handler;

    function setUp() public {
        weth = new WETH9();
        handler = new Handler(weth);

        targetContract(address(handler));
    }

    function invariant_conservationOfETH() public {
        assertEq(
          handler.ETH_SUPPLY(),
          address(handler).balance + weth.totalSupply()
        );
    }
}
