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

import com.cibertec.dswii.entity.Producto;
import com.cibertec.dswii.service.imp.ProductoServiceImp;

@RestController
@RequestMapping("/producto")
public class ProductoController {
	@Autowired
	ProductoServiceImp repo;
	
	@GetMapping("/list")
    public ArrayList<Producto> listarProductos(){
        return (ArrayList<Producto>) repo.listProductos();
        
    }
	
	@GetMapping(path="/list/{id}") /*elimina el path si es necesario, funciona igual*/
	public Optional<Producto> obtenerProductoxId(@PathVariable("id") Long id){
		
		return repo.findProducto(id);
	}
	
	@PostMapping("/save")
	public Producto guardarProducto(@RequestBody Producto cat) {
		return this.repo.saveProducto(cat);
	}
	
	@PutMapping("/edit")
	public Producto editingProducto(@RequestBody Producto cat) {
		return this.repo.saveProducto(cat);
	}
	
	@DeleteMapping(path="/delete/{id}")
	public String eliminarProducto(@PathVariable("id") Long id) {
		try {
			repo.deleteProducto(id);
			return id+" eliminado correctamente";	
		} catch (Exception e) {
			return "Error en el controller";
		}
	}

}
