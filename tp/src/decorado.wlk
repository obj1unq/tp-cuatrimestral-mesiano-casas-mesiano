import capos.*

object fondo {

	const property imagen = "caposLand2.png"

}

object gameOver {

	const property imagen = "gameOver.png"
	

}

object cementerio {

	const property imagen = "cementerio.png"

}

class Tierra {

	const property imagen = "tierra.png"
	
	method efectoDeEncuentro() {}
	method encontradoPor(capo){}
}

class Muro {

	const property imagen = "muro.png"

	method efectoDeEncuentro() {
		capos.rolando().arriba()
	}
	
	method encontradoPor(capo){}

}

class MuroD {

	const property imagen = "muro.png"

	method efectoDeEncuentro() {
		capos.rolando().izq()
	}
	
	method encontradoPor(capo){}

}

class MuroI {

	const property imagen = "muro.png"

	method efectoDeEncuentro() {
		 capos.rolando().der()
	}
	
	method encontradoPor(capo){}

}

class Vacio {

	const property imagen = "vacio.png"

	method efectoDeEncuentro() {
		capos.rolando().abajo()
	}
	method encontradoPor(capo){}
}

object castillo {

	const property imagen = "castillo.png"

	method efectoDeEncuentro() {
		ganador.cambiarPosicion()
	}
	method encontradoPor(){}

}

object pelea {

	var posicion = new Position(26, 11)
	const property imagen = "archiYRol2.png"

	method cambiarPosicion() {
		posicion = new Position(7, 5)
		capos.rolando().izq()
	}

	method volverAPosicionInicial() {
		posicion = new Position(26, 11)
	}

}

object amiga {

	var posicion = new Position(26, 10)
	const property imagen = "catYRol2.png"

	method cambiarPosicion() {
		posicion = new Position(7, 5)
		capos.rolando().izq()
	}

	method volverAPosicionInicial() {
		posicion = new Position(26, 10)
	}

}

object ganador {

	var posicion = new Position(26, 12)
	const property imagen = "ganador.png"

	method cambiarPosicion() {
		posicion = new Position(5, 3)
	}

}
object escenario {
	
	method tierraIzquierda (i,f,p)=
	 (i .. f).forEach{ n => game.addVisualIn(new Tierra(), game.at(n, p)) } // Izq tierra
}

