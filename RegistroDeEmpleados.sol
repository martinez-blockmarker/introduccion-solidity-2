// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegistroDeEmpleado{

    address public propietario;

    struct Empleado {
        uint256 idEmpleado; 
        string nombre;
        uint256 salario;
    }
  }
    
    mapping (uint256 => Empleado) public empleados;
   
    
    constructor() {
        propietario = msg.sender;
    }

    function agregarEmpleado(
        uint256 _idEmpleado,
        string memory _nombre,
        uint256 _salario
    ) public {
      
        
        require(propietario == msg.sender, "Error: No eres el propietario");

        require(empleados [_idEmpleado].idEmpleado != 0, "Error: El empleado ya existe");
          
        empleados [_idEmpleado] = Empleado(
            _idEmpleado,
            _nombre,  
            _salario
        );

    }

    
    function  obtenerEmpleado (uint256 _idEmpleado) public view returns(
        uint256, 
        string memory, 
        uint256
    ){
    
        require(empleados [_idEmpleado].idEmpleado != 0, "Error: El empleado NO existe");

            return (
            empleados[_idEmpleado].idEmpleado,
            empleados[_idEmpleado].nombre,
            empleados[_idEmpleado].salario
            );

       
    }


    function actualizarSalarioEmpleado(  
       uint256 _idEmpleado,
       uint256 _salario 
    ) public {

        require(propietario == msg.sender, "Error. No eres el propietario");
        require(empleado [_id.Empleado].idEmpleado !=0, "Error: el empleado no existe");

        empleados[_id.Empleado].salario = _salario;
    }
    
    function eliminarEmpleado(uint256 _idEmpleado) public {
        
        require(propietario == msg.sender, "Error. No eres el propietario");
       
        require(empleado[_idEmpleado].idEmpleado !=0, "Error: el empleado no existe");
               
       delete empleados[_id.Empleado];
    }
