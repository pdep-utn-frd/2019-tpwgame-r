import wollok.game.*

object fondo {
	method imagen() = "fondo2.png"
}

object heroe {
	var property position = game.at(0,3)
	var ataque = 40
	var vida = 500
	var magia = 500
	var property image = "persona.png"
	method nombre() = "Persona"
	
	method vidaActual(){
		return vida
	}
	
	method criticoOFalla(){
		return ataque*((0.randomUpTo(2))).roundUp()
	}
	
	method animacionAtaque(){
		if(image == "persona.png" ){
			image = "22.png"
		}else {image = "persona.png"}
	}
	
	method atacar(){
		self.animacionAtaque()
		enemigo.recibirAtaque(self.criticoOFalla())
		enemigo.ataqueEnemigo()
		magia = magia + 10
	}
	
	method ataqueEspecial(){
		if(vida < 300)
			enemigo.recibirAtaque(ataque*10)
	}
	
	method recibirAtaque(danio){
		vida = vida - danio
	}
	
	method magia(){
		if(magia > 20 ){
			enemigo.recibirAtaque(50)
			magia = magia - 20
			enemigo.ataqueEnemigo()
		}
	}
	
	method cura(){
		if(magia > 20 and vida < 300){
			vida = vida + 50
			magia = magia - 50
			enemigo.ataqueEnemigo()	
		}
	}
	
	method muerto(){
		return vida <= 0
	}
}

object milos{
	var property position = game.center()
	method image() = "ultima.png"
}

object enemigo {
	var property position = game.center()
	var ataque = 20
	var vida = 1000
	var magia = 1000
	method image() = "demon.gif"
	method nombre() = "Enemigo"
	
	
	method vidaEnemiga(){
		if(vida == 1000*0.75 or vida > 1000*0.50){
			vidas.vida75()
		}
		else if(vida == 1000*0.50 or vida > 1000*0.35){
			vidas.vida50()
		}
		else if(vida == 1000*0.35 or vida > 1000*0.10){
			vidas.vida75()
		}
		else if(self.muerto()){
			vidas.vida0()
		}
	}
	
	
	method ataqueEnemigo(){
		if(vida > 300)
			self.atacar()
		else{
			self.cura()
		}
	}
	
	method recibirAtaque(danio){
		vida = vida - danio
		self.vidaEnemiga()
	}
	
	method atacar(){
		heroe.recibirAtaque(ataque)
	}
	
	method cura(){
		if(magia > 20){
			magia = magia - 50
			vida = vida + 300	
		}		
	}
	
	method vidaActual(){
		return vida
	}
	
	method muerto(){
		return vida < 0
	}
	
}

object borrarFoto{
	method borrar(){
		if(enemigo.muerto()) 
			 game.removeVisual(enemigo)
		}
}

object ataqueheroe{
	var property position = game.at(0,3)
	method image() = "22.png"
}

object vidas{
	var property image = "vidaEnemiga100.png"
	var property position = game.at(5,8)
	
	method vida0(){
		if(image == "vidaEnemiga35.png")
			image = "vidaEnemiga0.png"
	}
	method vida35(){
		if(image == "vidaEnemiga50.png")
			image = "vidaEnemiga35.png"
	}
	method vida75(){
		if(image == "vidaEnemiga100.png")
			image = "vidaEnemiga75.png"
	}
	method vida50(){
		if(image == "vidaEnemiga75.png")
			image = "vidaEnemiga50.png"
	}
}
