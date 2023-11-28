// Sin heredar de equipos, Supercomputadora ya cumple con la polimorfia de equipos
class Supercomputadora {
	const equipos = [] 
	var totalDeComplejidadComputada = 0
	
	method equiposActivos() = equipos.filter{ equipo => equipo.estaActivo() }
	
	method estaActivo() = true
	
	method computo() = self.equiposActivos().sum{ equipo => equipo.computo() }
	method consumo() = self.equiposActivos().sum{ equipo => equipo.consumo() }
	  
	method malConfigurada() = 
		self.equiposActivos().max{ equipo => equipo.consumo() } != 
		self.equiposActivos().max{ equipo => equipo.computo() }
		
	method computar(problema) {
		const subProblema = new Problema(complejidad = problema.complejidad() / self.equiposActivos())
		self.equiposActivos().forEach{ equipo =>equipo.computar(subProblema) }
		
		totalDeComplejidadComputada += problema.complejidad()
	}
}

class Problema {
	const property complejidad
}

class Equipo {
	var property modo = standar
	var property estaQuemado = false
	
	method computo() = modo.computoDe(self)
	method consumo() = modo.consumoDe(self)
	method estaActivo() = !estaQuemado && self.computo() > 0
	
	method consumoBase()
	method computoBase()
	method computoExtraOverclock()
	method computar(problema) {
		if(problema.complejidad() > self.computo())
			throw new DomainException(message = "Capacidad excedida")
			
		modo.realizoComputo(self)
	}
}

class A105 inherits Equipo {
	
	override method consumoBase() = 300
	override method computoBase() = 600
	override method computoExtraOverclock() = self.computoBase() * 0.3
	
	override method computar(problema) {
		if(problema.complejidad() < 5)
			throw new DomainException(message = "Complejidad menor a 5")
			
		super(problema)
	}
}

class B2 inherits Equipo {
	const microsInstalados
	
	override method consumoBase() = 10 + 50 * microsInstalados 
	override method computoBase() = 800.min(100 * microsInstalados)
	override method computoExtraOverclock() = microsInstalados * 20
}

object standar {
	
	method consumoDe(equipo) = equipo.consumoBase()
	method computoDe(equipo) = equipo.computoBase()
	method realizoComputo(equipo) {}
}

class Overclock {
	var usosRestantes

	override method initialize() {
		if (usosRestantes < 0) throw new DomainException(message = "Usos restantes >= 0")
	}
	
	method consumoDe(equipo) = 2 * equipo.consumoBase()
	method computoDe(equipo) = equipo.computoBase() + equipo.computoExtraOverclock()
	method realizoComputo(equipo) {
		if(usosRestantes == 0) {
			equipo.estaQuemado(true)
			throw new DomainException(message = "Equipo esta quemado")
		}

		usosRestantes -= 1
	}
}

class AhorroEnergia {
	var computosRealizados = 0
	
	method consumoDe(equipo) = 200
	method computoDe(equipo) = self.consumoDe(equipo) / equipo.consumoBase() * equipo.computoBase()
	method realizoComputo(equipo) {
		computosRealizados += 1
		if(computosRealizados % self.periocidadDeError() == 0) 
			throw new DomainException(message = "Corriendo monitor")
	}
	
	method periocidadDeError() = 17
}

class APruebaDeFallos inherits AhorroEnergia {
	override method computoDe(equipo) = super(equipo) / 2
	override method periocidadDeError() = 100
	
}