-- 1.  ¿Cuál es el nombre y la superficie terrestre de cada continente?
SELECT NAME, AREA
FROM CONTINENT;

-- 2.  ¿Cuál es la superficie y la profundidad del lago Malawi? 
SELECT NAME, AREA, DEPTH
FROM LAKE
WHERE NAME LIKE '%Malawi%';

-- 3.  ¿Cuáles son los nombres y la superficie de todos los lagos en orden decreciente de profundidad? 
SELECT NAME, AREA, DEPTH
FROM LAKE
ORDER BY DEPTH DESC;

-- Alternativa si se quiere deshacer de los null
SELECT NAME, AREA, DEPTH
FROM LAKE  WHERE
DEPTH IS NOT NULL
ORDER BY DEPTH DESC;

-- 4.  ¿Cuál es el nombre de los países donde la agricultura representa al menos el 50% del producto interno bruto? -- use INNER JOIN ... ON 
SELECT NAME, ECONOMY.AGRICULTURE
FROM COUNTRY
  INNER JOIN ECONOMY
    ON COUNTRY.CODE = ECONOMY.COUNTRY
WHERE ECONOMY.AGRICULTURE >= 50;

-- 5.  ¿Cómo se llama el río más largo? -- use una subconsulta 
SELECT NAME
FROM RIVER
WHERE LENGTH IS NOT NULL AND NOT EXISTS (
  SELECT 1 FROM RIVER WHERE LENGTH > RIVER.LENGTH AND LENGTH IS NOT NULL
);

-- Alternativa sin renombre
SELECT NAME FROM RIVER
WHERE LENGTH = (SELECT MAX(LENGTH) FROM RIVER);