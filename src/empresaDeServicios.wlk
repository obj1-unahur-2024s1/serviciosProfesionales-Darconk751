import profesionales.*
import solicitantes.*
import universidad.*

class EmpresaDeServicios {
	const profesionalesContratados = #{}
	const honorarioDeReferencia 
	const solicitantes = #{}
	const clientesDeEmpresa = #{}
	
	method clientesDeEmpresa() = clientesDeEmpresa
	method agregarClienteDeEmpresa(unCliente){
		clientesDeEmpresa.add(unCliente)
	}
	method despedirClienteDeEmpresa(unCliente){
		clientesDeEmpresa.remove(unCliente)
	}
	method profesionalesContratados() = profesionalesContratados
	method honorarioDeReferencia() = honorarioDeReferencia
	method contratarProfesional(unProfesional){
		profesionalesContratados.add(unProfesional)
	}
	method despedirProfesional(unProfesional){
		profesionalesContratados.remove(unProfesional)
	}
	method cantidadDeProfesionalesQueEstudiaronEn(unaUniversidad) =
		profesionalesContratados.count({profesional => profesional.universidad() == unaUniversidad})
	method profesionalesCaros() = 
		profesionalesContratados.filter({profesional => profesional.honorariosPorHora() > self.honorarioDeReferencia()})
	method universidadesFormadoras() = profesionalesContratados.map({profesional => profesional.universidad()}).asSet()
	method profesionalMasBarato() = 
		profesionalesContratados.min({profesional => profesional.honorariosPorHora()})
	method esGenteAcotada() = 
		profesionalesContratados.all({profesional => profesional.esAcotado()})
	method solicitantes() = solicitantes
	method agregarSolicitante(unSolicitante){
		solicitantes.add(unSolicitante)
	}
	method puedeSatisfacerASolicitante(unSolicitante) = 
		self.profesionalesContratados().asList().any({profesional => unSolicitante.puedeSerAtentidoPor(profesional)})
	method darServicio(solicitante){
		if(self.puedeSatisfacerASolicitante(solicitante)){
			const profesionalElegido = profesionalesContratados.find({profesional => solicitante.puedeSerAtendidoPor(profesional)})
			profesionalElegido.cobrar(profesionalElegido.honorariosPorHora())
			clientesDeEmpresa.add(solicitante)
		}
	}
	method cantidadDeClientesDeEmpresa() = clientesDeEmpresa.size()
	method laEmpresaTieneDeCliente(unCliente) = clientesDeEmpresa.contains(unCliente)
}

const empresa1 = new EmpresaDeServicios(honorarioDeReferencia = 3500)