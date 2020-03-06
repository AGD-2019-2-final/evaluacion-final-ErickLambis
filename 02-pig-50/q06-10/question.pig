-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        bolsa:bag{(a:CHARARRAY)},
        mapa:map[]);
-- DUMP data;

tempo= FOREACH data GENERATE FLATTEN(mapa) as clave;
-- dump tempo;


resumen= group tempo by clave;
-- dump resumen;

grupo = FOREACH resumen GENERATE group, COUNT(tempo);
-- dump grupo;

store grupo into 'output' using PigStorage(',');
