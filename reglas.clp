;##################################
; Reglas de la practica 1
; Autores:
; Mario Maroto Jimenez- 100429025
; Enrique Mateos Melero- 100429073
;##################################

;##################################
; INIT GAME BLOCK
(deffacts innit-gamestate
    (gamestate (state INIT-GAME))
)

(defrule innit-game
    ?gs <- (gamestate (state INIT-GAME))
    (object (is-a game) (namee ?game_name) (desc ?game_description)) 
    (object (is-a player) (typee NINO) (namee ?nino_name) (personality_typee ?p_type))
    (object (is-a player) (typee ROBOT) (namee ?robot_name))
    =>
    (modify ?gs (state SELECT-CELL) (personality_action YES))

    (printout t crlf "[DEBUG] " ?game_name " initiated, " ?robot_name " and " ?nino_name " will play" crlf)
    (printout t "        " ?nino_name " has pesonality " ?p_type crlf)
    (printout t "- " ?robot_name ": Veamos, hoy vamos a jugar a... " ?game_name "!" crlf)
    (printout t "- " ?nino_name ": Que guay! Y como se juega?" crlf)
    (printout t "- " ?robot_name ": Pues mira, las instrucciones dicen esto:" crlf)
    (format t ?game_description)
    (printout t crlf "- " ?robot_name ": Vamos a jugar! Empiezo yo." crlf crlf)
)
;##################################


;##################################
; SELECT CELL BLOCK
(defrule select-cell-hidden
    ?current_gs <- (gamestate (state SELECT-CELL) (turn ?owner))
    (object (is-a player) (namee ?player_name) (typee ?owner) (board ?board_id))
    ?selected_cell <- (object (is-a cell) (content ?cell_content) (typee ?cell_type) (board ?board_id) (visible NO))
    =>
    (modify ?current_gs (state PROCESS-CELL) (cell_typee ?cell_type) (cell_content ?cell_content))
    (modify-instance ?selected_cell (visible YES))

    (printout t "[DEBUG] Hidden cell with " ?cell_content " selected by " ?owner " from board " ?board_id " (instance " ?selected_cell ")" crlf)
    (printout t "- " ?player_name ": Voy a elegir... Esta casilla de aqui. La " ?selected_cell "!" crlf crlf)
)

(defrule select-cell-visible
    ?current_gs <- (gamestate (state SELECT-CELL) (turn ?owner&~ROBOT))
    (object (is-a player) (namee ?player_name) (typee ?owner) (board ?board_id))
    ?selected_cell <- (object (is-a cell) (content ?cell_content) (typee ?cell_type) (board ?board_id) (visible YES))
    ?p_counter <- (counter (typee PERSONALITY) (countt ?p_count))

    (object (is-a player) (namee ?robot_name) (typee ROBOT))
    =>
    (modify ?p_counter (countt (- ?p_count 1)))

    (printout t "[DEBUG] Visible cell with " ?cell_content " selected by " ?owner " from board " ?board_id " (instance " ?selected_cell ")" crlf)
    (printout t "        Relevant counters:" crlf)
    (printout t "        - PERSONALITY: " ?p_count " -> " (- ?p_count 1) crlf)
    (printout t "- " ?player_name ": Voy a elegir... Esta casilla de aqui. La " ?selected_cell "!" crlf)
    (printout t "- " ?robot_name ": " ?player_name " esa casilla ya la has elegido, prueba con otra anda!" crlf crlf)
)
;##################################


;##################################
; PROCESS CELL BLOCK
(defrule process-cell-continue
    ?current_gs <- (gamestate (state PROCESS-CELL) (cell_typee CONTINUE) (cell_content ?cell_content) (turn ?owner))
    (object (is-a player) (namee ?player_name) (typee ?owner) (board ?board_id))
    ?c_counter <- (counter (typee ?board_id) (countt ?c_count))

    (object (is-a player) (namee ?robot_name) (typee ROBOT))
    =>
    (modify ?current_gs (state SELECT-CELL))
    (modify ?c_counter (countt (- ?c_count 1)))

    (printout t "[DEBUG] " ?owner "'s selected cell was a CONTINUE, no turn change" crlf)
    (printout t "        Relevant counters:" crlf)
    (printout t "        - " ?board_id ": " ?c_count " -> " (- ?c_count 1) crlf)
    (printout t "- " ?robot_name ": "?player_name " ha escogido una casilla " ?cell_content ", asique sigue jugando!" crlf crlf)
)

(defrule process-cell-change
    ?current_gs <- (gamestate (state PROCESS-CELL) (cell_typee CHANGE) (cell_content ?cell_content) (turn ?owner))
    (object (is-a player) (namee ?player_name) (typee ?owner))
    (object (is-a player) (namee ?other_name) (typee ?not_owner&~?owner))

    (object (is-a player) (namee ?robot_name) (typee ROBOT))
    =>
    (modify ?current_gs (state SELECT-CELL) (turn ?not_owner))

    (printout t "[DEBUG] " ?owner "'s cell was a CHANGE, changing turn to " ?not_owner crlf)
    (printout t "- " ?robot_name ": "?player_name " ha escogido una casilla " ?cell_content "!") 
    (printout t "Toca cambiar los turnos, ahora juega " ?other_name "." crlf crlf)
)

(defrule process-cell-stop
    ?current_gs <- (gamestate (state PROCESS-CELL) (cell_typee STOP) (cell_content ?cell_content) (turn ?owner))
    (object (is-a player) (namee ?player_name) (typee ?owner))
    (object (is-a player) (namee ?winner_name) (typee ?not_owner&~?owner))

    (object (is-a player) (namee ?robot_name) (typee ROBOT))
    =>
    (printout t "[DEBUG] " ?owner "'s cell was a STOP, changing turn (to set as winner) to " ?not_owner crlf)
    (printout t "        " ?winner_name " wins" crlf)
    (printout t "- " ?robot_name ": " ?player_name " ha escogido una casilla " ?cell_content "! Eso significa que el juego se acaba y gana " ?winner_name "!" crlf crlf)
    (halt)
)
;##################################


;##################################
; FINISH GAME BLOCK
(defrule check-finish-continues
    (declare (salience 110))
    (gamestate (turn ?owner))
    (object (is-a player) (namee ?winner_name) (typee ?owner) (board ?board_id))
    (counter (typee ?board_id) (countt 0))

    (object (is-a player) (namee ?robot_name) (typee ROBOT))
    (object (is-a cell) (content ?cell_content) (typee CONTINUE))
    =>
    (printout t "[DEBUG] Game finishes, " ?owner " has no CONTINUE left in board " ?board_id crlf)
    (printout t "        " ?winner_name " wins" crlf)
    (printout t "- " ?robot_name ": Okey! " ?winner_name " ha encontrado todas las casillas " ?cell_content " asique el ganador es... " ?winner_name "!" crlf crlf)
    (halt)
)

(defrule check-finish-personality
    (declare (salience 100))
    (gamestate (turn ?owner))
    (object (is-a player) (namee ?winner_name) (typee ?not_owner&~?owner))
    (counter (typee PERSONALITY) (countt ?p_count&:(<= ?p_count 0)))

    (object (is-a player) (namee ?robot_name) (typee ROBOT))
    (object (is-a player) (namee ?nino_name) (typee NINO))
    =>
    (printout t "[DEBUG] Game finishes due to personality actions" crlf)
    (printout t "        " ?winner_name " wins" crlf)
    (printout t "- " ?robot_name ": No te estas portando nada bien " ?nino_name ", vamos a dejar de jugar. Gano yo." crlf crlf)
    (halt)
)
;##################################


;##################################
; PERSONALITY ACTION BLOCK
(defrule personality-action
    (gamestate (personality_action YES) (turn ?owner&~ROBOT))
    (object (is-a player) (typee ?owner) (personality_typee ?p_type))
    (object (is-a personality) (typee ?p_type) (descriptor ?p_descriptor) (message $?p_message) (reduce-counter ?r_counter_type) (reduce-by ?r_by))
    ?p_counter <- (counter (typee PERSONALITY) (countt ?p_count))
    ?r_counter <- (counter (typee ?r_counter_type) (countt ?r_count))

    (object (is-a player) (namee ?nino_name) (typee NINO))
    (object (is-a player) (namee ?robot_name) (typee ROBOT))
    =>
    (modify ?p_counter (countt (- ?p_count 1)))
    (modify ?r_counter (countt (- ?r_count ?r_by)))
    (printout t "[DEBUG] Personality action of type " ?p_type " / " ?p_descriptor " for player " ?owner crlf)
    (printout t "        Relevant counters:" crlf)
    (printout t "        - PERSONALITY: " ?p_count " -> " (- ?p_count 1) crlf)
    (printout t "        - " ?r_counter_type ": " ?r_count " -> " (- ?r_count ?r_by) crlf)
    (format t (implode$ (replace-member$ (replace-member$ $?p_message (string-to-field ?nino_name) nino_name) (string-to-field ?robot_name) robot_name)))
    (printout t crlf crlf)
)
;##################################