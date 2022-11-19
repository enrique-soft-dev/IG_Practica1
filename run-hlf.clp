;Cargar el archivo con clips -f run.bat
;Cambiar los nombres por los de vuestros archivos
;Podeis incluir todos los comandos clips que querais ejecutar
; 'focus' deberia mostrar solo los prints, que son volcados a salida.txt con 'dribble-on'
;seed inicializa el random para que no saque siempre las mismas secuencias

(load ontologia.clp)
(load reglas.clp)
(load personalities.clp)
(load prueba-buscaminas.clp)
(seed (integer (time))) 
(set-strategy random)
(watch focus) 
(reset)
(dribble-on salida-prueba-hlf.txt)
(run)
(dribble-off)
