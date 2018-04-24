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
		unElemento.accionDeEncuentro()
	}
	
	method sonAmigos(otroCapo)= otroCapo.bando()==bando
	
	method encontradoPor(personaje){
		return if (self.sonAmigos(personaje)){
			
		}else{
			
		}
	}

}

object capos {

	const property rolando = new Capo(bando = bandos.bandoDelSur(), lucha = 3, hechiceria = 1, artefactos = #{})
	const property archivaldo = new Capo(bando = bandos.bandoDelNorte(), lucha = 3, hechiceria = 3, artefactos = #{ collarDivino, espejoFantastico })
	const property caterina = new Capo(bando = bandos.bandoDelSur(), lucha = 2, hechiceria = 1, artefactos = #{ espadaDelDestino })

}

object oro {

	method accionDeEncuentro() {
		bandos.bandoDelSur().agregarTesoro(100)
	}

}

object carbon {

	method accionDeEncuentro() {
		bandos.bandoDelSur().agregarMaterial(50)
	}

}

class ViejoSabio {

	var capo = capos.rolando()
	
	

	method hechiceria() = valorHechiceriaViejoSabio.hechiceria()

	method capo(unCapo) {
		capo = unCapo
	}

	method accionDeEncuentro() {
		capo.luchaIncrementarValor()
		capo.hechiceriaIncrementarValor()
	}

}

object valorHechiceriaViejoSabio {

	var property hechiceria

}

object viejosSabios{
	const property viejoSabio1 = new ViejoSabio()
}
	

























