package com.cibertec.dswii;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cibertec.dswii.entity.Categoria;
import com.cibertec.dswii.service.imp.CategoriaServiceImp;

@SpringBootTest
class DswiiServiceApplicationTests {

	@Autowired
	private CategoriaServiceImp serv;
	
	@Test
	void contextLoads() {
		List<Categoria> data = serv.listCategorias();
		for(Categoria a:data)
			System.out.println(a);
	}

}
