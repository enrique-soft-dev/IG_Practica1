;##################################
; Personalidades de la practica 1
; Autores:
; Mario Maroto Jimenez - 100429025
; Enrique Mateos Melero - 100429073
;##################################

; Los contenidos de este archivo deberían estar en "reglas.clp", pero debido a la
; longitud de la declaración de acciones de personalidad, se ha movido a su propio archivo

(definstances innit-personalities
    ; TRISTE actions
    (of personality
        (typee TRISTE)
        (message - nino_name se pone triste y le cae una lagrima de la mejilla%n- robot_name consuela)
    )
    (of personality
        (typee TRISTE) (descriptor MAKE-EASIER)
        (message "Empieza a llorar, NAO consuela, reduce complejidad, sigue el juego")
        (reduce-by 1)
    )
    ; (of personality
    ;     (typee TRISTE) (descriptor END-GAME)
    ;     (message "Empieza a llorar, NAO no puede consolar, se acaba el juego")
    ;     (reduce-counter PERSONALITY) (reduce-by 99)
    ; )

    ; DISTRAIDO actions
    (of personality
        (typee DISTRAIDO)
        (message "Empieza a mirar al techo, NAO llama la atencion, sigue el juego")
    )
    (of personality
        (typee DISTRAIDO) (descriptor MAKE-EASIER)
        (message "Se levanta de la mesa, NAO trae de vuelta, reduce la complejidad")
        (reduce-by 1)
    )
    ; (of personality
    ;     (typee DISTRAIDO) (descriptor END-GAME)
    ;     (message "Se levanta de la mesa, NAO no trae de vuelta, se acaba el juego")
    ;     (reduce-counter PERSONALITY) (reduce-by 99)
    ; )

    ; BURLON actions
    (of personality
        (typee BURLON)
        (message "Suelta una carcajada, NAO le regaña, sigue el juego")
    )
    (of personality
        (typee BURLON) (descriptor MAKE-EASIER)
        (message "Empieza a vacilar al NAO, NAO regaña, reduce complejidad, sigue el juego")
        (reduce-by 1)
    )
    ; (of personality
    ;     (typee BURLON) (descriptor END-GAME)
    ;     (message "Empuja a NAO, NAO se rompe, se acaba el juego")
    ;     (reduce-counter PERSONALITY) (reduce-by 99)
    ; )

    ; INSEGURO actions
    (of personality
        (typee INSEGURO)
        (message "No se decide con que casilla elegir, NAO consigue que elija, sigue el juego")
    )
    (of personality
        (typee INSEGURO) (descriptor MAKE-EASIER)
        (message "No quiere elegir casilla, NAO consigue que elija, reduce complejidad, sigue juego")
        (reduce-by 1)
    )
    ; (of personality
    ;     (typee INSEGURO) (descriptor END-GAME)
    ;     (message "Se niega a elegir casilla, NAO no consigue que elija, se acaba el juego")
    ;     (reduce-counter PERSONALITY) (reduce-by 99)
    ; )

    ; INQUIETO actions
    (of personality
        (typee INQUIETO)
        (message "Empieza a toquetear las casillas, NAO le para, sigue juego")
    )
    (of personality
        (typee INQUIETO) (descriptor MAKE-EASIER)
        (message "Remueve las casillas, NAO quita piezas cambiadas, reduce complejidad, sigue juego")
        (reduce-by 1)
    )
    ; (of personality
    ;     (typee INQUIETO) (descriptor END-GAME)
    ;     (message "Cambia las casillas, NAO no las puede recolocar, se acaba el juego")
    ;     (reduce-counter PERSONALITY) (reduce-by 99)
    ; )
)