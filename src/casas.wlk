class Casa{
	
	const habitaciones = []
	
	
	method habitacionesOcupadas(){habitaciones.filter({a => a.personasAdentro().size() > 0})}
	method responsablesDeLaCasa(){habitaciones.map({a => a.personaMasGrande()}).asSet()}
	method cantidadDeHabitacionesQuePuedeEntrar(unaPersona){
		return unaPersona.count({h=>h.puedeEntrar(unaPersona)})
	}
	method noHayHabitacionConMasDeDosPersonas(){
		return habitaciones.all({a=>a.personasAdentro().size()<3})
	}
}

class Familia{
	var casa = nullCasa
	const integrantes = []
	method integrantes() = integrantes
	method agregarIntegrantes(unaPersona){
		integrantes.add(unaPersona)
	} 
	method ocuparCasa(unaCasa){
		casa = unaCasa
	}
	method hayCocineroEnLaFamilia(){
		return integrantes.any({i=>i.hayCocinero()})
	}
	method nivelTotalConfort(){
		return integrantes.sum({i=>i.nivelDeConfortPersonal()})
	}
	method nivelConfortPromedio(){
		return self.nivelTotalConfort() / integrantes.size()
	}
}

object nullCasa{
	
}