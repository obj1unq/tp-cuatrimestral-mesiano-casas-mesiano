class Bando {

	var tesoro = 0
	var material = 0

	method tesoro() = tesoro

	method agregarTesoro(_tesoro) {
		tesoro += _tesoro
	}

	method material() = material

	method agregarMaterial(_material) {
		material += _material
	}

}

object bandos {

	const property bandoDelSur = new Bando(tesoro = 100, material = 50)
	const property bandoDelNorte = new Bando(tesoro = 200, material = 200)

}

