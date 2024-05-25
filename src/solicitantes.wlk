import profesionales.*
import universidad.*
import empresaDeServicios.*

class Persona {
	var provincia 
	method provincia() = provincia
	method puedeSerAtendidoPor(profesional) = profesional.provinciasDondePuedeTrabajar().contains(provincia)
}

class Institucion {
	const universidadesReconocidas = #{}
	method universidadesReconocidas() = universidadesReconocidas
	method agregarUniversidadReconocida(unaUniversidad){
		universidadesReconocidas.add(unaUniversidad)
	}
	method sacarUniversidadReconocida(unaUniversidad){
		universidadesReconocidas.remove(unaUniversidad)
	}
	method puedeSerAtendidoPor(profesional) = 
		universidadesReconocidas.contains(profesional.universidad())
}

class Club {
	const provinciasDondeEstaUbicado = #{}
	method provinciasDondeEstaUbicado() = provinciasDondeEstaUbicado
	method agregarProvinciaDondeEstaUbicado(unaProvincia){
		provinciasDondeEstaUbicado.add(unaProvincia)
	}
	method removerProvinciaDeDondeEstaUbicado(unaProvincia){
		provinciasDondeEstaUbicado.remove(unaProvincia)
	}
	method puedeSerAtendidoPor(unProfesional) = 
		provinciasDondeEstaUbicado.any({provincia => unProfesional.provinciasDondePuedeTrabajar().contains(provincia)})
	
}

const persona1 = new Persona(provincia = "Buenos Aires")
const institucion1 = new Institucion()
const club1 = new Club()
