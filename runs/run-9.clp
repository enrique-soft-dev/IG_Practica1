(load ontologia.clp)
(load reglas.clp)
(load personalities.clp)
(load ./pruebas/prueba-9.clp)
(seed 4) 
(set-strategy random)
(watch focus) 
(reset)
(dribble-on ./salidas/salida-prueba-9.txt)
(run)
(dribble-off)
(exit)
