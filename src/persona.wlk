class Persona {
	var property edad
	var habilidadesEnCocina = false
	var dondeEsta = nullHabitacion
	
	method dondeEsta() = dondeEsta
	method habilidadesEnCocina() = habilidadesEnCocina
	method cambiarHabilidad() {habilidadesEnCocina = true}
	method entrarHabitacion(unaHabitacion){dondeEsta = unaHabitacion}
	method nivelDeConfortPersonal(unaCasa){
		return unaCasa.sum({a => a.habitaciones.nivelConfort()})
	}
	}

object nullHabitacion{
	
}