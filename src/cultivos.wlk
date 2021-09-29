import wollok.game.*

class Maiz {
	const property position
	var property esAdulto = false
	
	method image() {
		const sufijo = if (esAdulto) "adult" else "baby" 
		return "corn_" + sufijo +".png"
	}
	
	method regar() {
		esAdulto = true
	}
}

class Trigo {
	const property position
	var nivel = 0
	
	method image() { 
		return "wheat_" + nivel.toString() +".png"
	}
	
	method regar() {
		nivel = (nivel + 1) % 4
	}
}