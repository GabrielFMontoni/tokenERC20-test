// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TokenERC20 {
    string _name;
    string _symbol;
    uint8 _decimal;
    uint256 _totalSupply;

    event Transfer(address from, address _to, uint256 ammount);
    event Approval(address _owner, address _spender, uint256 _value);

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimal;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    mapping(address => uint256) balances;

    function balanceOf(address _owner) public view returns (uint256) {
        uint256 balanceOfUser = balances[_owner];
        return balanceOfUser;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value, "INSUFFICIENT AMMOUNT");
        balances[msg.sender] -= _value;
        balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    mapping(address => mapping(address => uint256)) allowances;

    function transferFrom(address _from, address _to, uint256 _value) public {
        require(allowances[_from][msg.sender] >= _value, "INSUFFICIENT ALLOWANCE");

        balances[_from] -= _value;
        balances[_to] += _value;

        emit Transfer(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
    }

    function allowance(address _owner, address _spender) public view returns (uint256){
        return allowances[_owner][_spender];
    }

    constructor(){
        _name = "Gabriel Montoni First Contract";
        _symbol = "GFM";
        _decimal = 18;


        _totalSupply = 10000 * 10e18;
        balances[msg.sender] = _totalSupply; 
    }
}
