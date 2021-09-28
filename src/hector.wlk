import wollok.game.*
import cultivos.*

object hector {
	var property position = game.center()
	const property image = "player.png"

	method sembrarMaiz() {
		game.addVisual(new Maiz(position = position)) 
	}
	
	method regarCultivosDebajo() {
		const cultivosDebajo = self.cultivosDebajo()
		cultivosDebajo.forEach({ cultivo => cultivo.regar() }) 
	}
	
	method cultivosDebajo() {
		const cultivosDebajo = game.colliders(self)
		// Valido que existe alguno 
		if (cultivosDebajo.isEmpty()) {
			self.error("No hay cultivos acá!")
		}
		return cultivosDebajo
	}
}