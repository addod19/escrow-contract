pragma solidity >=0.4.22 <0.9.0;

contract Escrow {
  // VARIABLES
  enum State {
    NOT_INITIATED, AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE
  }

  State public curState;
  bool public isBuyerIn;
  bool public isSellerIn;

  uint public price;
  address public buyer;
  address payable public seller;

  // MODIFIERS

  // FUNCTIONS

  constructor() {

  }

  function initContract() {

  }

  function deposit() {

  }

  function confirmDelivery() {

  }

  function withdraw() {

  }
  // 
}