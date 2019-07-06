import wollok.game.*
import Personajes.*


object juego{
	method iniciar(){
		//VISUALES
		game.title("Intento de Juego")
		game.addVisual(fondoCambio)
		game.addVisual(logoStreet)
		game.boardGround("fondoprima.png")
		game.width(10)
		game.height(10)
		keyboard.z().onPressDo{
			game.removeVisual(fondoCambio)
			game.removeVisual(logoStreet)
		game.addVisual(heroe)
		game.addVisual(enemigo)
		vidas.position().drawElement(vidas)
		vidaHeroe.position().drawElement(vidaHeroe)
		
		
		//TECLADO
		keyboard.num1().onPressDo{
			if(enemigo.muerto()){
				game.removeVisual(enemigo)
				game.say(heroe,"Ganaste Ya no hay nada mas que hacer
			presiona K para SALIR")
			}
			else if(heroe.muerto()){
				game.say(enemigo,"Perdiste K para salir")
			}
			else{
				heroe.atacar()
			}
		}
		keyboard.num2().onPressDo{heroe.cura()}
		keyboard.num3().onPressDo{heroe.ataqueEspecial()}
		keyboard.num4().onPressDo{heroe.magia()}
		keyboard.k().onPressDo{
			if(enemigo.muerto() or heroe.muerto()){
				game.stop()
			}
		}
		}
		
		
	}
	
	
	
	
	
	
	
	
	
}
