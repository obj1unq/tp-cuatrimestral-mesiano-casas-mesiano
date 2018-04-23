
object rolando {
	
	var lucha=3
	var hechiceria =1
	var artefactos=#{espadaDelDestino,collarDivino}

	// TODO: No dejen código comentado.
	//var artefactos=#{}
	
	
	//lucha------------
	method lucha()= lucha + artefactos.sum({art=>art.lucha()})
	
	// TODO Corregir nombre
	method luchaIncrementarValor(){
		lucha+=1
	}
	//hechiceria---------
	method hechiceria()=hechiceria + artefactos.sum({art=>art.hechiceria()})

	// TODO Respeten las convenciones, los nombres de método con minúscula.	
	// De paso, corregir el nombre, si internamente lo llamamos "hechicería" por qué hacia afuera tiene otro nombre?
	method ValorDeHechiceria()=hechiceria
	
	// TODO Corregir nombre
	method hechiceriaIncrementarValor(){
		hechiceria+=1
	}
	// artefactos-----
	method artefactos()= artefactos
	
	// TODO Corregir nombre
	method obtenerArtefactos(unArtefacto){
		artefactos.add(unArtefacto)
	}
	//elementos-------------
	method encontrar(unElemento){
		unElemento.elemento()
	}
	
	
}

//artefactos simples-------

object espadaDelDestino{
	method lucha()= 3
	
	method hechiceria()=0
}

object libroDeHechizos{
	// TODO Eviten referenciar a rolando desde el código de los artefactos.
	var capo= rolando
	
	method capo(unCapo){
		capo=unCapo
	}
	method lucha()= 0 
	
	method hechiceria()=
		capo.ValorDeHechiceria()
}

object collarDivino{
	method lucha()= 1
	
	method hechiceria()= 1
}

 //2.1 armadura y refuerzos---------
// TODO Sería bueno dividir esto en más archivos.
 
object armadura{
	var refuerzo= ninguna
	
	method lucha()= 2 + refuerzo.lucha()
	
	method hechiceria()=0 + refuerzo.hechiceria()
	
	method refuerzo()= refuerzo
	
	method agregarRefuerzo(_refuerzo){
		refuerzo=_refuerzo
	} 
}

object cotaDeMalla{
	method lucha()= 1
	
	method hechiceria()= 0
}

object bendicion{
	method lucha()= 0
	
	method hechiceria()= 1
}

object hechizo{
	// TODO No debe referenciar a rolando.
	var capo= rolando
	
	method capo(unCapo){
		capo=unCapo
	}
	method lucha()= 0 

	// Indentar correctamente.	
	method hechiceria()=
	if (capo.hechiceria()>3) 
	2
	else 0
}

object ninguna{
	method lucha()= 2
	
	method hechiceria()=0
}

// TODO Llevar a otro archivo
// 2.2  espejo fantastico-----

object espejoFantastico{
	// TODO Evitar referencias a rolando
	var capo= rolando
	
	method capo(unCapo){
		capo=unCapo
	}
	
	method lucha()= 
		if (self.autoExclusion()== #{})0
		else self.mejorArtefacto().lucha()
		
	
	method hechiceria()=
		if (self.autoExclusion()== #{})0
		else self.mejorArtefacto().hechiceria()
		
	
	method artefacto()= self.mejorArtefacto()

	// TODO Mejorar nombre, no es descriptivo	
	method autoExclusion()=
		capo.artefactos().difference(#{self})
		
	method mejorArtefacto(){
	return self.autoExclusion().max({elem=>elem.lucha() + elem.hechiceria()})
	 
	} 
	
}

// TODO Llevar a otro archivo
// 3 bando del sur----------------

object bandoDelSur{
	var tesoro=0
	var material=0
	
	method tesoro()=tesoro
	
	method agregarTesoro(_tesoro){
		tesoro+=_tesoro
	}
	
	method material()=material
	
	method agregarMaterial(_material){
		material+=_material
	}
}

object oro{
	
	method elemento(){
		bandoDelSur.agregarTesoro(100)
		}
} 

object carbon{
	
	method elemento(){
		bandoDelSur.agregarMaterial(50)
		}
}

object viejoSabio{
	// TODO Evitar referencias directas a rolando
	var capo= rolando
	
	method capo(unCapo){
		capo=unCapo
	}
	
	method elemento(){
		capo.luchaIncrementarValor()
		capo.hechiceriaIncrementarValor()
	}
}









