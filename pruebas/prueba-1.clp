(definstances innit-game
    (of game (namee "Buscaminas") (desc "Buscame esta"))

    (of player (namee "NAO") (typee ROBOT))
    (of player (namee "Juanitoooo") (typee NINO))

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
    (cell_counter (continue_count 8))
)