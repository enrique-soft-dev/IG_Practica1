(definstances innit-game
    (of game (namee "Hundir La Flota") (desc "Pues tienes que hundir la flota no se que mas quieres que te diga"))

    (of player (namee "NAO") (typee ROBOT))
    (of player (namee "Pedroooooo") (typee NINO) (board 2))

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
    
    (of cell (content "Agua") (typee CHANGE) (board 2))
    (of cell (content "Barco") (typee CONTINUE) (board 2))
    (of cell (content "Barco") (typee CONTINUE) (board 2))
    (of cell (content "Agua") (typee CHANGE) (board 2))
    (of cell (content "Agua") (typee CHANGE) (board 2))
    (of cell (content "Agua") (typee CHANGE) (board 2))
    (of cell (content "Barco") (typee CONTINUE) (board 2))
    (of cell (content "Barco") (typee CONTINUE) (board 2))
    (of cell (content "Barco") (typee CONTINUE) (board 2))
    (of cell (content "Barco") (typee CONTINUE) (board 2))
    (of cell (content "Agua") (typee CHANGE) (board 2))
    (of cell (content "Agua") (typee CHANGE) (board 2))
    (of cell (content "Barco") (typee CONTINUE) (board 2))
    (of cell (content "Barco") (typee CONTINUE) (board 2))
)

(deffacts innit-counters
    (cell_counter (continue_count 8))
    (cell_counter (board 2) (continue_count 8))
)
