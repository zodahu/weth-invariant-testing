pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {WETH9} from "../src/WETH9.sol";
import {Handler} from "./handlers/Demo5.Handler.sol";

contract Demo5InvariantsTest is Test {
    WETH9 public weth;
    Handler public handler;

    function setUp() public {
        weth = new WETH9();
        handler = new Handler(weth);

        targetContract(address(handler));
    }

    // The WETH contract's Ether balance should always
    // equal the sum of all the individual deposits
    // minus all the individual withdrawals
    function invariant_solvencyDeposits() public {
        assertEq(
          address(weth).balance,
          handler.ghost_depositSum() - handler.ghost_withdrawSum()
        );
    }
}
