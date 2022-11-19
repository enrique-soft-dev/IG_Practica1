(definstances innit-game
    (of game (namee "Hundir La Flota") (desc "Hundir la flota es un juego para dos en el que cada jugador recibe un tablero con barcos repartidos aleatoriamente. 
Se puede interactuar con el tablero del oponente para:
1. Ganar si se descubre la posicion de todos los barcos
2. Perder el turno si se selecciona una casilla que no contenga un barco"))

    (of player (namee "Kike") (typee NINO))
    (of player (namee "NAO") (typee ROBOT) (board BOARD-2) (personality_typee INSEGURO))


    (of cell (content "Barco") (typee CONTINUE))
    (of cell (content "Barco") (typee CONTINUE))
    (of cell (content "Agua") (typee CHANGE))
    (of cell (content "Agua") (typee CHANGE))
    (of cell (content "Agua") (typee CHANGE))
    (of cell (content "Barco") (typee CONTINUE))
    (of cell (content "Barco") (typee CONTINUE))
    (of cell (content "Barco") (typee CONTINUE))
    (of cell (content "Barco") (typee CONTINUE))
    (of cell (content "Agua") (typee CHANGE))
    (of cell (content "Agua") (typee CHANGE))
    (of cell (content "Agua") (typee CHANGE))
    (of cell (content "Barco") (typee CONTINUE))
    (of cell (content "Barco") (typee CONTINUE))
    
    (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
    (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
    (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
    (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
    (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
    (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
    (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
    (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
    (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
    (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
    (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
    (of cell (content "Agua") (typee CHANGE) (board BOARD-2))
    (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
    (of cell (content "Barco") (typee CONTINUE) (board BOARD-2))
)

(deffacts innit-counters
    (counter (countt 8))
    (counter (typee BOARD-2) (countt 8))
)