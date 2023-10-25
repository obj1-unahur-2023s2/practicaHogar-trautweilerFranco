import Habitaciones.*
class Familia{
	const familia = []
}

class Persona inherits Familia{
	var property edad
	var sabeCocinar
	var confort
	
	method confortApo(unaHabitacion){
		confort += unaHabitacion.confortAportado(self)
	}
	method esBebe(){
		return self.edad()<=4
	}
	method sabeCocinar() = sabeCocinar
	method aprenderACocinar(){
		sabeCocinar = true
	}
}
