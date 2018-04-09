
object rolando {
	
	var lucha=3
	var hechiceria =1
	var artefactos=#{espadaDelDestino,collarDivino}
	//var artefactos=#{}
	
	
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
	var capo= rolando
	
	method capo(unCapo){
		capo=unCapo
	}
	method lucha()= 0 
	
	method hechiceria()=
	if (capo.hechiceria()>3) 
	2
	else 0
}

object ninguna{
	method lucha()= 2
	
	method hechiceria()=0
}

// 2.2  espejo fantastico-----

object espejoFantastico{
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
	
	method autoExclusion()=
		capo.artefactos().difference(#{self})
		
	method mejorArtefacto(){
	return self.autoExclusion().max({elem=>elem.lucha() + elem.hechiceria()})
	 
	} 
	
}
