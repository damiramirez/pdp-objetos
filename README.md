# Clase 0
*Objeto*

## Objeto
Es algo que puedo representar a través de una idea, un concepto. Tiene entidad. Por ejemplo, una fruta es algo del mundo real, que podemos conceptualizar fácilmente. 

*“Un sistema es un conjunto de objetos que se envían mensajes para alcanzar un determinado objetivo”*

Un objeto es una entidad, un concepto, un ente. ¿Qué es lo que nos importa de un objeto? Qué mensajes le puedo enviar, lo que forma **la interfaz**. 

**Ejemplo:** el gato Félix sabe maullar, comer y dormir. Veamos su interfaz

Felix:
- maular()
- comer()
- dormir()

Uno datos y logica -> Registro que tiene su propias operaciones. Los datos son responsables de las operaciones que se pueden realizar con ellos.

Los objetos interactúan a traves de mensajes (interfaz -> conjunto de mensaje).
1. Primero tengo que conocer el otro objeto
2. Cuando lo conozco, ya se qué mensaje le puedo mandar
3. No me interesa como funcionan por dentro

Los mensajes son resultado de poseer metodos (implementacion de la funcion).

Los objetos pueden tener estado interno, que es un conjujto de atributos que hace referencia a otros objetos.

Felix
- nombre = "Felix"
- edad = 2

# Clase 1
Ejercicio: Responsabilidad y Delegación, Polimorfismo.

[Doc](https://docs.google.com/document/d/1uwJOJk12lq6WQesWuVYcj0uyHSYw4XJjQk7n2Llm9iY/edit)

Voy a guardar en atributos las cosas que no puedo calcular y si la puedo calcular, quizas me quede mejor ponerlo en un metodo. Tengo que tener cuidado con los estados si tengo campos vinculados.

Siempre tengo que programar pensando en el polimorfismo, si arranque con un `switch statments` , atento que puede estar mal planteado el disenio.

# Clase 2

La clase me sirve para instanciar un objeto, va a tener atributos y metodos.

```wollok
class Alumno {
	var property nota
	const property legajo
	var property entregaLosTps = false
	
	method aprobo() = nota >= 6
	method promociono() = nota >= 8
	method puedeFirmar() = self.aprobo() && entregaLosTps && !self.promociono()
	
}
```

Para instanciar un alumno:
`const damian = new Alumno(nota=10, legajo="123")`

Si uso `const`, hago que no pueda pisar ese alumno con uno nuevo u otra clase.

# Clase 3
*Intro Method Lookup. Diagrama de Clases.*

Objetos pueden ser iguales pero no identicos. Es decir que pueden tener el mismo estado interno pero esto no significa que los objetos sean los mismos. 

Para trabajar con gran cantidad de datos, puedo usar listas con objetos.

```wollok
object pdpNoche {
	var property alumnos = [new Alumno(), new Alumno()]
	...
}
```

