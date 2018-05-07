import capos.*

class Oro {

	var posicion = new Position(20, 11)
	var property valor = 100

	method encontradoPor(personaje) {
		personaje.bando().agregarTesoro(valor)
	}


//game
	method cambiarPosicion() {
		posicion = new Position(22, 6)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

object cofresDe {
	
	
	const property oro1 = new Oro()

}

class Carbon {

	var posicion = new Position(21, 11)
	method encontradoPor(personaje) {
		personaje.bando().agregarMaterial(50)
	}

//game
	method cambiarPosicion() {
		posicion = new Position(22, 6)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

object cumulosDe {

	var posicion = new Position(22, 11)
	const property carbon1 = new Carbon()


//game
	method cambiarPosicion() {
		posicion = new Position(22, 6)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

class ViejoSabio {

	var property puntosDeHechiceria = null
	var posicion = new Position(14, 4)
	const property imagen = "viejo.png"

	method cambiarPosicion() {
		posicion = new Position(23, 20)
	}
	
	// game

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}
	
	method encontradoPor(personaje) {
		personaje.agregarPuntosDeLucha(valorLuchaViejoSabio.lucha())
		personaje.agregarPuntosDeHechiceria(puntosDeHechiceria)
	} // hay que hacer un gran cambio el valor de hechiceria ya no es este

}

object valorLuchaViejoSabio {

	var property lucha = 1

}

object viejosSabios {

	const property viejoSabio1 = new ViejoSabio(puntosDeHechiceria = 1,posicion = new Position(14, 4))
	const property viejoSabio2 = new ViejoSabio(puntosDeHechiceria = 1,posicion = new Position(14, 11))
}

class Neblina {

	var property elementosOcultos = []

	method encontradoPor(personaje) {
		elementosOcultos.forEach({ elem => personaje.encontrar(elem)})
	// personaje.agregarPuntosDeLucha(valorLuchaViejoSabio.lucha())
	// personaje.agregarPuntosDeHechiceria(puntosDeHechiceria)
	}

}

object neblinas {

	const property neblina1 = new Neblina(elementosOcultos = [ capos.caterina(), viejosSabios.viejoSabio1() ])


//game
	method cambiarPosicion() {
		posicion = new Position(22, 6)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

