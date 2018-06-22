import bandos.*
import artefactos.*
import elementos.*
import decorado.*

class Capo {

	var property posicion = null
	var property bando = null
	var property fuerzaDeLucha = null
	var property fuerzaDeHechiceria = null
	const property artefactos = #{}
	var property estaVivo = true
	var property imagen = null
	var property cartel = null

	// lucha------------
	// TODO ¿Para qué usamos self.sinArtefactos() aquí? El nombre no ayuda a comprender el objetivo.
	method lucha() = fuerzaDeLucha + self.conElArtefactoNinguna().sum({ art => art.lucha() })

	// TODO Les pedí que mejoraran los nombres de varias cosas como este, no veo que lo hayan hecho.
	//cambie el nombre 
	method incrementarValorDeLucha() {
		fuerzaDeLucha += 1
	}

	method agregarPuntosDeLucha(puntos) {
		fuerzaDeLucha += puntos
	}

	// hechiceria---------
	method hechiceria() = fuerzaDeHechiceria + artefactos.sum({ art => art.hechiceria() })

	method ValorDeHechiceria() = fuerzaDeHechiceria

	method hechiceriaIncrementarValor() {
		fuerzaDeHechiceria += 1
	}

	method agregarPuntosDeHechiceria(puntos) {
		fuerzaDeHechiceria += puntos
	}

	// artefactos-----
	method artefactos() = artefactos
	
	method conElArtefactoNinguna()=artefactos + #{ninguna}

	method obtenerArtefactos(unArtefacto) {
		artefactos.add(unArtefacto)
	}

	// elementos-------------
	method encontrar(unElemento) {
		unElemento.encontradoPor(self)
	}

	method pelea(adversario) {
		if (self.lucha() + self.hechiceria() >= adversario.lucha() + adversario.hechiceria()) {
			adversario.estaMuerto()
		} else {
			self.estaMuerto()
		}
	}

	method estaMuerto() {
		estaVivo = false
		if (self == capos.rolando()) {
			game.addVisualIn(gameOver, game.at(5, 5))
			posicion = new Position(22, 1)
		} else {
			posicion = new Position(22, 1)
		}
	}

	method sonAmigos(otroCapo) = otroCapo.bando() == bando

	method encontradoPor(personaje) {
		if (self.sonAmigos(personaje)) {
			artefactos.forEach({ elem => personaje.obtenerArtefactos(elem)})
			artefactos.clear()
		} else {
			self.pelea(personaje)
		}
	}

//game
	method efectoDeEncuentro() {
		cartel.cambiarPosicion()
	}

	method der() {
		posicion.moveRight(1)
	}

	method izq() {
		posicion.moveLeft(1)
	}

	method arriba() {
		posicion.moveUp(1)
	}

	method abajo() {
		posicion.moveDown(1)
	}

}

object capos {

	const property rolando = new Capo(bando = bandos.bandoDelSur(), fuerzaDeLucha = 1, fuerzaDeHechiceria = 3, artefactos = #{}, posicion = game.at(1, 1), imagen = "rolando.png")
	const property archibaldo = new Capo(bando = bandos.bandoDelNorte(), fuerzaDeLucha = 3, fuerzaDeHechiceria = 3, artefactos = #{ collarDivino, espejoFantastico }, imagen = "archibaldo.png", cartel = pelea,posicion = game.at(7, 11))
	const property caterina = new Capo(bando = bandos.bandoDelSur(), fuerzaDeLucha = 2, fuerzaDeHechiceria = 1, artefactos = #{ espadaDelDestino }, imagen = "caterina.png", cartel = amiga,posicion = game.at(5, 4))

}

