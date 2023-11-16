// Ejercicio WoW
// 1. Resolver las dos cosas por herencia - NO
// 2. Resolver las dos cosas por composicion - NO
// 3. Combinacion de herencia (rol) y composicion (raza) - Cumple consigna

// Prestar atencion a quien puede delegar - Tomar menos decisiones por el otro 

// Personaje clase abstracta - Lo uso para heredar
// Clases de mi dominio
// Rol va a ser una interfaz de los roles posibles. Tienen que entender el mismo mensaje

class Personaje {
	
	var property fuerza = 100 
	var property inteligencia
	var property rol
	
	method potencialOfensivo() = 10 * fuerza + rol.potencialOfensivoExtra()
	
	method esGroso() = self.esInteligente() || rol.esGroso(self)
	
	// Metodos abstractos - no los defino - declaro que si quiero extender de esta clase, tengo q tener estos metodos
	method esInteligente()
}

// -------------------------------------------------
// CLASES
// -------------------------------------------------

class Humano inherits Personaje {
	
	override method esInteligente() = inteligencia > 50
}

class Orco inherits Personaje {
	
	
	override method potencialOfensivo() = super() * 1.1	
	
	override method esInteligente() = false
}

// -------------------------------------------------
// ROLES
// -------------------------------------------------
// Como no tienen atributos comunes, no hace falta una clase rol, uso interfaz. Para que sea polimorfico, tienen que entender el mismo mensaje

object guerrero {
	method potencialOfensivoExtra() = 10
	
	method esGroso(personaje) = personaje.fuerza() > 50
}

object brujo {
	method potencialOfensivoExtra() = 0
	
	method esGroso(personaje) = true
}

class Cazador {
	
	var property mascota
	
	method potencialOfensivoExtra() = mascota.potenfialOfensivo()
	
	method esGroso(personaje) = mascota.esLongeva()
}

class Mascota {
	
	const property fuerza
	const property edad
	const property tieneGarras
	
	method potenfialOfensivo() = if (tieneGarras) fuerza * 2 else fuerza 
	
	method esLongeva() = edad > 10
}


// --------------------------------------------------------
// ZONAS
// --------------------------------------------------------

class Ejercito {
	
	const property miembros = []
	
	method potencialOfensivo() = miembros.sum( {personaje => personaje.potencialOfensivo()} )
	
	method invadir(zona) {
		if (zona.potencialDefensivo() < self.potencialOfensivo()) {
			zona.esOcupadaPor(self)
		}
	}
}

// Hay aldeas y ciudades - interfaz o clase abstracta? Clase abstracta ya que aldea y ciudad tiene cosas en comun
// Luego especifico lo q es distinto en las subclases

class Zona {
	
	var habitantes
	
	method potencialDefensivo() = habitantes.potencialOfensivo()
	
	method esOcupadaPor(ejercito) { habitantes = ejercito } 
}

class Aldea inherits Zona {
	const maximoHabitantes = 50
	
	override method esOcupadaPor(ejercito) {
		if (ejercito.miembros().size() > maximoHabitantes) {
			// Puedo delegar en el ejercito			
			const nuevosHabitantes = ejercito.miembros().sortedBy( {uno, otro => uno.potencialOfensivo() > otro.potencialOfensivo()} ).take(10)
			
			super(new Ejercito(miembros = nuevosHabitantes))
			
			ejercito.miembros().removeAll(nuevosHabitantes)
		} else { super(ejercito) }
	}
}

class Ciudad inherits Zona {
	
	override method potencialDefensivo() = super() + 300
}