import universidad.*

// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	method esAcotado() = self.provinciasDondePuedeTrabajar().size() <= 3
	method cobrar(importe) { asociacionDeProfesionalesDelLitoral.recibir(importe) }
	method cobrarServicio() { self.cobrar(self.honorariosPorHora()) }
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad 
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() {
		return universidad.provincia()
	}	
	method esAcotado() = self.provinciasDondePuedeTrabajar().size() <= 3
	method honorariosPorHora() = universidad.honorarioRecomendados()
	method cobrar(importe) { universidad.recibir(importe / 2) }
	method cobrarServicio() { self.cobrar(self.honorariosPorHora()) }
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad
	const provinciasDondePuedeTrabajar = #{}
	var honorariosPorHora
	var dineroRecaudado = 0
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() = provinciasDondePuedeTrabajar
	method agregarProvinciasDondeTrabajar(provincia){
		provinciasDondePuedeTrabajar.add(provincia)
	}
	method sacarProvinciasDondeTrabajar(provincia){
		provinciasDondePuedeTrabajar.remove(provincia)
	}
	method honorariosPorHora() = honorariosPorHora
	method nuevoHonorarioPorHora(unHonorarioPorHora){
		honorariosPorHora = unHonorarioPorHora
	}
	method esAcotado() = self.provinciasDondePuedeTrabajar().size() <= 3
	method dineroRecaudado() = dineroRecaudado
	method cobrar(importe) { dineroRecaudado = dineroRecaudado + importe }
	method cobrarServicio() { self.cobrar(self.honorariosPorHora()) }
	method pasarDinero(persona, importe) { 
		persona.cobrar(importe)
		dineroRecaudado = dineroRecaudado - importe
	}
}

const juana = new ProfesionalVinculado(universidad = universidadDeRosario)

const melina = new ProfesionalAsociado(universidad = universidadDeCorrientes)

const rocio = new ProfesionalLibre(universidad = universidadDeHurlingham, honorariosPorHora = 5000)

const luciana = new ProfesionalLibre(universidad = universidadDeRosario, honorariosPorHora = 3200)

