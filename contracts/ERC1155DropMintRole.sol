// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "@thirdweb-dev/contracts/base/ERC1155Drop.sol";
import "@thirdweb-dev/contracts/extension/Permissions.sol";

contract ERC1155DropMintRole is ERC1155Drop, Permissions {
    bytes32 public constant MINT_ROLE = keccak256("MINT_ROLE");

    constructor(
        address _defaultAdmin,
        string memory _name,
        string memory _symbol,
        address _royaltyRecipient,
        uint128 _royaltyBps,
        address _primarySaleRecipient
    ) ERC1155Drop(_defaultAdmin, _name, _symbol, _royaltyRecipient, _royaltyBps, _primarySaleRecipient) {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data) public onlyRole(MINT_ROLE) {
        _mint(account, id, amount, data);
    }
}
