import capos.*
//
import capos.*
import bandos.*
import artefactos.*
import elementos.*

//clase artefacto---
class Artefacto {


	method lucha() = 0

	method hechiceria() = 0
	
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

	override method lucha() = 3


// game
	override method cambiarPosicion() {
		posicion = new Position(22, 5)
	}

}

object libroDeHechizos inherits Artefacto {

	var posicion = new Position(5, 8)
	const property imagen = "libro.png"
	
	
	var capo 

	method capo(unCapo) {
		capo = unCapo
	}

	method capo() = capo


	override method hechiceria() = capo.ValorDeHechiceria()

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

	override method lucha() = 1

	override method hechiceria() = 1

// game
	override method cambiarPosicion() {
		posicion = new Position(22, 6)
	}

}

// 2.1 armadura y refuerzos---------
class Armadura inherits Artefacto {

	var posicion = new Position(10, 4)
	const property imagen = "armadura.png"
	
	var property capo
	var property refuerzo = ninguna

	override method lucha() = 2 + refuerzo.lucha()

	override method hechiceria() = super() + refuerzo.hechiceria()

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

	const property armaduraBendecida = new Armadura(refuerzo = bendicion, capo=capos.rolando())

}

// 2.2  espejo fantastico-----
object espejoFantastico inherits Artefacto {

	var posicion = new Position(8, 11)
	const property imagen = "espejo.png"
	var property capo

	method capo(unCapo) {
		capo = unCapo
	}

	override method lucha() = if (self.autoExclusion().size() == 0) 0 else self.mejorArtefacto().lucha()

	override method hechiceria() = if (self.autoExclusion().size() == 0) 0 else self.mejorArtefacto().hechiceria()

	method artefacto() = self.mejorArtefacto()

	method autoExclusion() = self.capo().conElArtefactoNinguna().difference(#{ self })

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

