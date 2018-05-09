import capos.*

class Oro {

	const property imagen = "oro.png"
	var posicion = new Position(22, 8)
	var property valor = 100

	method encontradoPor(personaje) {
		personaje.bando().agregarTesoro(valor)
	}

//game
	method cambiarPosicion() {
		posicion = new Position(22, 21)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

class Carbon {

	const property imagen = "carbon.png"
	var posicion = new Position(11, 8)

	method encontradoPor(personaje) {
		personaje.bando().agregarMaterial(50)
	}

//game
	method cambiarPosicion() {
		posicion = new Position(22, 20)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

class ViejoSabio {

	var property puntosDeHechiceria = 1
	var property posicion = new Position(14, 4)
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
	} 

}

object valorLuchaViejoSabio {

	var property lucha = 1

}

class Neblina {

	const property imagen = "neblina.png"
	var property elementosOcultos = []
	var property posicion = new Position(16, 3)

	method encontradoPor(personaje) {
		elementosOcultos.forEach({ elem => personaje.encontrar(elem)})
	}

//game
	method cambiarPosicion() {
		posicion = new Position(29, 6)
	}

	method efectoDeEncuentro() {
		self.cambiarPosicion()
	}

}

object elementos {

	const property carbon1 = new Carbon()
	const property viejoSabio1 = new ViejoSabio(puntosDeHechiceria = 1, posicion = new Position(14, 4))
	const property viejoSabio2 = new ViejoSabio(puntosDeHechiceria = 2, posicion = new Position(14, 11))
	const property oro1 = new Oro()
	const property neblina1 = new Neblina(elementosOcultos = [ capos.caterina(), self.viejoSabio1() ])

}

