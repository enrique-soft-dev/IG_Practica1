; (definstances innit-game
;     (of game (namee "Hundir La Flota") (desc "Hundir la flota es un juego para dos en el que cada jugador recibe un tablero con barcos repartidos aleatoriamente. 
; Se puede interactuar con el tablero del oponente para:
; 1. Ganar si se descubre la posicion de todos los barcos
; 2. Perder el turno si se selecciona una casilla que no contenga un barco"))

;     (of player (namee "Pedroooooo") (typee NINO))
;     (of player (namee "NAO") (typee ROBOT) (board BOARD-2) (personality_typee DISTRAIDO))


;     (of cell (content "Barco") (typee CONTINUE))
;     (of cell (content "Barco") (typee CONTINUE))
;     (of cell (content "Agua") (typee CHANGE))
;     (of cell (content "Agua") (typee CHANGE))
;     (of cell (content "Agua") (typee CHANGE))
;     (of cell (content "Barco") (typee CONTINUE))
;     (of cell (content "Barco") (typee CONTINUE))
;     (of cell (content "Barco") (typee CONTINUE))
;     (of cell (content "Barco") (typee CONTINUE))
;     (of cell (content "Agua") (typee CHANGE))
;     (of cell (content "Agua") (typee CHANGE))
;     (of cell (content "Agua") (typee CHANGE))
;     (of cell (content "Barco") (typee CONTINUE))
;     (of cell (content "Barco") (typee CONTINUE))
    
;     (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
;     (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
;     (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
;     (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
;     (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
;     (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
;     (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
;     (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
;     (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
;     (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
;     (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
;     (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
;     (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
;     (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
; )

; (deffacts innit-counters
;     (counter (countt 8))
;     (counter (board BOARD-2) (countt 8))
; )

(definstances innit-game
    (of game (namee "Buscaminas") (desc "El Buscaminas es un juego para dos, con un solo tablero, que consiste en:
1. Seleccionar todas las banderas, ya que asi ganas!
2. Evitar seleccionar casillas que contienen minas, porque sino pierdes
3. Es preferible no seleccionar numeros puesto que causan un cambio de turno"))

    (of player (namee "NAO") (typee ROBOT))
    (of player (namee "Juanito") (typee NINO) (personality_typee DISTRAIDO))

    (of cell (content "Bandera") (typee CONTINUE))
    (of cell (content "Bandera") (typee CONTINUE))
    (of cell (content "Mina") (typee STOP))
    (of cell (content "Numero") (typee CHANGE))
    (of cell (content "Numero") (typee CHANGE))
    (of cell (content "Numero") (typee CHANGE))
    (of cell (content "Bandera") (typee CONTINUE))
    (of cell (content "Mina") (typee STOP))
    (of cell (content "Bandera") (typee CONTINUE))
    (of cell (content "Bandera") (typee CONTINUE))
    (of cell (content "Bandera") (typee CONTINUE))
    (of cell (content "Mina") (typee STOP))
    (of cell (content "Numero") (typee CHANGE))
    (of cell (content "Numero") (typee CHANGE))
    (of cell (content "Numero") (typee CHANGE))
    (of cell (content "Bandera") (typee CONTINUE))
    (of cell (content "Bandera") (typee CONTINUE))
)

(deffacts innit-counters
    (counter (countt 8))
    (counter (countt 10) (typee PERSONALITY))
)