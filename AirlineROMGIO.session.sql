-- Identifie les villes d'arrivée desservies par Ader (pilote numéro 1)
WITH ArrivalsByAder AS (
    SELECT DISTINCT VILLEARR
    FROM VOL
    WHERE NUMPILOTE = 1  -- Ader est le pilote numéro 1
)

-- Sélectionne les pilotes qui habitent dans la localisation d'un Airbus
-- et qui sont en service pour un vol au départ des villes où Ader arrive
SELECT DISTINCT P.NOMPILOTE
FROM PILOTE P
JOIN AVION A ON P.ADRESSE = A.LOCALISATION  -- Le pilote habite à la localisation d'un Airbus
JOIN VOL V ON P.NUMPILOTE = V.NUMPILOTE     -- Rejoindre les vols pilotés par le pilote
JOIN ArrivalsByAder AA ON V.VILLEDEP = AA.VILLEARR  -- Le départ du pilote doit être une arrivée d'Ader
WHERE A.NOMAVION LIKE 'Airbus%';  -- L'avion est un Airbus


