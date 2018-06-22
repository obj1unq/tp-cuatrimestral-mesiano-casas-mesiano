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
	
	method tierra (i,f,p)=
	 (i .. f).forEach{ n => game.addVisualIn(new Tierra(), game.at(n, p)) } // Izq tierra
	 
	method espacioInvisible(i,f,p)=
	(i .. f).forEach{ n => game.addVisualIn(new Vacio(), game.at(n, p)) }
	
	method muroI(i,f,p)=
	(i .. f).forEach{ n => game.addVisualIn(new Muro(), game.at(n,p)) }
	
	method muro(i,f,p)=
	(i .. f).forEach{ n => game.addVisualIn(new Muro(imagen = "muro2.png"), game.at(n,p)) }
	
	method columna(i,f,p)=
	(i .. f).forEach{ n => game.addVisualIn(new MuroD(), game.at(p, n)) }
	
	method construirEscenario(){
	self.tierra(0,18,0)// tierra 1 nivel
	self.tierra(0,14,3)//tierra 2 nivel
	self.tierra(3,23,7)//tierra3 nivel
	self.tierra(0,19,10) // tierra 4 nivel
	self.muroI(0,24,14)//techo
	self.muro(0,14,3)//muro 1er piso
	self.muro(0,24,0)//piso
	self.muro(0,19,10)//muroH 3er piso
	self.muro(3,23,7)// muroH 3er nivel
	self.espacioInvisible(3,23,6)
	self.espacioInvisible(0,19,9)
	self.espacioInvisible(0,14,2)
	self.espacioInvisible(0,24,13)
	self.columna(0,6,19)
	self.columna(7,14,24)
	self.columna(0,14,0)
	self.muroI(19,24,6)//cementerio
	self.muroI(19,24,0)//cementerio
	self.muroI(19,24,5)//techo inf cementerio
	}
}

