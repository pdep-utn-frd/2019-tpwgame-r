import wollok.game.*

/*
 * El codigo no esta prolijo ya que lo que importaba era aprender y probar la libreria de wollokGame
 * 
 * Mejorar codigo crear Clase PERSONAJE, por el momento lo mas importante son heroe y enemigo
 * mas adelante estaria bueno luego de eliminar al enemigo, hacer un JEFE FINAL con mas opciones como Magia y AtaqueEspecial
 * 
 * Mejorar codigo ----------> mas objeto 
 * Hacer una pantalla de bienvenida ENTER ----> Iniciar Batalla
 * 									ESC ------> Salir del juego
 */

object heroe {
	var property position = game.at(0,3)
	var ataque = 40
	var vida = 500
	var magia = 500
	var property image = "persona.png"
	var impacto = [0,1,2]
	method nombre() = "Persona"
	
	method vidaActual(){
		return vida
	}
	
	method vidaHeroe(){
		if (vida <= 500*0.875 && vida > 500*0.75){
			vidaHeroe.vida87()
		}
		else if(vida <= 500*0.75 && vida > 500*0.625){
			vidaHeroe.vida75()
		}
		else if(vida <= 500*0.625 && vida > 500*0.50){
			vidaHeroe.vida62()
		}
		else if(vida <= 500*0.50 && vida > 500*0.35){
			vidaHeroe.vida50()
		}
		else if(vida <= 500*0.35 && vida > 500*0.10){
			vidaHeroe.vida35()
		}
			else if(vida <= 500*0.1 && vida > 500*0.01){
			vidaHeroe.vida10()
		}
		else if(self.muerto()){
			vidaHeroe.vida0()
		}
	}
	
	
	
	
	method criticoOFalla(){
		return ataque*(impacto.anyOne())
	}
	
	method animacionAtaque(){
		if(image == "persona.png" ){
			image = "22.png"
		}
		else if(enemigo.muerto() and image == "22.png"){
			image == "persona.png"
		}
		else {image = "persona.png"}
	}
	
	method atacar(){
		if(!self.muerto() and !enemigo.muerto()){
			self.animacionAtaque()
			enemigo.recibirAtaque(self.criticoOFalla())
			enemigo.ataqueEnemigo()
			magia += 10
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
	
	
	method realizar(accion) {
	    accion.aplicarseSobre(enemigo)
	}

	
	method cura(){
		if(magia > 50 and vida < 300){
			game.sound("curar.mp3")
			vida = vida + 50
			magia = magia - 50
			self.vidaHeroe()
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

 object magia
    
 	method efectuarseSobre(alguien){
		//if(magia > 20){
			alguien.recibirAtaque(50)
			//magia = magia - 20
			alguien.ataqueEnemigo()
		//}
	}
object ataque{
  method efectuarseSobre(alguien){
  alguien.recibirAtaque(10)
  alguien.ataqueEnemigo()}}
  object cura{
  method efectuarseSobre(alguien){
  alguien.recibirCura()}}

object enemigo {
	var property position = game.center()
	var ataque = 20
	var vida = 1000
	var magia = 1000
	var property image = "ultima2.png"
	method nombre() = "Enemigo"
	
	
	method barraVida(){
		if (vida <= 1000*0.875 && vida > 1000*0.75){
			vidaHeroe.vida87()
		}
		else if(vida <= 1000*0.75 && vida > 1000*0.625){
			vidas.vida75()
		}
		else if(vida <= 1000*0.625 && vida > 1000*0.50){
			vidaHeroe.vida62()
		}
		else if(vida <= 1000*0.50 && vida > 1000*0.35){
			vidas.vida50()
		}
		else if(vida <= 1000*0.35 && vida > 1000*0.10){
			vidas.vida35()
		}
		else if(vida <= 500*0.1 && vida > 500*0.01){
			vidaHeroe.vida10()
		}
		else if(vida < 1000* 0.01 or self.muerto()){
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
	var property position = game.at(5,9)
	
	method vida0(){
	
			image = "vidaEnemiga0.png"
	}
		method vida10(){
		
			image = "vidaEnemiga10.png"
	}
	method vida35(){
		
			image = "vidaEnemiga35.png"
	}
		method vida62(){
		
			image = "vidaEnemiga62.png"
	}
	method vida75(){
		
			image = "vidaEnemiga75.png"
	}
	method vida50(){
		
			image = "vidaEnemiga50.png"
	}
		method vida87(){
		
			image = "vidaEnemiga87.png"
	}
	method vida100(){
		
			image = "vidaEnemiga100.png"
	}
}
object vidaHeroe{
	var property image = "vidaEnemiga100.png"
	var property position = game.at(0,6)
	
	method vida0(){
	
			image = "vidaEnemiga0.png"
	}
		method vida10(){
		
			image = "vidaEnemiga10.png"
	}
	method vida35(){
		
			image = "vidaEnemiga35.png"
	}
		method vida62(){
		
			image = "vidaEnemiga62.png"
	}
	method vida75(){
		
			image = "vidaEnemiga75.png"
	}
	method vida50(){
		
			image = "vidaEnemiga50.png"
	}
		method vida87(){
		
			image = "vidaEnemiga87.png"
	}
	method vida100(){
		
			image = "vidaEnemiga100.png"
	}
}


/* 
 * Futura actualizacion en el cual al matar al enemigo aparezca un cartel.
object cartel{
	var property position = game.at(0,0)
	var property image = "enemigoMuerto.png"
}
*
*/

object victoria{
	var property image = "VICTORIA.png"
	var position = game.at(2,8)
}

object fondoCambio{
	var property image = "fondonegro.png"
	var property position = game.at(0,0)
}

object logoStreet{
	var property image = "streetfighter.jpg"
	var property position = game.at(2,5)
}
