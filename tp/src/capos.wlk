import bandos.*

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

//artefactos simples-------
object espadaDelDestino {

	method lucha() = 3

	method hechiceria() = 0

}

object libroDeHechizos {

	var capo = capos.rolando()

	method capo(unCapo) {
		capo = unCapo
	}

	method lucha() = 0

	method hechiceria() = capo.ValorDeHechiceria()

}

object collarDivino {

	method lucha() = 1

	method hechiceria() = 1

}

// 2.1 armadura y refuerzos---------
object armadura {

	var refuerzo = ninguna

	method lucha() = 2 + refuerzo.lucha()

	method hechiceria() = 0 + refuerzo.hechiceria()

	method refuerzo() = refuerzo

	method agregarRefuerzo(_refuerzo) {
		refuerzo = _refuerzo
	}

}

object cotaDeMalla {

	method lucha() = 1

	method hechiceria() = 0

}

object bendicion {

	method lucha() = 0

	method hechiceria() = 1

}

object hechizo {

	var capo = capos.rolando()

	method capo(unCapo) {
		capo = unCapo
	}

	method lucha() = 0

	method hechiceria() = if (capo.hechiceria() > 3) 2 else 0

}

object ninguna {

	method lucha() = 2

	method hechiceria() = 0

}

// 2.2  espejo fantastico-----
object espejoFantastico {

	var capo = capos.rolando()

	method capo(unCapo) {
		capo = unCapo
	}

	method lucha() = if (self.autoExclusion() == #{}) 0 else self.mejorArtefacto().lucha()

	method hechiceria() = if (self.autoExclusion() == #{}) 0 else self.mejorArtefacto().hechiceria()

	method artefacto() = self.mejorArtefacto()

	method autoExclusion() = capo.artefactos().difference(#{ self })

	method mejorArtefacto() {
		return self.autoExclusion().max({ elem => elem.lucha() + elem.hechiceria() })
	}

}

// 3 bandos----------------
/* class Bando {
*
*	var tesoro = 0
*	var material = 0
*
*	method tesoro() = tesoro
*
*	method agregarTesoro(_tesoro) {
*		tesoro += _tesoro
*	}
*
*	method material() = material
*
*	method agregarMaterial(_material) {
*		material += _material
*	}
*
*}
*
*object bandos {
*
*	const property bandoDelSur = new Bando(tesoro = 100, material = 50)
*	const property bandoDelNorte = new Bando(tesoro = 200, material = 200)
*
*}
*/



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

