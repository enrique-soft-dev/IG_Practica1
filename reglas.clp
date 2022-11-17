;##################################
; Reglas de la practica 1
; Autores:
; Mario Maroto Jimenez - 100429025
; Enrique Mateos Melero - 100429073
;##################################

;##################################
; INIT GAME BLOCK
(deffacts innit-gamestate
    (gamestate (state INIT-GAME))
    (turn (owner ROBOT))
)

(defrule innit-game
    ?gs <- (gamestate (state INIT-GAME) (personality_action NO))
    (object (is-a game) (namee ?n) (desc ?d)) 
    (object (is-a player) (typee NINO))
    (object (is-a player) (typee ROBOT))
    =>
    (modify ?gs (state SELECT-CELL) (personality_action YES))
    (printout t ?n crlf)
    (printout t ?d crlf)
)
;##################################


;##################################
; SELECT CELL BLOCK
(defrule select-cell-hidden
    ?gs <- (gamestate (state SELECT-CELL))
    (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    ?c <- (object (is-a cell) (content ?co) (typee ?t) (board ?b) (visible NO))
    =>
    (modify ?gs (state PROCESS-CELL) (cell_typee ?t))
    (modify-instance ?c (visible YES))
    (printout t "[DEBUG] " ?o " selected a " ?co " hidden cell from board " ?b crlf)
)

(defrule select-cell-visible
    ?gs <- (gamestate (state SELECT-CELL))
    (turn (owner ?o&~ROBOT))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    ?c <- (object (is-a cell) (content ?co) (typee ?t) (board ?b) (visible YES))
    ?pc <- (counter (typee PERSONALITY) (countt ?c))
    =>
    (modify ?pc (countt (- ?c 1)))
    (printout t "[DEBUG] " ?o " selected a " ?co " cell from board " ?b crlf)
)
;##################################


;##################################
; PROCESS CELL BLOCK
(defrule process-cell-continue
    ?gs <- (gamestate (state PROCESS-CELL) (cell_typee CONTINUE))
    (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    ?c <- (counter (typee ?b) (countt ?cc))
    =>
    (modify ?gs (state SELECT-CELL))
    (modify ?c (countt (- ?cc 1)))
    (printout t "[DEBUG] " ?o "'s cell was a CONTINUE, " (- ?cc 1) " remaining in board " ?b crlf)
)

(defrule process-cell-change
    ?gs <- (gamestate (state PROCESS-CELL) (cell_typee CHANGE))
    ?gt <- (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    (object (is-a player) (typee ?no&~?o))
    =>
    (modify ?gs (state SELECT-CELL))
    (modify ?gt (owner ?no))
    (printout t "[DEBUG] " ?o "'s cell was a CHANGE, changing turn to " ?no crlf)
)

(defrule process-cell-stop
    ?gs <- (gamestate (state PROCESS-CELL) (cell_typee STOP))
    ?gt <- (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    (object (is-a player) (typee ?no&~?o))
    ?c <- (counter (typee ?b) (countt ?cc))
    =>
    (modify ?gs (state END-GAME) (personality_action NO))
    (modify ?gt (owner ?no))
    (printout t "[DEBUG] " ?o "'s cell was a STOP, changing turn to " ?no crlf)
)
;##################################


;##################################
; FINISH GAME BLOCK
(defrule check-finish-continues
    (declare (salience 100))
    ?gs <- (gamestate (state ~END-GAME))
    (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    (counter (typee ?b) (countt 0))
    =>
    (modify ?gs (state END-GAME))
    (printout t "[DEBUG]" ?o " has no CONTINUE left in board " ?b crlf)
)

(defrule check-finish-personality
    (declare (salience 100))
    ?gs <- (gamestate (state ~END-GAME))
    ?gt <- (turno (owner ?o))
    (object (is-a player) (typee ?no&~?o))
    (counter (typee PERSONALITY) (countt ?c&:(<= ?c 0)))
    =>
    (modify ?gt (owner ?no))
    (modify ?gs (state END-GAME) (personality_action NO))
    (printout t "[DEBUG] Game finishes due to too many personality actions" crlf)
)

(defrule end-game
    ?gs <- (gamestate (state END-GAME))
    (turn (owner ?o))
    (object (is-a player) (namee ?n) (typee ?o) (board ?b))
    =>
    (printout t "[DEBUG] " ?n " wins!" crlf)
    (halt)
)
;##################################


;##################################
; PERSONALITY ACTION BLOCK
(defrule personality-action
    ?gs <- (gamestate (state ?s) (personality_action YES))
    (turno ?o&NINO)
    (object (is-a player) (typee ?o) (personality_typee ?pt))
    ?pa <- (object (is-a personality) (typee ?pt) (message ?pm) (reduce-counter ?rc) (reduce-by ?rb))
    ?cc <- (counter (typee ?rc) (countt ?c))
    =>
    (modify ?gs (personality_action NO))
    (modify ?cc (countt (- ?c ?rb)))
    ;(printout t "Personality action at state " ?s crlf)
)
;##################################