import bandos.*
import artefactos.*

class Capo {

	var property bando = null
	var property lucha = null
	var property hechiceria = null
	const property artefactos = null
	var property estaVivo = true

	// lucha------------
	method lucha() = lucha + artefactos.sum({ art => art.lucha() })

	method luchaIncrementarValor() {
		lucha += 1
	}

	// hechiceria---------
	method hechiceria() = hechiceria + artefactos.sum({ art => art.hechiceria() })

	method ValorDeHechiceria() = hechiceria

	method hechiceriaIncrementarValor() {
		hechiceria += 1
	}

	// artefactos-----
	method artefactos() = artefactos

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

}

object capos {

	const property rolando = new Capo(bando = bandos.bandoDelSur(), lucha = 1, hechiceria = 3, artefactos = #{})
	const property archibaldo = new Capo(bando = bandos.bandoDelNorte(), lucha = 3, hechiceria = 3, artefactos = #{ collarDivino, espejoFantastico })
	const property caterina = new Capo(bando = bandos.bandoDelSur(), lucha = 2, hechiceria = 1, artefactos = #{ espadaDelDestino })

}

object oro {

	method encontradoPor(personaje) {
		bandos.bandoDelSur().agregarTesoro(100)
	}

}

object carbon {

	method encontradoPor(personaje) {
		bandos.bandoDelSur().agregarMaterial(50)
	}

}

class ViejoSabio {

	//var capo = capos.rolando()

	method hechiceria() = valorHechiceriaViejoSabio.hechiceria()

	//method capo(unCapo) {
	//	capo = unCapo
	//}

	method encontradoPor(personaje) {
		personaje.luchaIncrementarValor()
		personaje.hechiceriaIncrementarValor()
	}

}

object valorHechiceriaViejoSabio {

	var property hechiceria

}

object viejosSabios {

	const property viejoSabio1 = new ViejoSabio()

}

