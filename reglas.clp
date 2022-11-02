;;##################################
;; Reglas de la practica 1
;; Autores:
;; Mario Maroto Jimenez - 100429025
;; Enrique Mateos Melero - 100429073
;;##################################

(deffacts
    (gamestate (state INIT-GAME))
    (turn (owner ROBOT))
)

(defrule init-game
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (exists 
        (object (is-a gamestate) (namee ?n) (desc ?d))
        (object (is-a player) (typee NINO))
        (object (is-a player) (typee ROBOT))
    )
    (test 
        (eq ?s INIT-GAME)
        (eq ?pa NO)
    )
    =>
    (modify ?gs (state SELECT-CELL) (personality_action YES))
    (printout t ?n crlf)
    (printout t ?d crlf)
)

(defrule select-cell-hidden
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (turno (owner ?p))
    (player (namee ?n) (typee ?p) (board ?b))
    ?c <- (cell (content ?c) (typee ?t) (board ?b) (visible ?v))
    (test 
        (eq ?s SELECT-CELL)
        (eq ?pa NO)
        (eq ?v NO)
    )
    =>
    (modify ?gs (state PROCESS-CELL) (personality_action YES))
    (modify-instance ?c (visible YES))
    (printout t ?p " selected a cell from board" ?b crlf)
)

(defrule select-cell-visible
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (turno (owner ?p))
    (player (namee ?n) (typee ?p) (board ?b))
    ?c <- (cell (content ?c) (typee ?t) (board ?b) (visible ?v))
    (test 
        (eq ?s SELECT-CELL)
        (eq ?pa NO)
        (eq ?v YES)
        ;;(neq ?p ROBOT)
    )
    =>
    (modify ?gs (personality_action YES))
    (printout t ?p " selected a hidden cell from board" ?b crlf)
)

(defrule personality-action
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (test 
        (eq ?pa YES)
    )
    =>
    (modify ?gs (personality_action NO))
    (printout t "Personality action at state " ?s crlf)
)

(defrule <RULE>
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (test 
        (eq ?s <STATE>)
        (neq ?pa YES)
    )
    =>
    (modify ?gs (state <NEXT STATE>) (personality_action YES))
)