import capos.*

//clase artefacto---
class Artefacto {

	method cambiarPosicion()

	method encontradoPor(unCapo) {
		unCapo.obtenerArtefactos(self)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

//artefactos simples-------
object espadaDelDestino inherits Artefacto {

	var posicion = new Position(10, 1)
	const property imagen = "espada.png"

	method lucha() = 3

	method hechiceria() = 0

// game
	override method cambiarPosicion() {
		posicion = new Position(22, 5)
	}

}

object libroDeHechizos inherits Artefacto {

	var posicion = new Position(5, 8)
	const property imagen = "libro.png"
	
	// TODO Elimnar referencia a Rolando.
	var capo = capos.rolando() // referenciado por el game

	method capo(unCapo) {
		capo = unCapo
	}

	method capo() = capo

	method lucha() = 0

	method hechiceria() = capo.ValorDeHechiceria()

	override method encontradoPor(unCapo) {
		super(unCapo)
		self.capo(unCapo)
	}

	override method cambiarPosicion() {
		posicion = new Position(20, 6)
	}

}

object collarDivino inherits Artefacto {

	var posicion = new Position(2, 6)
	const property imagen = "collar.png"

	method lucha() = 1

	method hechiceria() = 1

// game
	override method cambiarPosicion() {
		posicion = new Position(22, 6)
	}

}

// 2.1 armadura y refuerzos---------
class Armadura inherits Artefacto {

	var posicion = new Position(10, 4)
	const property imagen = "armadura.png"
	
	var property capo = capos.rolando()
	var property refuerzo = ninguna

	method lucha() = 2 + refuerzo.lucha()

	method hechiceria() = 0 + refuerzo.hechiceria()

	method refuerzo() = refuerzo

	method agregarRefuerzo(_refuerzo) {
		refuerzo = _refuerzo
	}

	override method encontradoPor(unCapo) {
		self.capo(unCapo)
		refuerzo.Capo(capo)
		super(unCapo)
	}

// game
	override method cambiarPosicion() {
		posicion = new Position(24, 6)
	}

}

class Refuerzo {

	var capo = capos.rolando()

	method lucha() = 0

	method hechiceria() = 0

	method capo(unCapo) {
		capo = unCapo
	}

}

object cotaDeMalla inherits Refuerzo {

	override method lucha() = 1

}

object bendicion inherits Refuerzo {

	override method hechiceria() = 1

}

object hechizo inherits Refuerzo {

	override method hechiceria() = if (capo.hechiceria() > 3) 2 else 0

}

object ninguna inherits Refuerzo {

}

object armaduras {

	const property armaduraBendecida = new Armadura(refuerzo = bendicion)

}

// 2.2  espejo fantastico-----
object espejoFantastico inherits Artefacto {

	var posicion = new Position(8, 11)
	const property imagen = "espejo.png"
	var capo = capos.rolando()

	method capo(unCapo) {
		capo = unCapo
	}

	method lucha() = if (self.autoExclusion().size() == 0) 0 else self.mejorArtefacto().lucha()

	method hechiceria() = if (self.autoExclusion().size() == 0) 0 else self.mejorArtefacto().hechiceria()

	method artefacto() = self.mejorArtefacto()

	method autoExclusion() = capo.sinArtefactos().difference(#{ self })

	method mejorArtefacto() {
		return self.autoExclusion().max({ elem => elem.lucha() + elem.hechiceria() })
	}

	override method encontradoPor(unCapo) {
		self.capo(unCapo)
		super(unCapo)
	}

// game
	override method cambiarPosicion() {
		posicion = new Position(24, 6)
	}

}

