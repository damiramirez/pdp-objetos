// Ejercicio feria - Clasjue 18
object julieta {
	// Datos arbitrarios
	var property tickets = 15
	var property cansancio = 0
	const property punteria = 20
	
	// Dato pero que puedo calcular, por lo tanto lo puedo hacer con un metodo
	method fuerza() = 80 - cansancio
	
	method jugar(juego) {
		// Le paso el objecto para que pueda usar los atributos. Acoplo la persona al juego
		tickets += juego.tickets(self)
		cansancio += juego.cansancio()
	}
	
	method puedeCanjear(premio) = tickets >= premio.costo
}

object tiroAlBlanco {
	method tickets(persona) =  persona.punteria() / 10
	
	method cansancio() = 3
}

object pruebaDeFuerza {
	method tickets(persona) = if (persona.fuerza() >= 75) 20 else 0 
	
	method cansancio() = 8
}

object ruedaDeLaFortuna {
	var property bienAceitada = true
	
	method tickets(persona) = 1.to(20).atRandom()
	
	method cansancio() = if (bienAceitada) 0 else 1
}

object osoPeluche {
	const property costo = 45
}

object taladro {
	var property costo = 1555
}

object gerundio {
	const property tickets = 0
	
	method juega(juego) {}	
	
	method puedeCanjear(premio) = true
}



//Interfaces:
//
//Persona
//- jugar(self)
//- tickets()
//- puedeCanjear(premio)
//
//Juego
//- tickets(persona)
//- cansancio()
//
// Premio
//- costo()
