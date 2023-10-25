class Casa{
	
	const habitaciones = []
	var familia = null
	
	method agregarFamilia(unaFamilia){familia = unaFamilia}
	method habitacionesOcupadas(){habitaciones.filter({a => a.personasAdentro().size() > 0})}
	method responsablesDeLaCasa(){habitaciones.map({a => a.personaMasGrande()}).asSet()}
	
}