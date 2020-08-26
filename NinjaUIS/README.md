# Ninja UIS
## Descripción
El personaje Bomberman en esta version será un "Ninja", que deberá atravesar un laberinto al tiempo que evitara tener contacto con las particulas de un virus que se multiplico en su planeta. El personaje intentara abrirse camino que lo conducen a otras partes del laberinto, destruyendo todo a su paso, con bombas que tendra en su inventario. Cada partida tendra un limite de 1500 puntos, que seran la llave para avanzar al siguiente nivel. Ninja-UIS, tendra acceso a infinitas bombas, un numero de vidas limitadas (3 Vidas) y mucha adrenalina al pasar por cada uno de los tres niveles para terminar con exito su aventura.

## Caracteristicas
- Ninja-UIS tiene un traje negro, la cabeza está cubierta por una banda del mismo color, que dejara ver solo su rostro, tratando de ocultar su identidad; tendra en su espalda un sable afilado, y en su corazon el logo de la UIS, su mas preciado tesoro.

- Ninja-UIS tendra la facilidad de moverse en cuatro direcciones (Arriba, abajo, derecha e izquierda), con la limitacion de que no podrá atravesar los obstaculos del mapa.

- El juego base contará con 3 niveles, que tendra que superar el jugador para ser el ganador, enfrentandose a 4 enemigos en cada nivel, que se moveran de forma independiente, tratando de eliminar a Ninja-UIS.

- El jugador tendra que obtener 1500 puntos, para pasar al siguiente nivel, los cuales se obtendran, cada vez que el jugador active una bomba e impacte con algun virus; Si el jugador llega a golpear dicho virus con la explosion de las bombas, se le ototrgará 250 puntos, que se irán acumulando en el transcurso de la partida. 

- El juego tendra una interfaz amigable para el usuario, donde podra observar el titulo del juego en la parte superior y con la facilidad de escoger 3 botones ("Jugar", "Creditos" y "Salir"); la clasificación por edad en la parte inferior izquierda y los creadores del juego en la parte inferior derecha.

- Por último, el juego esta armonizado con una gama de sonidos, para cada situación según como corresponda. Estos sonidos se implementaron en las siguientes circunstancias del juego: Al momento de iniciar el programa, cuando se inicia un nivel por medio del boton "Jugar", una vez la bomba explota, tambien si el jugador resulta herido por la bomba o por un enemigo, cuando el jugador va perdiendo sus vidas, y para concluir cuando el jugador pierde la partida, ademas el sonido que indicara que es el ganador del juego.


## Funcionalidades
### -Menu:
La interfaz del menu contara con tres opciones:
- JUGAR: Permitira al usuario inciar la partida en el momento que desee. 
- CREDITOS: Por medio de la pantalla de visualizacion, mostrará los creditos a traves de transiciones que iran bajando a traves del tiempo.
- SALIR: Con esta funcion se podra salir inmediatamente del juego.

### -Bomba:
- El personaje principal contará con bombas ilimitadas en su inventario, pero con la restricción de que solo podrá poner 4 ejemplares al mismo tiempo en el mapa.
- La bomba tiene una animación, la cual en cuestión de segundos, pasará y se irá cortando el hilo hasta explotar en su totalidad; El rango de explosion sera en el primer nivel de una casilla hacia los lados donde se ponga la bomba, cada vez que supere un nivel, el rango aumentará una casilla más, en cada lado donde se plante la bomba.

## Visualizaciones del programa
![Visualizacion](https://1.bp.blogspot.com/-ow5mZhVqkqo/X0XTywX1z-I/AAAAAAAAMvA/0SEP4UO16WQST-aIhJkyJujseI7uBUALACLcBGAsYHQ/s640/visualizacion%2Bpanel%2Bcentral.png)
![Visualizacion1](https://1.bp.blogspot.com/-b3hcOL2Ruh0/X0XTwwK78nI/AAAAAAAAMu4/6C3ybKafpokLDAk6lD2VoNeLfOT0QlWXgCLcBGAsYHQ/s640/visual%2Bdel%2Bprimer%2Bnivel.png)
![Visualizacion2](https://1.bp.blogspot.com/-kFyJxItOamM/X0XTwwJYCGI/AAAAAAAAMu8/qtGJHM6NCj4i5SPRfjCKzBtmxv6a0Ts3QCLcBGAsYHQ/s640/visual%2Bdel%2Bsegundo%2Bnivel.png)

## Recomendaciones
Para el correcto funcionamiento del juego, es necesario instalar las librerias de "Minim" y "Sound" directamente en Processing.

## Presentado por:
  - Juan Camilo Tibaduiza Acevedo. (Grupo B1)
  - Abel Antonio Barajas Hernandez. (Grupo B1)