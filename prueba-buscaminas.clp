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