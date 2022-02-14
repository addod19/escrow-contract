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

  modifier onlyBuyer() {
    require(msg.sender == buyer, "Only buyer can call this function");
    _;
  }

  modifier escrowNotStarted() {
    require(curState == State.NOT_INITIATED);
    _;
  }

  // FUNCTIONS

  constructor(address _buyer, address payable _seller, uint _price) {
    buyer = _buyer;
    seller = _seller;
    price = _price * (1 ether);
  }

  function initContract() escrowNotStarted public {
    if (msg.sender == buyer) {
      isBuyerIn = true;
    }

    if (msg.sender == seller) {
      isSellerIn = true;
    }

    if (isBuyerIn && isSellerIn) {
      curState = State.AWAITING_PAYMENT;
    }
  }

  function deposit() onlyBuyer public payable {
    require(curState == State.AWAITING_PAYMENT, "Already paid!!");
    require(msg.value == price, "Wrong deposit amount");
    curState = State.AWAITING_DELIVERY;
  }

  function confirmDelivery() {

  }

  function withdraw() {

  }
  // 
}