import casas.*
import habitacion.*

class Persona {
	var property edad
	var habilidadesEnCocina = false
	var dondeEsta = nullHabitacion
	
	method dondeEsta() = dondeEsta
	method habilidadesEnCocina() = habilidadesEnCocina
	method cambiarHabilidad() {habilidadesEnCocina = true}
	method entrarHabitacion(unaHabitacion){dondeEsta = unaHabitacion}
	//method nivelDeConfortPersonal(unaHabitaciones){
	//	return unaHabitaciones.nivelConfort()
	//}
	method estaAGusto(unaCasa, familia) = false
	}


class Obsesives inherits Persona{
	override method estaAGusto(unaCasa, familia){
		return unaCasa.cantidadDeHabitacionesQuePuedeEntrar(self) > 0 and 
		unaCasa.noHayHabitacionConMasDeDosPersonas()
	}
}
class Goloses inherits Persona{
	override method estaAGusto(unaCasa, familia){
		return unaCasa.cantidadDeHabitacionesQuePuedeEntrar(self) > 0 and 
		familia.hayCocineroEnLaFamilia()
	}
}
class Sencilles inherits Persona{
	override method estaAGusto(unaCasa, familia){
		return unaCasa.cantidadDeHabitacionesQuePuedeEntrar(self) and 
		unaCasa.habitaciones().size() > familia.integrantes().size()
	}
}
object nullHabitacion{
	
}