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
        (message 
            nino_name se pone triste y le cae una lagrima de la mejilla
            %n- robot_name : Tranquilo, no pasa nada. Venga, vamos a seguir jugando
        )
    )
    (of personality
        (typee TRISTE) (descriptor MAKE-EASIER)
        (message 
            nino_name empieza a llorar fuerte
            %n- robot_name : nino_name no llores que no pasa nada!
            %n- nino_name : Me quiero in a mi casa, no quiero jugar!
            %n- robot_name : Tranquilo/a peque, vamos a hacerlo un poquito mas facil y seguimos jugando que te lo vas a pasar muy bien
            %nnino_name se tranquiliza un poco y sigue jugando
        )
        (reduce-by 1)
    )
    ; (of personality
    ;     (typee TRISTE) (descriptor END-GAME)
    ;     (message 
    ;         nino_name empieza a llorar fuerte
    ;         %n- robot_name : nino_name no llores que no pasa nada! 
    ;         %n- nino_name : Me quiero in a mi casa, no quiero jugar!
    ;         %n- robot_name : Tranquilo/a peque, vamos a seguir jugando que te lo vas a pasar muy bien
    ;         %n- nino_name : No, me quiero ir a mi casa ya!
    ;         %n- robot_name : Bueno, pues se acaba el juego
    ;     )
    ;     (reduce-counter PERSONALITY) (reduce-by 99)
    ; )

    ; DISTRAIDO actions
    (of personality
        (typee DISTRAIDO)
        (message 
            nino_name empieza a mirar al techo
            %n- robot_name : Tierra llamando a nino_name
            %n- nino_name se rie y sigue jugando
        )
    )
    (of personality
        (typee DISTRAIDO) (descriptor MAKE-EASIER)
        (message 
            nino_name se levanta de la mesa y corretea por la sala
            %n- robot_name : Oye nino_name , portate bien por favor
            %n- nino_name : Perdon...
        )
        (reduce-by 1)
    )
    ; (of personality
    ;     (typee DISTRAIDO) (descriptor END-GAME)
    ;     (message 
    ;         nino_name se levanta de la mesa y corretea por la sala
    ;         %n- robot_name : Oye nino_name , portate bien por favor
    ;         %n- nino_name : No, no quiero jugar mas!
    ;         %n- robot_name : Pues dejamos de jugar
    ;     )
    ;     (reduce-counter PERSONALITY) (reduce-by 99)
    ; )

    ; BURLON actions
    (of personality
        (typee BURLON)
        (message 
            nino_name suelta una carjada ruidosa
            %n- robot_name : Hay gente en la sala de al lado, si haces tanto ruido les molestamos
        )
    )
    (of personality
        (typee BURLON) (descriptor MAKE-EASIER)
        (message 
            nino_name se pone a imitar los movimientos de NAO
            %n- robot_name : Oye, no me hagas burla!
            %n- nino_name : Jejeje
        )
        (reduce-by 1)
    )
    ; (of personality
    ;     (typee BURLON) (descriptor END-GAME)
    ;     (message 
    ;         nino_name empuja a NAO y hace que se caiga
    ;         %n- robot_name : Oye, no me tires al suelo! Se acabo el juego!
    ;     )
    ;     (reduce-counter PERSONALITY) (reduce-by 99)
    ; )

    ; INSEGURO actions
    (of personality
        (typee INSEGURO)
        (message 
            nino_name no se decide con que casilla elegir
            %n- robot_name : Vamos nino_name, hay que elegir!
        )
    )
    (of personality
        (typee INSEGURO) (descriptor MAKE-EASIER)
        (message 
            - nino_name : Voy a perder, no quiero elegir casilla!
            %n- robot_name : Venga, te lo hago un poquito mas facil
            %n- nino_name : ... Bueno vale
        )
        (reduce-by 1)
    )
    ; (of personality
    ;     (typee INSEGURO) (descriptor END-GAME)
    ;     (message 
    ;         - nino_name : Voy a perder, no quiero elegir casilla!
    ;         %n- robot_name : Venga, te lo hago un poquito mas facil
    ;         %n- nino_name : No, que pierdo
    ;         %n- robot_name: Bueno, pues no jugamos mas
    ;     )
    ;     (reduce-counter PERSONALITY) (reduce-by 99)
    ; )

    ; INQUIETO actions
    (of personality
        (typee INQUIETO)
        (message 
            nino_name empieza a toquetear las casillas
            %n- robot_name : Cuidado nino_name que descolocas las cosas
        )
    )
    (of personality
        (typee INQUIETO) (descriptor MAKE-EASIER)
        (message 
            nino_name remueve algunas casillas
            %n- robot_name : Ahora tengo que quitar las que has movido... No hagas eso mas!
        )
        (reduce-by 1)
    )
    ; (of personality
    ;     (typee INQUIETO) (descriptor END-GAME)
    ;     (message 
    ;         nino_name remueve todas casillas
    ;         %n- robot_name : Ya no podemos seguir jugando! Muy mal nino_name ...
    ;     )
    ;     (reduce-counter PERSONALITY) (reduce-by 99)
    ; )
)