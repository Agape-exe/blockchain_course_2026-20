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

    function agregarElemento(
        uint256 idProducto,
        string memory nombreProducto,
        string memory categoriaProducto,
        uint256 cantidad
    ) public {
        require(idProducto % 2 == 0);

        Producto memory nuevoProducto = Producto({
            id: idProducto,
            nombre: nombreProducto,
            categoria: categoriaProducto,
            stock: cantidad
        });

        inventario.push(nuevoProducto);
    }

    function contarElementos() public view returns (uint256) {
        return inventario.length;
    }

    function cambiarDireccion(address nuevaDireccion) public {
        direccion = nuevaDireccion;
    }
}