class Universidad {
	const provincia = #{}
	var honorarioRecomendados
	var dineroRecibidoPorDonaciones = 0
	
	method provincia() = provincia
	method provinciaDeDondeProvieneLaUni(unaProvincia){
		provincia.add(unaProvincia)
	}
	method honorarioRecomendados() = honorarioRecomendados
	method cambiarHonorarioRecomendados(nuevoHonorario){
		honorarioRecomendados = nuevoHonorario
	}
	method dineroRecibidoPorDonaciones() = dineroRecibidoPorDonaciones 
	method recibir(importe) { dineroRecibidoPorDonaciones = dineroRecibidoPorDonaciones + importe }
}

object asociacionDeProfesionalesDelLitoral{
	var dineroRecaudado = 0

	method dineroRecaudado() = dineroRecaudado 
	method recibir(importe){ 
		dineroRecaudado = dineroRecaudado + importe
	}
}

const universidadDeSanMartin = new Universidad(provincia = #{"Buenos Aires"}, honorarioRecomendados = 3500)

const universidadDeRosario = new Universidad(provincia = #{"Santa Fe"}, honorarioRecomendados = 2800)

const universidadDeCorrientes = new Universidad(provincia = #{"Corrientes"}, honorarioRecomendados = 4200)

const universidadDeHurlingham = new Universidad(provincia = #{"Buenos Aires"}, honorarioRecomendados = 8800)