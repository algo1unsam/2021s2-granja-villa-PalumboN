import wollok.game.*
import cultivos.*

object hector {

	var property position = game.center()
	const property image = "player.png"

	method sembrarMaiz() {
		game.addVisual(new Maiz(position = position))
	}
	
	method sembrarTrigo() {
		game.addVisual(new Trigo(position = position))
	}
	
	method ponerRegador() {
		const regador = new Regador(position = position)
		game.addVisual(regador) 
		game.onTick(1000, "REGADOR" + regador.identity(), { regador.regarCultivosAlrededor() })
	}

	method regarCultivosDebajo() {
		const cultivosDebajo = self.cultivosDebajo()
		cultivosDebajo.forEach({ cultivo => cultivo.regar()})
	}

	method cultivosDebajo() {
		const cultivosDebajo = game.colliders(self)
			// Valido que existe alguno 
		if (cultivosDebajo.isEmpty()) {
			self.error("No hay cultivos acá!")
		}
		return cultivosDebajo
	}
	
	method regar() {
		game.say(self, "Cuidado con el agua!")
	}

}

class Regador {

	const property position = game.center()
	const property image = "regador.png"

	method regarCultivosAlrededor() {
		self.cultivosAlrededor().forEach({ cultivo => cultivo.regar()})
	}

	method cultivosAlrededor() {
		return self.posicionesAlrededor().flatMap({ posicion => posicion.allElements() })
	}
	
	method laterales() {
		return [position.up(1), position.left(1), position.down(1), position.right(1)]
	}
	method esquinas() {
		return [position.up(1).left(1), position.up(1).right(1), position.down(1).left(1), position.down(1).right(1)] 
	}
	
	method posicionesAlrededor() {
		return self.laterales() + self.esquinas()
	}
	
	method regar() {
		// No pasa na'
	}

}

