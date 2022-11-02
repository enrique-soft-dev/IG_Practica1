;;##################################
;; Reglas de la practica 1
;; Autores:
;; Mario Maroto Jimenez - 100429025
;; Enrique Mateos Melero - 100429073
;;##################################

;;##################################
;; INIT GAME BLOCK
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
    (modify ?gs (state SELECT-CELL) (personality_action YES) (cell_count))
    (printout t ?n crlf)
    (printout t ?d crlf)
)
;;##################################


;;##################################
;; SELECT CELL BLOCK
(defrule select-cell-hidden
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (turn (owner ?p))
    (player (namee ?n) (typee ?p) (board ?b))
    ?c <- (cell (content ?co) (typee ?t) (board ?b) (visible ?v))
    (test 
        (eq ?s SELECT-CELL)
        (eq ?pa NO)
        (eq ?v NO)
    )
    =>
    (modify ?gs (state PROCESS-CELL) (personality_action YES) (cell_typee ?t))
    (modify-instance ?c (visible YES))
    (printout t ?p " selected a " ?co " cell from board" ?b crlf)
)

(defrule select-cell-visible
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (turn (owner ?o))
    (player (namee ?n) (typee ?o) (board ?b))
    ?c <- (cell (content ?co) (typee ?t) (board ?b) (visible ?v))
    (test 
        (eq ?s SELECT-CELL)
        (eq ?pa NO)
        (eq ?v YES)
        (neq ?p ROBOT)
    )
    =>
    (modify ?gs (personality_action YES))
    (printout t ?o " selected a " ?co " hidden cell from board" ?b crlf)
)
;;##################################


;;##################################
;; PROCESS CELL BLOCK
(defrule process-cell-continue
    ?gs <- (gamestate (state ?s) (personality_action ?pa) (cell_typee ?t))
    (turn (owner ?o))
    (player (namee ?n) (typee ?o) (board ?b))
    ?c <- (cell_counter (board ?b) (continue_count ?cc))
    (test 
        (eq ?s PROCESS-CELL)
        (eq ?pa NO)
        (eq ?t CONTINUE)
    )
    =>
    (modify ?gs (state CHECK-FINISH) (personality_action YES))
    (modify ?c (continue_count (- ?cc 1)))
    (printout t ?o "'s cell was a CONTINUE, " (- ?cc 1) " remaining in board " ?b crlf)
)

(defrule process-cell-change
    ?gs <- (gamestate (state ?s) (personality_action ?pa) (cell_typee ?t))
    ?gt <- (turn (owner ?o))
    (player (namee ?n) (typee ?o) (board ?b))
    (player (typee ?no))
    ?c <- (cell_counter (board ?b) (continue_count ?cc))
    (test 
        (eq ?s PROCESS-CELL)
        (eq ?pa NO)
        (eq ?t CHANGE)
        (neq ?o ?no)
    )
    =>
    (modify ?gs (state CHECK-FINISH) (personality_action YES))
    (modify ?gt (owner ?no))
    (printout t ?o "'s cell was a CHANGE, changing turn to " ?no crlf)
)

(defrule process-cell-stop
    ?gs <- (gamestate (state ?s) (personality_action ?pa) (cell_typee ?t))
    ?gt <- (turn (owner ?o))
    (player (namee ?n) (typee ?o) (board ?b))
    (player (typee ?no))
    ?c <- (cell_counter (board ?b) (continue_count ?cc))
    (test 
        (eq ?s PROCESS-CELL)
        (eq ?pa NO)
        (eq ?t CONTINUE)
        (neq ?o ?no)
    )
    =>
    (modify ?gs (state END-GAME) (personality_action YES))
    (modify ?gt (owner ?no))
    (printout t ?o "'s cell was a STOP, changing turn to " ?no crlf)
)
;;##################################


;;##################################
;; FINISH GAME BLOCK
(defrule check-finish-continue
    ?gs <- (gamestate (state ?s) (personality_action ?pa) (cell_typee ?t))
    (turn (owner ?o))
    (player (namee ?n) (typee ?o) (board ?b))
    (cell_counter (board ?b) (continue_count ?cc))
    (test 
        (eq ?s CHECK-FINISH)
        (eq ?pa NO)
        (eq ?t CHANGE)
        (neq ?cc 0)
    )
    =>
    (modify ?gs (state SELECT-CELL) (personality_action YES))
    (printout t ?o " has " ?cc " CONTINUE remaining in board " ?b crlf)
)


(defrule check-finish-finish
    ?gs <- (gamestate (state ?s) (personality_action ?pa) (cell_typee ?t))
    (turn (owner ?o))
    (player (namee ?n) (typee ?o) (board ?b))
    (cell_counter (board ?b) (continue_count ?cc))
    (test 
        (eq ?s CHECK-FINISH)
        (eq ?pa NO)
        (eq ?t CHANGE)
        (neq ?o ?no)
    )
    =>
    (modify ?gs (state END_GAME) (personality_action YES))
    (printout t ?o "' has no CONTINUE left in board " ?b crlf)
)

(defrule end-game
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (turn (owner ?o))
    (player (namee ?n) (typee ?o) (board ?b))
    (test 
        (eq ?s END-GAME)
        (eq ?pa NO)
    )
    =>
    (modify ?gs (state EXIT) (personality_action YES))
    (printout t ?n " wins!" crlf)
)


(defrule exit-game
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (test 
        (eq ?s EXIT)
        (eq ?pa NO)
    )
    =>
    (halt)
)
;;##################################


;;##################################
;; PERSONALITY ACTION BLOCK
(defrule personality-action
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (test 
        (eq ?pa YES)
    )
    =>
    (modify ?gs (personality_action NO))
    (printout t "Personality action at state " ?s crlf)
)
;;##################################