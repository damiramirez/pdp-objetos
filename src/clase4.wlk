// Ejercicio WoW
// 1. Resolver las dos cosas por herencia - NO
// 2. Resolver las dos cosas por composicion - NO
// 3. Combinacion de herencia (rol) y composicion (raza) - Cumple consigna

// Prestar atencion a quien puede delegar - Tomar menos decisiones por el otro 

class Personaje {
	
	//	Clase abstracta
	var property fuerza
	var property inteligencia
	var property rol
	
	method potencialOfensivo() = fuerza * 10 + rol.extra()
	
	method esGroso() = self.inteligente() || rol.esGroso(self)
	
}

class Cazador {
	var property mascota
	
	method extraPo() = mascota.potencialOf()
	
	method esGroso(p) = mascota.logeva()
}

object guerrero {
	method extraPo() = 100
	
	method esGroso(p) = p.fuerza() > 50
}

object brujo {
	
	method extraPo() = 1
	
	method esGroso(p) = true
}

class Orco inherits Personaje {
	// super -> busca el metodo del padre	
	override method potencialOfensivo() = super() * 1.1
	
	method intelgiente () = false;
}

class Humano inherits Personaje {
	method inteligente() = inteligencia > 50
}

class Ejercito {
	var property personajes
	
	method pot() = personajes.sum({p => p.potencialOf()})
	
	method invadir(localidad) {
		if (self.pot() > localidad.pot()) {
			localidad.ocupadaPor(self)
		}
	}
	
	method partiteEn(max) {
		const ps = personajes.sortBy({p => p.potencialOfensivo()}).take(max)
		personajes.removeAll(ps)
		
		return new Ejercito(personajes=ps)
	}
}

class Localidad {
	var property ejercito
	
	method pot() = ejercito.pot()
	
	method ocupadaPor(eje) { ejercito = eje }
} 

class Ciudad inherits Localidad {
	
	override method pot() = super() + 300
}

class Aldea inherits Localidad {
	
	const property max = 10
	
	override method ocupadaPor(eje) {
		super(eje.partiteEn(max)
	}
}
