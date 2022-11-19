# Práctica 1 de Ingeniería de Conocimiento
## Como usar
Hay tres medios para ejecutar pruebas haciendo doble click en los archivos:
- `start-buscaminas.bat` es una partida de Buscaminas con una semilla variable
- `start-hlf.bat` es una partida de Hundir la flota con una semilla variable
- `start-all.bat` ejecuta todas las [pruebas](#pruebas) programadas con semillas estáticas en una sola sesión de terminal
## Pruebas
Se han creado un total de 10 pruebas, 5 para cada juego.
### Buscaminas
|Prueba|Personalidad niño|Motivo fin              |Ganador|Semilla|
|------|-----------------|------------------------|-------|-------|
|1     |Triste           |Niño seleciona mina     |NAO    |14     |
|2     |Distraido        |NAO encuentra banderas  |NAO    |27     |
|3     |Burlon           |NAO seleciona mina      |Niño   |3      |
|4     |Inseguro         |NAO selecciona mina     |Niño   |4      |
|5     |Inquieto         |Acción de personalidad  |NAO    |5      |

### Hundir la flota
|Prueba|Personalidad niño|Motivo fin              |Ganador|Semilla|
|------|-----------------|------------------------|-------|-------|
|6     |Triste           |Niño encuentra barcos   |Niño   |1      |
|7     |Distraido        |NAO encuentra barcos    |NAO    |27     |
|8     |Burlon           |Acción de personalidad  |NAO    |3      |
|9     |Inseguro         |Niño encuentra barcos   |Niño   |4      |
|10    |Inquieto         |Acción de personalidad  |NAO    |10     |