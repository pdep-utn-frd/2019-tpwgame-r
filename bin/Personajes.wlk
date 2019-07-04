import wollok.game.*

/*
 * El codigo no esta prolijo ya que lo que importaba era aprender y probar la libreria de wollokGame
 * 
 * Mejorar codigo crear Clase PERSONAJE, por el momento lo mas importante son heroe y enemigo
 * mas adelante estaria bueno luego de eliminar al enemigo, hacer un JEFE FINAL con mas opciones como Magia y AtaqueEspecial
 * 
 * Mejorar codigo ----------> mas objeto
 * 
 * 
 * Probar musica -----------> ff.mp3 y Cut_ff.mp3(Por el momento hay un error con wollokGame o Wollok en general)
 * 
 * Hacer una pantalla de bienvenida ENTER ----> Iniciar Batalla
 * 									ESC ------> Salir del juego
 */

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
	
	method vidaHeroe(){
		if(vida == 500*0.75 or vida > 500*0.50){
			vidaHeroe.vida75()
		}
		else if(vida == 500*0.50 or vida > 500*0.35){
			vidaHeroe.vida50()
		}
		else if(vida == 500*0.35 or vida > 500*0.10){
			vidaHeroe.vida35()
		}
		else if(self.muerto()){
			vidaHeroe.vida0()
		}
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
		if(!self.muerto() and !enemigo.muerto()){
			self.animacionAtaque()
			enemigo.recibirAtaque(self.criticoOFalla())
			enemigo.ataqueEnemigo()
			magia = magia + 10
		}
	}
	
	method ataqueEspecial(){
		if(!self.muerto() and !enemigo.muerto()){
			if(vida < 300){
				enemigo.recibirAtaque(ataque*10)
				self.animacionAtaque()
			}	
		}
	}
	
	method recibirAtaque(danio){
		vida = vida - danio
		self.vidaHeroe()
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

/*
 * Para futura actualizacion
 
object jefeFinal{
	var property position = game.center()
	method image() = "ultima.png"
}
*/

object enemigo {
	var property position = game.center()
	var ataque = 20
	var vida = 1000
	var magia = 1000
	var property image = "ultima2.png"
	method nombre() = "Enemigo"
	
	
	method barraVida(){
		if(vida == 1000*0.75 or vida > 1000*0.50){
			vidas.vida75()
		}
		else if(vida == 1000*0.50 or vida > 1000*0.35){
			vidas.vida50()
		}
		else if(vida == 1000*0.35 or vida > 1000*0.10){
			vidas.vida35()
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
		self.barraVida()
		self.animacionAtacado()
	}
	
	method atacar(){
		heroe.recibirAtaque(ataque)
	}
	
	method cura(){
		if(magia > 20){
			magia = magia - 50
			vida = vida + 300
			self.barraVida()	
		}		
	}
	
	method vidaActual(){
		return vida
	}
	
	method muerto(){
		return vida < 0
	}
	
	method animacionAtacado(){
		if(image == "ultima2.png"){
			image = "ultima2atacado.png"
		}else{
			image = "ultima2.png"
		} 
	}
	
}

object borrarFoto{
	method borrar(){
		if(enemigo.muerto()) 
			 game.removeVisual(enemigo)
		}
}


//Animacion del ataque del heroe
object ataqueheroe{
	var property position = game.at(0,3)
	method image() = "22.png"
}

//Objetos para la animacion de vida
object vidas{
	var property image = "vidaEnemiga100.png"
	var property position = game.at(5,4)
	
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
object vidaHeroe{
	var property image = "vidaEnemiga100.png"
	var property position = game.at(0,6)
	
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


/* 
 * Futura actualizacion en el cual al matar al enemigo aparezca un cartel.
object cartel{
	var property position = game.at(0,0)
	var property image = "enemigoMuerto.png"
}
* 
* 
*/