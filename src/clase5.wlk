class Impresora {
	const cabezal
	const cabezalAux
	
	method trazar(recorrido) {/* */}
	
	method mostrarEnPantalla(mensaje) {/* */}
	
	method imprimir(documento) {
		try {
			cabezal.eyectar(documento.tinta())		
		} catch error {
			cabezalAux.eyectar(documento.tinta())
		}
		
		self.trazar(documento.recorrido())
	}
}

class Cabezal {
	
	const eficiencia
	const cartucho
	
	method liberar() {/* */}
	
	method eyactar(cantidad) {
		cartucho.extraer(1 / eficiencia * cantidad)
		self.liberar()
	}
}

class Cartucho {
	var carga
	
	// Cartucho no puede extraer mas tinta de la que tiene
	method extraer(cantidad) {
		if (carga < cantidad) {
			throw new SinCargaException(carga = carga)
		}
		
		carga -= cantidad	
	}
}

class SinCargaException inherits DomainException {
	const property carga
	
	
}