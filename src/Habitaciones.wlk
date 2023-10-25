import Personas.*

class Casa {
	const estan = []
	const habitaciones = []
	method confortAportado(unaPersona) = 10
	method estaLaPersonaEnLaHabitacion(unaPersona){estan.contains(unaPersona)}
	method salirDeHabitacion(unaPersona){estan.remove(unaPersona)}
	method puedeEntrar(unaPersona) = true
	method entrarEnHabitacion(unaPersona){if (self.puedeEntrar(unaPersona)){estan.add(unaPersona)}}
	method cantidadDeGente(){return estan.size()}
	
	method todasTieneUno(){
		habitaciones.all({p =>p.cantidadDeGente() >= 1})
	}
}

class UsoGeneral inherits Casa{
	override method confortAportado(unaPersona) = 10
	override method entrarEnHabitacion(unaPersona){
		estan.add(unaPersona)
	}
	override method salirDeHabitacion(unaPersona){
		if(!self.estaLaPersonaEnLaHabitacion(unaPersona)){
			self.error("no esta en la habitacion")
		} else {
			estan.remove(unaPersona)
		}
	}
}

class Banios inherits Casa {
	
	override method confortAportado(unaPersona){
		return if(unaPersona.edad() <= 4){super(unaPersona) + 2}else{super(unaPersona) + 4}
		}
	override method puedeEntrar(unaPersona){
		return not estan.any({p => unaPersona.esBebe()})
	}
	
}

class Dormitorios inherits Casa {
	const duermen = []
	
	override method confortAportado(unaPersona){
		return if(self.estaLaPersonaDurmiendo(unaPersona)){
			super(unaPersona) + 10 / self.cantidadDeGente()
		} else {
			super(unaPersona)
		}
	}
	
	override method cantidadDeGente(){
		return duermen.size()
	}
	
	override method puedeEntrar(unaPersona){
		return (estan.all({o => self.estaLaPersonaDurmiendo(o)}))
	}
		
	method estaLaPersonaDurmiendo(unaPersona){
		return duermen.contains(unaPersona)
	}
}

class Cocina inherits Casa {
	
	const property metrosCuadrados
	
	override method confortAportado(unaPersona){
		return if(unaPersona.sabeCocinar()){
			super(unaPersona) + metrosCuadrados * valorModificado.valor() 
		} else {
			super(unaPersona)
		}
	}
	
	method hayChef(){
		return estan.any({p => p.sabeCocinar()})
	}
	
	override method puedeEntrar(unaPersona){
		return !self.hayChef()
	}
	
}

object valorModificado{
	var property valor = 0.1 
}