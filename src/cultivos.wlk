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