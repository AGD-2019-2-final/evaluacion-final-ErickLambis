-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        birthday, 
--        DATE_FORMAT(birthday, "yyyy"),
--        DATE_FORMAT(birthday, "yy"),
--    FROM 
--        persons
--    LIMIT
--        5;
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -put -f data.csv;
data = LOAD 'data.csv' USING PigStorage(',')
    AS (
        id: INT,
        firstname: CHARARRAY,
        lastname: CHARARRAY,
        birthday: CHARARRAY,
        color: CHARARRAY,
        quantity: INT
    );
t28 = FOREACH data GENERATE ToDate(birthday, 'yyyy-MM-dd') AS birthday_date;
final = FOREACH t28 GENERATE ToString(birthday_date, 'yyyy'), ToString(birthday_date, 'yy');
STORE final INTO 'output' USING PigStorage(',');
fs -get -f output/ .;
