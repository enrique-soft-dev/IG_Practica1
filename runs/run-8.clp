(load ontologia.clp)
(load reglas.clp)
(load personalities.clp)
(load ./pruebas/prueba-8.clp)
(seed 3) 
(set-strategy random)
(watch focus) 
(reset)
(dribble-on ./salidas/salida-prueba-8.txt)
(run)
(dribble-off)
(exit)
