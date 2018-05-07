import capos.*

//artefactos simples-------
object espadaDelDestino {

	var posicion = new Position(10, 1)
	const property imagen = "espada.png"

	method lucha() = 3

	method hechiceria() = 0

	method encontradoPor(unCapo) {
		unCapo.obtenerArtefactos(self)
	}

	// game
	method cambiarPosicion() {
		posicion = new Position(22, 5)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

object libroDeHechizos {

	var posicion = new Position(5, 8)
	const property imagen = "libro.png"
	var capo = null

	method capo(unCapo) {
		capo = unCapo
	}

	method capo() = capo

	method lucha() = 0

	method hechiceria() = capo.ValorDeHechiceria()

	method encontradoPor(unCapo) {
		unCapo.obtenerArtefactos(self)
		self.capo(unCapo)
	}

	method cambiarPosicion() {
		posicion = new Position(20, 6)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

object collarDivino {

	var posicion = new Position(2,6)
	const property imagen = "collar.png"

	method lucha() = 1

	method hechiceria() = 1

	method encontradoPor(unCapo) {
		unCapo.obtenerArtefactos(self)
	}
	//game
	method cambiarPosicion() {
		posicion = new Position(22, 6)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

// 2.1 armadura y refuerzos---------
class Armadura {

	var posicion = new Position(10,4)
	const property imagen = "armadura.png"
	var property capo = null
	var property refuerzo = ninguna

	method lucha() = 2 + refuerzo.lucha()

	method hechiceria() = 0 + refuerzo.hechiceria()

	method refuerzo() = refuerzo

	method agregarRefuerzo(_refuerzo) {
		refuerzo = _refuerzo
	}

	method encontradoPor(unCapo) {
		unCapo.obtenerArtefactos(self)
		self.capo(unCapo)
		refuerzo.Capo(unCapo)
	}

	method darCapo(unRefuerzo) {
		unRefuerzo.capo(capo)
	}

	//game
	method cambiarPosicion() {
		posicion = new Position(24, 6)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}
}

object cotaDeMalla {

	var capo = null

	method capo(unCapo) {
		capo = unCapo
	}

	method lucha() = 1

	method hechiceria() = 0

}

object bendicion {

	var capo = null

	method capo(unCapo) {
		capo = unCapo
	}

	method lucha() = 0

	method hechiceria() = 1

}

object hechizo {

	var capo = null

	method capo(unCapo) {
		capo = unCapo
	}

	method lucha() = 0

	method hechiceria() = if (capo.hechiceria() > 3) 2 else 0

}

object ninguna {

	var capo = null

	method capo(unCapo) {
		capo = unCapo
	}

	method lucha() = 0

	method hechiceria() = 0

}

object armaduras {

	const property armaduraBendecida = new Armadura(refuerzo = bendicion)

}

// 2.2  espejo fantastico-----
object espejoFantastico {

	var posicion = new Position(8,11)
	const property imagen = "espejo.png"
	var capo = capos.rolando()

	method capo(unCapo) {
		capo = unCapo
	}
	
	
	method lucha() = self.mejorArtefacto().lucha()

method hechiceria() = self.mejorArtefacto().hechiceria()
	
	
//method lucha() = if (self.autoExclusion().size() == 0)self.autoExclusion().size()else self.mejorArtefacto().lucha()

//method hechiceria() = if (self.autoExclusion().size() ==0) 0 else self.mejorArtefacto().hechiceria()

	//method lucha() = if (self.autoExclusion() == #{}) 0 else self.mejorArtefacto().lucha()

	//method hechiceria() = if (self.autoExclusion() == #{}) 0 else self.mejorArtefacto().hechiceria()

	method artefacto() = self.mejorArtefacto()

	method autoExclusion() = capo.sinArtefactos().difference(#{ self })

	method mejorArtefacto() {
		return self.autoExclusion().max({ elem => elem.lucha() + elem.hechiceria() })
	}

	

	method encontradoPor(unCapo) {
		self.capo(unCapo)
		unCapo.obtenerArtefactos(self)
	}
	//game
	method cambiarPosicion() {
		posicion = new Position(24, 6)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

object espejoFantastico2 {

	var posicion = new Position(8,11)
	const property imagen = "espejo.png"
	var capo = capos.rolando()

	method capo(unCapo) {
		capo = unCapo
	}

method lucha() = self.mejorArtefacto().lucha()

method hechiceria() = self.mejorArtefacto().hechiceria()


//method lucha() = if (self.autoExclusion().size() == 0)self.autoExclusion().size()else self.mejorArtefacto().lucha()

//method hechiceria() = if (self.autoExclusion().size() ==0) 0 else self.mejorArtefacto().hechiceria()

	//method lucha() = if (self.autoExclusion() == #{}) 0 else self.mejorArtefacto().lucha()

	//method hechiceria() = if (self.autoExclusion() == #{}) 0 else self.mejorArtefacto().hechiceria()

 	method artefacto() = self.mejorArtefacto()

	method autoExclusion() = capo.sinArtefactos().difference(#{ self })

	method mejorArtefacto() {
		return self.autoExclusion().max({ elem => elem.lucha() + elem.hechiceria() })
	}

	

	method encontradoPor(unCapo) {
		self.capo(unCapo)
		unCapo.obtenerArtefactos(self)
	}
	//game
	method cambiarPosicion() {
		posicion = new Position(24, 6)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

