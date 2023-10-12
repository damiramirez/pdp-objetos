// Ejercicio feria - Clasjue 18
object julieta {
	// Datos arbitrarios
	var property tickets = 15
	var property cansancio = 0
	const property punteria = 20
	
	// Dato pero que puedo calcular, por lo tanto lo puedo hacer con un metodo
	method fuerza() = 80 - cansancio
	
	method jugar(juego) {
		tickets += juego.tickets(punteria)
		cansancio += juego.cansancio()
	}
}

object tiroAlBlanco {
	method tickets(punteria) = punteria / 10
	
	method cansancio() = 3
}


//Interfaces:
//
//Persona
//- jugar(juego)
//- tickets()
//
//Juego
//- tickets()
//- cansancio()
