-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        fecha:CHARARRAY,
        cantidad:INT);
DUMP datos;

orden = ORDER datos BY cantidad;
DUMP orden;
orden2 = FOREACH  orden GENERATE cantidad ; 
DUMP orden2;

orden3 = LIMIT orden2 5;
DUMP orden3;

STORE orden3 INTO 'output' using PigStorage('\t');
