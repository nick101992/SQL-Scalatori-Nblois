/* Query 1 - Calcolare l'insieme (non il multi-insieme) delle 
coppie (A,B) tali che A
è uno scalatore e B è un continente in cui A ha effettuato una scalata*/

SELECT DISTINCT scalatore, nazione
FROM Scalata

/* Query 2 - Per ogni scalatore nato prima del 1980, calcolare
tutti i continenti in cui ha effettuato una scalata,
ordinando il risultato per codice fiscale e, a parità di
codice fiscale, per il nome del continente.*/

SELECT Scalata.scalatore, Scalata.nazione
FROM Scalatore JOIN Scalata ON Scalatore.cf = Scalata.scalatore
WHERE Scalatore.annonascita < 1980
ORDER BY Scalata.scalatore, Scalata.nazione


/* Query 3 - Calcolare le nazioni (mostrando, per ciascuna, anche il
continente) nelle quali è stata effettuata almeno una scalata
da uno scalatore minorenne.*/

SELECT Scalata.Nazione, Nazione.continente
FROM Scalata JOIN Nazione ON Nazione.nome = Scalata.nazione
             JOIN Scalatore ON Scalatore.cf = Scalata.scalatore
WHERE ((Scalata.anno - Scalatore.annonascita) < 18)


/* Query 4 - Per ogni nazione, calcolare il numero di scalate effettuate da
scalatori nati in quella nazione.*/

SELECT Scalata.nazione, COUNT(Scalata.scalatore) AS Numero_scalate_stessa_nazione
FROM Scalatore JOIN Scalata ON Scalatore.cf = Scalata.scalatore
WHERE Scalata.nazione = Scalatore.nazionenascita
GROUP BY Scalata.nazione

/* Query 5 - Per ogni continente, calcolare il numero di scalate effettuate
da scalatori nati in una nazione di quel continente.*/

SELECT Nazione.continente, COUNT(DISTINCT Scalata.scalatore)
FROM Scalata JOIN Nazione ON Nazione.nome = Scalata.nazione
             JOIN Scalatore ON Scalatore.cf = Scalata.scalatore
             JOIN Nazione AS Nazione2 ON Nazione2.nome = Scalata.nazione
WHERE Nazione.continente = Nazione2.continente
GROUP BY Nazione.continente 

/* Query 6 - Calcolare codice fiscale, nazione di nascita, continente di
nascita di ogni scalatore nato in un continente diverso
dall’America, e, solo se egli ha effettuato almeno una scalata,
affiancare queste informazioni alle nazioni in cui ha effettuato
scalate.*/

SELECT Scalatore.cf, Scalatore.nazionenascita, Nazione.continente, Scalata.nazione
FROM Scalatore LEFT JOIN Scalata ON Scalatore.cf = Scalata.scalatore
               LEFT JOIN Nazione ON Nazione.nome = Scalata.nazione

/* Query 7 - Per ogni nazione e per ogni anno, calcolare il numero di
scalate effettuate in quella nazione e in quell’anno, ma solo se
tale numero è maggiore di 1. Nel risultato le nazioni dello
stesso continente devono essere mostrati in tuple contigue, e
le tuple relative allo stesso continente devono essere ordinate
per anno.*/

/* Query 8 - Per ogni nazione N, calcolare il numero medio di
scalate effettuate all’anno in N da scalatori nati in
nazioni diverse da N.*/

/* Query 9 - Calcolare gli scalatori tali che tutte le scalate che
hanno effettuato nella nazione di nascita le hanno
effettuate quando erano minorenni.*/