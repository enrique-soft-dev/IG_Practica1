#Cargar el archivo con clips -f run.bat
#Cambiar los nombres por los de vuestros archivos
#Podéis incluir todos los comandos clips que queráis ejecutar
# 'focus' debería mostrar solo los prints, que son volcados a salida.txt con 'dribble-on'
#seed inicializa el random para que no saque siempre las mismas secuencias

(load ontologia.clp)
(load reglas.clp)
(load prueba.clp)
(seed (integer (time))) 
(set-strategy random)
(watch focus) 
(reset)
(dribble-on salida.txt)
(run)
(dribble-off)