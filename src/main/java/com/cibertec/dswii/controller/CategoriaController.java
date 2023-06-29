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

import com.cibertec.dswii.entity.Categoria;
import com.cibertec.dswii.service.imp.CategoriaServiceImp;

@RestController
@RequestMapping("/categoria")
public class CategoriaController {

	@Autowired
	CategoriaServiceImp repo;
	
	@GetMapping("/list")
    public ArrayList<Categoria> listarCategorias(){
        return (ArrayList<Categoria>) repo.listCategorias();
        
    }
	
	@GetMapping(path="/list/{id}") /*elimina el path si es necesario, funciona igual*/
	public Optional<Categoria> obtenerCategoriaxId(@PathVariable("id") Integer id){
		
		return repo.findCategoria(id);
	}
	
	@PostMapping("/save")
	public Categoria guardarCategoria(@RequestBody Categoria cat) {
		return this.repo.saveCategoria(cat);
	}
	
	@PutMapping("/edit")
	public Categoria editingCategoria(@RequestBody Categoria cat) {
		return this.repo.saveCategoria(cat);
	}
	
	@DeleteMapping(path="/delete/{id}")
	public String eliminarCategoria(@PathVariable("id") Integer id) {
		try {
			repo.deleteCategoria(id);
			return "Registro de codigo "+id+" eliminado correctamente";	
		} catch (Exception e) {
			return "Error en la eliminacion";
		}
	}
	
	
	
	
	
	
}
