//tp1


object rolando {
	
	var lucha=3
	var hechiceria =1
	var artefactos=#{}
	
	
	
	//lucha------------
	method lucha()= lucha + artefactos.sum({art=>art.lucha()})
	
	method luchaIncrementarValor(){
		lucha+=1
	}
	//hechiceria---------
	method hechiceria()=hechiceria + artefactos.sum({art=>art.hechiceria()})
	
	method ValorDeHechiceria()=hechiceria
	
	method hechiceriaIncrementarValor(){
		hechiceria+=1
	}
	// artefactos-----
	method artefactos()= artefactos
	
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
	method lucha()= 0 
	
	method hechiceria()=
		rolando.ValorDeHechiceria()
}

object collarDivino{
	method lucha()= 1
	
	method hechiceria()= 1
}
