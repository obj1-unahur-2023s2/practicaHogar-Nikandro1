import persona.*

class Habitacion {
	var nivelConfort = 10
	const personasAdentro = []
	method nivelConfort() = nivelConfort
	method personasAdentro() = personasAdentro
	method agregarPersonaAHabitacion(unaPersona){
		if (self.puedeEntrar(unaPersona)){
			personasAdentro.add(unaPersona)
			unaPersona.entrarHabitacion(self)
		}
	}
	method puedeEntrar(unaPersona) = true
	method personaMasGrande(){
		return personasAdentro.max({p=>p.edad()})
	}
}

class UsoGenral inherits Habitacion{
	
}
class Banio inherits Habitacion{
	
	override method nivelConfort(){
		super()
		if (personasAdentro.first().edad() < 5){nivelConfort += 2}
		else{nivelConfort += 4}
		return nivelConfort
	}	
	override method puedeEntrar(unaPersona){
		return personasAdentro.size() == 0 or personasAdentro.first().edad() < 4
	}
}
class Dormitorio inherits Habitacion{
	const persona = []
	var duermen = []
	method duermen() = duermen 
	method persona() = persona
	method ocuparDormitorio(unaPersona){
		persona.add(unaPersona)
	}
	method agregarParaDormir(unaPersona){
		duermen.add(unaPersona)
	}
	override method nivelConfort(){
		super()
		if (not persona.isEmpty()){nivelConfort += (10 / persona.size())}
		return nivelConfort
	}
	method ocupanteDuerme(unaPersona){
		return duermen.contains(unaPersona)
	}
	override method puedeEntrar(unaPersona){
		return persona.all({o=>self.ocupanteDuerme(o)})
	}
}
class Cocina inherits Habitacion{
	var metrosCuadrados

	method metrosCuadrados() = metrosCuadrados
	override method nivelConfort(){
		if (self.hayCocinero()){
			nivelConfort += metrosCuadrados * porcentaje.numero() / 100
		}
		return nivelConfort
	}
	override method puedeEntrar(unaPersona){
		return not unaPersona.habilidadesEnCocina() or not self.hayCocinero()
	}
	method hayCocinero(){
		return personasAdentro.any({a => a.habilidadesEnCocina()})
	}
	method cantidadCocineros(){
		return personasAdentro.count({a=>a.habilidadesEnCocina()})
	}
}

object porcentaje{
	var property numero =10
}