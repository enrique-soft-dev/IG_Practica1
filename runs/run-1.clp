(load ontologia.clp)
(load reglas.clp)
(load personalities.clp)
(load ./pruebas/prueba-1.clp)
(seed 14) 
(set-strategy random)
(watch focus) 
(reset)
(dribble-on ./salidas/salida-prueba-1.txt)
(run)
(dribble-off)
(exit)