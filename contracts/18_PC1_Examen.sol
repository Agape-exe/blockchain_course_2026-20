// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.1 <0.9.0;

contract Almacen253703 {

    struct Producto {
        uint256 id;
        string nombre;
        string categoria;
        uint256 stock;
    }

    Producto[] public inventario;

    uint256 public posicion;
    address public direccion;

    constructor(uint256 valorPosicion) {
        posicion = valorPosicion;
        direccion = msg.sender;
    }
}