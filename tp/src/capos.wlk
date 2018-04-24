import bandos.*
import artefactos.*

class Capo {

	var property bando = null
	var property lucha = null
	var property hechiceria = null
	const property artefactos = null

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
		unElemento.elemento()
	}

}

object capos {

	const property rolando = new Capo(bando = bandos.bandoDelSur(), lucha = 3, hechiceria = 1, artefactos = #{})
	const property archivaldo = new Capo(bando = bandos.bandoDelNorte(), lucha = 3, hechiceria = 3, artefactos = #{ collarDivino, espejoFantastico })
	const property caterina = new Capo(bando = bandos.bandoDelSur(), lucha = 2, hechiceria = 1, artefactos = #{ espadaDelDestino })

}





object oro {

	method elemento() {
		bandos.bandoDelSur().agregarTesoro(100)
	}

}

object carbon {

	method elemento() {
		bandos.bandoDelSur().agregarMaterial(50)
	}

}

object viejoSabio {

	var capo = capos.rolando()

	method capo(unCapo) {
		capo = unCapo
	}

	method elemento() {
		capo.luchaIncrementarValor()
		capo.hechiceriaIncrementarValor()
	}

}

