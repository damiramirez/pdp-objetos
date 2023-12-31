# Clase 0
*Objeto*

- Encapsulamiento
- Responsabilidad y delegación
- Polimorfismo

## Objeto
Es algo que puedo representar a través de una idea, un concepto. Tiene entidad. Por ejemplo, una fruta es algo del mundo real, que podemos conceptualizar fácilmente. 

*“Un sistema es un conjunto de objetos que se envían mensajes para alcanzar un determinado objetivo”*

Un objeto es una entidad, un concepto, un ente. ¿Qué es lo que nos importa de un objeto? Qué mensajes le puedo enviar, lo que forma **la interfaz**. 

**Ejemplo:** el gato Félix sabe maullar, comer y dormir. Veamos su interfaz

Felix:
- `maular()`
- `comer()`
- `dormir()`

Los objetos interactúan a traves de mensajes (interfaz -> conjunto de mensaje).
1. Primero tengo que conocer el otro objeto
2. Cuando lo conozco, ya se qué mensaje le puedo mandar
3. No me interesa como funcionan por dentro

Los mensajes son resultado de poseer métodos (implementación de la función).

Los objetos pueden tener estado interno, que es un conjunto de atributos que hace referencia a otros objetos. Al modelar una solución con objetos, buscaremos que el estado de un objeto sea manipulado únicamente por métodos definidos en el propio objeto. Cada referencia define un atributo, que tiene un nombre y un valor, el objeto apuntado. 

Felix
- nombre = "Felix"
- edad = 2

## Encapsulamiento

Quien usa un objeto sólo ve lo que necesita para poder interactuar con él, que es el comportamiento que exhibe. Los detalles internos quedan encapsulados en el objeto. Así quedan acotadas y explicitadas las formas posibles de interactuar con un objeto.

El ocultamiento de detalles de implementación, como ser los atributos de un objeto, permite separar mejor las responsabilidades y evitar efectos inesperados como resultado de la modificación del valor de las variables por entidades externas.


# Clase 1
Ejercicio: Responsabilidad y Delegación, Polimorfismo.

[Doc](https://docs.google.com/document/d/1uwJOJk12lq6WQesWuVYcj0uyHSYw4XJjQk7n2Llm9iY/edit)

## Polimorfismo

la capacidad que tiene un objeto de poder tratar indistintamente a otros que sean potencialmente distintos. Cuando hablamos de que un objeto “trate” a otros, estamos hablando de que interactúen a través de mensajes.

Lo que nos va a interesar al programar es ver a un objeto desde un punto de vista externo (cuando mandamos mensajes) y desde un punto de vista interno (cuando implementamos el comportamiento que queremos). Al punto de vista externo, que sólo incluye el comportamiento que exhibe (los mensajes que entiende) le vamos a decir interfaz. Para que un objeto trate indistintamente a otros, lo lograra enviándole  los mismos mensajes. La idea esta que las clases que cumplan con la interfaz, van a manejar esos mensajes de forma distinta.

Entonces, podemos decir que un objeto trata **polimórficamente** a otros cuando les envía a ambos exactamente los mismos mensajes, sin importarle cual es cual y ellos pueden responder ya que tienen una interfaz común.

## Responsabilidad

Es aquello que hace un objeto. Aquello que nosotros queremos que haga. Si tenemos un solo objeto que hace demasiadas o todas las tareas de nuestro programa (a.k.a. God Object), probablemente sea complicado que nuestro programa cambie y resuelva nuevos problemas. 

## Delegación y Colaboración

Cada objeto resuelve su problema ¿Cómo los vinculamos entre si? Los objetos se conocen a través de referencias, y así pueden mandarse mensajes. Cuando un objeto resuelve parte de un problema y le pasa otra parte del problema a algún objeto que conozca, hablamos que ambos objetos están **colaborando**. Así, cuando un objeto le encarga toda la tarea a resolver a otro objeto, decimos que este **delega la responsabilidad**.


Siempre tengo que programar pensando en el polimorfismo, si arranque con un `switch statements` , atento que puede estar mal planteado el disenso.

# Clase 2

## Composición

La composición es un principio de diseño que permite construir objetos complejos al combinar varios objetos más simples. Es una forma de asociación entre clases donde un objeto contiene o está compuesto por otros objetos. La idea principal es que un objeto puede estar formado por otros objetos, y estos objetos "componentes" pueden ser instancias de una clase diferente.

La composición permite construir estructuras más complejas y reutilizables al combinar componentes existentes en lugar de heredar directamente de ellos, como se hace en la herencia. Promueve la flexibilidad y el bajo acoplamiento, ya que los cambios en una clase no afectan directamente a las demás clases, siempre y cuando la interfaz entre ellas se mantenga constante.

- Dinámico (la implementación se puede cambiar en run-time, ya que se basa sólo en un atributo que se puede settear en cualquier momento con otro objeto que sea polimórfico)
- Aumenta la cantidad de objetos -> Mayor complejidad (Es más complicado entender el todo y hay que configurar adecuadamente las relaciones entre los objetos)
- Se reparten mejor las responsabilidades en objetos más chicos

## Instancia de clases

La clase me sirve para instanciar un objeto, va a tener atributos y métodos. En la declaración de las referencias de la clase se le puede asignar un valor inicial, que actúa como valor por defecto.

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

Objetos pueden ser iguales pero no idénticos. Es decir que pueden tener el mismo estado interno pero esto no significa que los objetos sean los mismos. 

Para trabajar con gran cantidad de datos, puedo usar listas con objetos.

```wollok
object pdpNoche {
	var property alumnos = [new Alumno(), new Alumno()]
	...
}
```

Cuando voy a filtrar o mapear, tengo que tener en cuenta el estado interno, no quiero perder información anterior. Tengo mensajes que causan efectos y otros que son consultas

Algunas funcionalidades que no causan efectos:
- map -> `pDePNoche.alumnos().map(XXXXXX)`
- filter -> Tener cuidado con el filter ya que el contenido sigue apuntando a los mismos objetos
- any

El problema que tengo es que no existen funciones, por lo que tengo que pasar un objecto con un método para poner en el map => `pDePNoche.alumnos().map(funcionLegajo.apply()`. De todas maneras, tenemos un azúcar sintáctico para crear esto de una manera mas fácil => `pDePNoche.alumnos().map({alumno=>alumno.legajo})`. Me crea un objecto anónimo.

Lo mejor que puedo hacer es realizar estas funciones dentro de un método de una clase. (Ver doc)

Para iterar sobre listas, podemos usar `[].forEach({alumno=>...})`, esto causa efecto y no me va a devolver nada. Por lo que esto lo vamos a usar cuando queremos causar un efecto destructivo elemento por elemento.

# Clase 4

## Herencia

La herencia es un mecanismo que tiene por objetivo principal el compartir lógica/código similar. Esto lleva a evitar la duplicación de lógica/código. Cuando un objeto recibe un mensaje, mediante Method lookup buscará el comportamiento requerido en la clase de la cual es instancia y, en caso de no tener un método para el mismo, en sus superclases.

Las superclases tienden a representar un concepto más general, mientras que las subclases se enfocan a especializaciones o casos particulares.

- Estática (no puedo cambiar la clase de un objeto en run-time, si creo otro objeto se pierde la identidad lo cual trae problemas)
- Menos objetos -> Menos complejidad
- Es una relación entre clases! Es mucho más fuerte que la relación entre instancias planteada en composición. La herencia implica no sólo heredar código sino conceptos.

## Clase abstracta

Una clase abstracta es aquella que no tiene sentido instanciar porque es demasiado genérica y no tiene una implementación concreta para algunos mensajes que debería entender porque está definido en sus subclases.

Estática (no puedo cambiar la clase de un objeto en run-time, si creo otro objeto se pierde la identidad lo cual trae problemas)
Menos objetos -> Menos complejidad
Es una relación entre clases! Es mucho más fuerte que la relación entre instancias planteada en composición. La herencia implica no sólo heredar código sino conceptos.

# Clase 5
*Manejo de errores - Los metodos tienen que hacer lo que prometen o frenar todo y explotar*

## Errores y excepciones

Como los objetos se comunican entre ellos, puede ser que cuando el emisor espera que el receptor haga una tarea, falle el método. Esto nos va a generar una excepción. Una **excepción** es un evento que altera el flujo normal de mensajes entre objetos. 

Hay dos formas de expresar la generación de una excepción, una con un mensaje que entiende todo objeto y  otra instanciando una excepción, utilizando el concepto de clase.

```wollok
	// Enviando mensaje
	self.error("Pasó tal cosa") 

	// Instanciando una excepción 
	throw new UserException(message = "Pasó tal cosa")
```

¿Cómo funciona? La clase UserException la definimos utilizando herencia:

`class UserException inherits Exception { }`

Por lo general, los objetos de dominio (el cliente, el alumno, el héroe, un ave) no suelen atrapar los errores. Más bien lo único que hacen es lanzar los errores o dejar que ocurran.

## Excepciones de usuario y de programa

- Excepciones de usuario o de dominio: ocurren en el uso de la aplicación y son entendibles para el usuario final (“no hay saldo en la cuenta corriente”, “no hay stock del producto a facturar”, “no hay precio del producto a facturar”, etc.)
- Excepciones de programa: se producen cuando se ejecuta código de la aplicación y las puede analizar un especialista técnico (“falló el acceso al motor de la base de datos”, “hubo división por cero”, “el objeto no entiende este mensaje”, etc.)

La naturaleza de ambos tipos de excepción son diferentes: en general las excepciones de negocio (o de aplicación) requieren que el usuario corrija la información que quiere ingresar al sistema, en tanto que las excepciones de programa requieren una corrección por parte de un usuario técnico.

Por lo tanto, las acciones a tomar cuando armamos cada tipo de excepción son diferentes: en las excepciones de negocio intentamos que el usuario vea un mensaje amigable donde le mostramos el problema que hubo al tratar de completar una acción con un mensaje representativo (e incluso proponiéndole soluciones alternativas para que la tarea se realice), mientras que en las excepciones de programa también mostramos un mensaje amigable al usuario, pero reservamos todos los detalles internos al desarrollador. De esa manera, las excepciones terminan siendo una herramienta más que ayuda a que nuestra aplicación se vuelva más robusta y confiable.

## Manejos de errores

Si tenemos algo inteligente para hacer y resolver nuestras excepciones, vamos a poder usar un `try/catch`. A esto llamamos **capturar** errores. Podemos usar tantos catch como queremos. Los casos mas especificos vamos a ponerlos arriba.

Podemos capturar distintos 'tipos' de excepciones. Vamos a poder capturar cosas mas especificas, usando una clase de excepciones y patrones.

```wollok
    ...
	try {
		...
	} catch error: MiExcepcion {
		...
	}
	
	// Solo captura un error que sea de tipo MiExcepcion
    ...
    
    
    ... throw new MiExcepcion() ...
    
    
    class MiExcepcion inherits DomainException {
    		...
	}
```

Cuando tenemos una situacion de dominio nueva, creamos una nueva excepcion con su respectiva clase, heredando de `DomainException`. 

Tambien existe el `then always` que va al final del `try/catch`, que pase lo que pase, lo que este dentro de ese `then always` se ejecuta siempre.

## Resumen

Las excepciones nos sirven para modelar condiciones que salen del flujo normal del negocio. Para los objetos de dominio las formas correctas de usar este concepto es muy simple: 
- en el caso de los errores de programa, no se pueden prever, así que no debemos hacer nada
- en el caso de los errores de usuario, debemos detectarlos y alertar al usuario lo más tempranamente posible, tratando de dar un mensaje de las acciones que debe realizar para poder completar la acción que desea.

Por último, hay mecanismos para atrapar las excepciones y volver al sistema a un estado consistente, aunque por lo general son raros los casos en el que un objeto de dominio puede hacer algo al respecto.
