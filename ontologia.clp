;##################################
; Ontologia de la practica 1
; Autores:
; Mario Maroto Jimenez - 100429025
; Enrique Mateos Melero - 100429073
;##################################

; Plantilla de Estado de Juego
; Representa el estado actual del juego
(deftemplate gamestate
    (slot state ; Estado en el que se encuentra la interaccion
        (type SYMBOL)
        (allowed-values INIT-GAME SELECT-CELL PROCESS-CELL END-GAME)
    )
    (slot personality_action ; Flag para interrumpir el estado general de juego debido a una personalidad
        (type SYMBOL)
        (allowed-values YES NO)
        (default NO)
    )
    (slot cell_typee ; Permite saber el tipo de casilla escogida
        (type SYMBOL)
        (allowed-values CONTINUE CHANGE STOP)

    )
)

; Plantilla de Turno
; Representa el turno de Juego
(deftemplate turn
    (slot owner
        (type SYMBOL)
        (allowed-values ROBOT NINO)
    )
)

; Plantilla de Contador de Celdas
; Representa un contador de celdas de cada tablero
(deftemplate counter
    (slot typee
        (type SYMBOL)
        (allowed-values BOARD-1 BOARD-2 PERSONALITY)
        (default BOARD-1)
    )
    (slot countt
        (type INTEGER)
    )
)

; Clase de Jugador
; Representa un posible jugador de la partida (nino o robot)
(defclass player (is-a USER)
    (slot namee ; El nombre del jugador por ser mas personal en la comunicacion (el robot es siempre NAO)
        (type STRING)
    )
    (slot typee ; El tipo de jugador
        (type SYMBOL)
        (allowed-values NINO ROBOT)
    )
    (slot personality_typee ; Personalidad del jugador. Algo a no tener en cuenta con robot
        (type SYMBOL)
        (allowed-values TRISTE DISTRAIDO BURLON INSEGURO INQUIETO)
    )
    (slot board ; Tablero que usa cada jugador. Sirve para jeugos con tableros distintos
        (type SYMBOL)
        (allowed-values BOARD-1 BOARD-2)
        (default BOARD-1)
    )
)

; Clase de Casilla
; Representa el concepto de cualquier casilla/celda/ficha de un juego
(defclass cell (is-a USER)
    (slot content ; Contenido de la celda. Puede ser un barco, una mina...
        (type STRING)
    )
    (slot typee ; Tipo de celda si supone que su eleccion genera un cambio en el estado del juego
        (type SYMBOL)
        (allowed-values CONTINUE CHANGE STOP)
    )
    (slot board ; Tablero al que pertenece la celda
        (type SYMBOL)
        (allowed-values BOARD-1 BOARD-2)
        (default BOARD-1)
    )
    (slot visible ; Si la celda es visible. Concepto para usar con personalidad
        (type SYMBOL)
        (allowed-values YES NO)
        (default NO)
    )
)

; Clase de Juego
; Representa el concepto de uno de los juegos
; Contiene informacion de como se juega o del juego en si
(defclass game (is-a USER)
    (slot namee ; Nombre del juego al que se va a jugar
        (type STRING)
    )
    (slot desc ; Descripcion del juego 
        (type STRING)
    )
)

; Clase de personalidad
; Representa las posibles acciones de una personalidad concreta
(defclass personality (is-a USER)
    (slot typee ; Tipo de personalidad
        (type SYMBOL)
        (allowed-values TRISTE DISTRAIDO BURLON INSEGURO INQUIETO)
    )
    (slot descriptor
        (type SYMBOL)
        (allowed-values MESSAGE-ONLY MAKE-EASIER END-GAME)
        (default MESSAGE-ONLY)
    )
    (slot message ; Accion correspondiente a un tipo de personalidad
        (type STRING)
    )
    (slot reduce-counter
        (type SYMBOL)
        (allowed-values BOARD-1 BOARD-2 PERSONALITY)
        (default BOARD-2)
    )
    (slot reduce-by
        (type INTEGER)
        (default 0)
    )
)
