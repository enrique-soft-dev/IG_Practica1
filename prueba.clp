; (definstances innit-game
;     (of game (namee "Hundir La Flota") (desc "Pues tienes que hundir la flota no se que mas quieres que te diga"))

;     (of player (namee "NAO") (typee ROBOT))
;     (of player (namee "Pedroooooo") (typee NINO) (board BOARD-2))

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
    (of game (namee "Buscaminas") (desc "Buscame esta"))

    (of player (namee "NAO") (typee ROBOT))
    (of player (namee "Juanitoooo") (typee NINO) (personality_typee TRISTE))

    (of cell (content "Bandera") (typee CONTINUE))
    (of cell (content "Bandera") (typee CONTINUE))
    ;(of cell (content "Mina") (typee STOP))
    (of cell (content "Numero") (typee CHANGE))
    (of cell (content "Numero") (typee CHANGE))
    (of cell (content "Numero") (typee CHANGE))
    (of cell (content "Bandera") (typee CONTINUE))
    ;(of cell (content "Mina") (typee STOP))
    (of cell (content "Bandera") (typee CONTINUE))
    (of cell (content "Bandera") (typee CONTINUE))
    (of cell (content "Bandera") (typee CONTINUE))
    ;(of cell (content "Mina") (typee STOP))
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