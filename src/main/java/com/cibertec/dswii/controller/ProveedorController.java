package com.cibertec.dswii.controller;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cibertec.dswii.entity.Proveedor;
import com.cibertec.dswii.service.imp.ProveedorServiceImp;

@RestController
@RequestMapping("/proveedor")
public class ProveedorController {
	
	@Autowired
	ProveedorServiceImp repo;
	
	@GetMapping("/list")
    public ArrayList<Proveedor> listarProveedores(){
        return (ArrayList<Proveedor>) repo.listProveedores();
        
    }
	
	@GetMapping(path="/list/{id}") /*elimina el path si es necesario, funciona igual*/
	public Optional<Proveedor> obtenerProveedorxId(@PathVariable("id") Integer id){
		
		return repo.findProveedor(id);
	}
	
	@PostMapping("/save")
	public Proveedor guardarProveedor(@RequestBody Proveedor cat) {
		return this.repo.saveProveedor(cat);
	}
	
	@PutMapping("/edit")
	public Proveedor editingProveedor(@RequestBody Proveedor cat) {
		return this.repo.saveProveedor(cat);
	}
	
	@DeleteMapping(path="/delete/{id}")
	public String eliminarProveedor(@PathVariable("id") Integer id) {
		try {
			repo.deleteProveedor(id);
			return "Registro de codigo "+id+" eliminado correctamente";	
		} catch (Exception e) {
			return "Error en la eliminacion";
		}
	}

}
