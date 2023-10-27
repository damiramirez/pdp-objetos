class Alumno {
	var property nota
	const property legajo
	var property entregaLosTps = false
	
	method aprobo() = nota >= 6
	method promociono() = nota >= 8
	method puedeFirmar() = self.aprobo() && entregaLosTps && !self.promociono()
	
}

object pDePNoche {
	const property alumnos = []
	
	method inscribir(alumno) {
		// Apunto a una nueva lista de alumnos - Sin efecto	
		// alumnos = alumnos + [alumno]
		
		// Con efecto, modificando su estado interno
		alumnos.add(alumno)		
	}
}

object funcionLegajo {
	method apply(alumno) = alumno.legajo()
}

object funcionNota {
	method apply(alumno) = alumno.nota()
}