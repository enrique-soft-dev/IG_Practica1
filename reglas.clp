;;##################################
;; Reglas de la practica 1
;; Autores:
;; Mario Maroto Jimenez - 100429025
;; Enrique Mateos Melero - 100429073
;;##################################

;;##################################
;; INIT GAME BLOCK
(deffacts innit-gamestate
    (gamestate (state INIT-GAME))
    (turn (owner ROBOT))
)

(defrule innit-game
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (object (is-a game) (namee ?n) (desc ?d)) 
    (object (is-a player) (typee NINO))
    (object (is-a player) (typee ROBOT))
    
    (test (eq ?s INIT-GAME))
    (test (eq ?pa NO))
    =>
    (modify ?gs (state SELECT-CELL) (personality_action YES))
    (printout t ?n crlf)
    (printout t ?d crlf)
)
;;##################################


;;##################################
;; SELECT CELL BLOCK
(defrule select-cell-hidden
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    ?c <- (object (is-a cell) (content ?co) (typee ?t) (board ?b) (visible ?v))

    (test (eq ?s SELECT-CELL))
    (test (eq ?pa NO))
    (test (eq ?v NO))
    =>
    (modify ?gs (state PROCESS-CELL) (personality_action YES) (cell_typee ?t))
    (modify-instance ?c (visible YES))
    (printout t ?o " selected a " ?co " hidden cell from board " ?b crlf)
)

(defrule select-cell-visible
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    ?c <- (object (is-a cell) (content ?co) (typee ?t) (board ?b) (visible ?v))

    (test (eq ?s SELECT-CELL))
    (test (eq ?pa NO))
    (test (eq ?v YES))
    (test (neq ?o ROBOT))
    =>
    (modify ?gs (personality_action YES))
    (printout t ?o " selected a " ?co " cell from board " ?b crlf)
)
;;##################################


;;##################################
;; PROCESS CELL BLOCK
(defrule process-cell-continue
    ?gs <- (gamestate (state ?s) (personality_action ?pa) (cell_typee ?t))
    (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    ?c <- (cell_counter (board ?b) (continue_count ?cc))

    (test (eq ?s PROCESS-CELL))
    (test (eq ?pa NO))
    (test (eq ?t CONTINUE))
    =>
    (modify ?gs (state CHECK-FINISH) (personality_action YES))
    (modify ?c (continue_count (- ?cc 1)))
    (printout t ?o "'s cell was a CONTINUE, " (- ?cc 1) " remaining in board " ?b crlf)
)

(defrule process-cell-change
    ?gs <- (gamestate (state ?s) (personality_action ?pa) (cell_typee ?t))
    ?gt <- (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    (object (is-a player) (typee ?no))

    (test (eq ?s PROCESS-CELL))
    (test (eq ?pa NO))
    (test (eq ?t CHANGE))
    (test (neq ?o ?no))
    =>
    (modify ?gs (state CHECK-FINISH) (personality_action YES))
    (modify ?gt (owner ?no))
    (printout t ?o "'s cell was a CHANGE, changing turn to " ?no crlf)
)

(defrule process-cell-stop
    ?gs <- (gamestate (state ?s) (personality_action ?pa) (cell_typee ?t))
    ?gt <- (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    (object (is-a player) (typee ?no))
    ?c <- (cell_counter (board ?b) (continue_count ?cc))

    (test (eq ?s PROCESS-CELL))
    (test (eq ?pa NO))
    (test (eq ?t STOP))
    (test (neq ?o ?no))
    =>
    (modify ?gs (state END-GAME) (personality_action YES))
    (modify ?gt (owner ?no))
    (printout t ?o "'s cell was a STOP, changing turn to " ?no crlf)
)
;;##################################


;;##################################
;; FINISH GAME BLOCK
(defrule check-finish-continue
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    (cell_counter (board ?b) (continue_count ?cc))

    (test (eq ?s CHECK-FINISH))
    (test (eq ?pa NO))
    (test (neq ?cc 0))
    =>
    (modify ?gs (state SELECT-CELL) (personality_action YES))
    (printout t ?o " has " ?cc " CONTINUE remaining in board " ?b crlf)
)


(defrule check-finish-finish
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    (cell_counter (board ?b) (continue_count ?cc))

    (test (eq ?s CHECK-FINISH))
    (test (eq ?pa NO))
    (test (eq ?cc 0))
    =>
    (modify ?gs (state END-GAME) (personality_action YES))
    (printout t ?o " has no CONTINUE left in board " ?b crlf)
)

(defrule end-game
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))

    (test (eq ?s END-GAME))
    (test (eq ?pa NO))
    =>
    (modify ?gs (state EXIT) (personality_action YES))
    (printout t ?n " wins!" crlf)
)


(defrule exit-game
    ?gs <- (gamestate (state ?s) (personality_action ?pa))

    (test (eq ?s EXIT))
    (test (eq ?pa NO))
    =>
    (halt)
)
;;##################################


;;##################################
;; PERSONALITY ACTION BLOCK
(defrule personality-action
    ?gs <- (gamestate (state ?s) (personality_action ?pa))
    (test (eq ?pa YES))
    =>
    (modify ?gs (personality_action NO))
    ;;(printout t "Personality action at state " ?s crlf)
)
;;##################################