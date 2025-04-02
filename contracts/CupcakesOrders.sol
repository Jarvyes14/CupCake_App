// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract CupcakesOrders {
    address public owner;

    struct Cupcake {
        string flavor;
        string[] ingredients;
    }

    struct Order {
        uint id;
        address customer;
        Cupcake[] cupcakes;
    }

    Order[] private orders;
    uint private nextOrderId;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
        nextOrderId = 1;
    }

    function addOrder(string[] calldata flavors, string[][] calldata ingredients) external {
        require(flavors.length > 0, "At least one flavor is required");
        require(ingredients.length > 0, "At least one ingredient set is required");
        require(flavors.length == ingredients.length, "Mismatch in cupcakes data");

        Order storage newOrder = orders.push();
        newOrder.id = nextOrderId;
        newOrder.customer = msg.sender;

        for (uint i = 0; i < flavors.length; i++) {
            require(bytes(flavors[i]).length > 0, "Flavor cannot be empty");
            require(ingredients[i].length > 0, "Ingredients cannot be empty");

            string[] memory ingr = new string[](ingredients[i].length);
            for (uint j = 0; j < ingredients[i].length; j++) {
                ingr[j] = ingredients[i][j];
            }

            newOrder.cupcakes.push(Cupcake(flavors[i], ingr));
        }

        nextOrderId++;
    }

    function getOrder(uint orderId) external view returns (string[] memory, string[][] memory, address) {
        require(orderId > 0 && orderId <= orders.length, "Order does not exist");

        Order storage order = orders[orderId - 1];
        uint cupcakeCount = order.cupcakes.length;

        string[] memory flavors = new string[](cupcakeCount);
        string[][] memory ingredients = new string[][](cupcakeCount);

        for (uint i = 0; i < cupcakeCount; i++) {
            flavors[i] = order.cupcakes[i].flavor;
            string[] memory ingr = new string[](order.cupcakes[i].ingredients.length);
            for (uint j = 0; j < order.cupcakes[i].ingredients.length; j++) {
                ingr[j] = order.cupcakes[i].ingredients[j];
            }
            ingredients[i] = ingr;
        }

        return (flavors, ingredients, order.customer);
    }

    function getTotalOrders() external view returns (uint) {
        return orders.length;
    }
}
