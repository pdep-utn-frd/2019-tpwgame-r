import wollok.game.*
import Personajes.*


object juego{
	method iniciar(){
		//VISUALES
		game.title("Final Parcial Fantasy")
		game.width(10)
		game.height(10)
		game.addVisual(heroe)
		game.addVisual(enemigo)
		game.boardGround("fondoprima.png")
		vidas.position().drawElement(vidas)
		vidaHeroe.position().drawElement(vidaHeroe)
		
		//TECLADO
		keyboard.num1().onPressDo{
			if(enemigo.muerto()){
				game.removeVisual(enemigo)
				game.say(heroe,"Ganaste Ya no hay nada mas que hacer K para SALIR")
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
