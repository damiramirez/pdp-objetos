//Herencia

class Tanque {
	
	const armas = []
	const tripulantes = 2
	var salud = 1000
	var property prendidoFuego = false
	
	method emiteCalor() = prendidoFuego
							|| tripulantes > 3
							
	method sufrirDanio(danio) {
		salud -= danio
	}
	
	method atacar(objetivo) {
		armas.anyOne().dispararA(objetivo)
	}
}

class TanqueBlindado inherits Tanque {
	
	const blindaje = 200
	
	override method emiteCalor() = false
	
	override method sufrirDanio(danio) {
		if (danio > blindaje) {
			super(danio - blindaje)
		}
	} 
}
