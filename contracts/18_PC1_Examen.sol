// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.1 <0.9.0;

import "hardhat/console.sol";

contract Almacen253703 {

    struct Producto {
        uint256 id;
        string nombre;
        string categoria;
        uint256 stock;
        bool estado;
    }

    Producto[] public inventario;

    uint256 public posicion;
    address public direccion;

    constructor(uint256 valorPosicion) {
        posicion = valorPosicion;
        direccion = msg.sender;
    }

    function agregarElemento(
        uint256 idProducto,
        string memory nombreProducto,
        string memory categoriaProducto,
        uint256 cantidad,
        bool estadoProducto
    ) public {
        require(idProducto % 2 == 0);

        Producto memory nuevoProducto = Producto({
            id: idProducto,
            nombre: nombreProducto,
            categoria: categoriaProducto,
            stock: cantidad,
            estado: estadoProducto
        });

        inventario.push(nuevoProducto);
    }

    function contarElementos() public view returns (uint256) {
        return inventario.length;
    }

    function cambiarDireccion(address nuevaDireccion) public {
        direccion = nuevaDireccion;
    }

    function mostrarActivos() external view {
        for (uint256 indice = 0; indice < inventario.length; indice++) {
            if (inventario[indice].estado) {
                console.log(
                    "Producto activo",
                    inventario[indice].id,
                    inventario[indice].nombre
                );
            }
        }
    }
}