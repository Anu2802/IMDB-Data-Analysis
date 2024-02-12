--select NB.NCONST, NB.primaryname
--from name_basics NB
--where NB.PRIMARYNAME LIKE 'Catherine Zeta-Jones'
--ORDER BY NB.primaryname

--select NB.NCONST, NB.primaryname
--from name_basics NB
--where NB.PRIMARYNAME LIKE 'Ben Affleck'
--ORDER BY NB.primaryname

--select NB.NCONST, NB.primaryname
--from name_basics NB
--where NB.PRIMARYNAME LIKE 'Emma Watson'
--ORDER BY NB.primaryname

--select NB.NCONST, NB.primaryname
--from name_basics NB
--where NB.PRIMARYNAME LIKE 'Johnny Depp'
--ORDER BY NB.primaryname;

SET ECHO ON
SPOOL C:\Users\Abhishek\OneDrive\Desktop\ouput_project3\filename.txt
COLUMN column_name FORMAT a20
SET LINESIZE 1000
SET UNDERLINE = 
SET timing on
--Analysis 1 a)

-- LIST THE NUMBER OF MOVIES DONE PER YEAR BY Ben Affleck, Catherine Zeta-Jones, Emma Watson AND Johnny Depp.
-- THE NUMBER ROWS OF EACH ACTOR WOULD PROVIDE THE SPAN OF THEIR ACTING CAREER PROVIDED THE ACTOR HAS WORKED IN A MOVIE EACH YEAR
SELECT mytable.primaryname ||','|| mytable.startyear || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, TB.startyear, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'movie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N'
      GROUP BY NB.primaryname,TB.startyear)mytable
ORDER BY mytable.primaryname;


--ACTING LIFESPAN
-- LIST THE NUMBER OF TITLE TYPE PER YEAR  Ben Affleck, Catherine Zeta-Jones, Emma Watson AND Johnny Depp HAVE WORKED IN
SELECT mytable.primaryname ||','|| mytable.startyear || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, TB.startyear, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N'
      GROUP BY NB.primaryname,TB.startyear)mytable
ORDER BY mytable.primaryname;

-----------------------------------------------------------------------------------------------------------------------------------
--ANALYSIS 1 B
--2005
-- PRIOR TO 2006, COMPILE A LIST OF ALL THE MOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID EACH YEAR.

SELECT mytable.primaryname|| ',' || mytable.num_movies 
FROM (SELECT NB.primaryname,COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'movie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2010
--COMPILE A LIST OF ALL THE MOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID EACH YEAR FROM 2006 TO 2010
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'movie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2010' AND TB.startyear > '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2015
--COMPILE A LIST OF ALL THE MOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID EACH YEAR FROM 2011 TO 2015

SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'movie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2015' AND TB.startyear > '2010'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE MOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID EACH YEAR FROM 2016 TO 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'movie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2020' AND TB.startyear > '2015'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE MOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID EACH YEAR AFTER 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'movie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear >'2020' 
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;
-----------------------------------------------------------------------------------------------------------------------------------
--ANALYSIS 1 c




---------------------------------------------------------------------------------------------------------------------------------
--2005
-- PRIOR TO 2006, COMPILE A LIST OF ALL THE VIDEOGAME BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID.

SELECT mytable.primaryname|| ',' || mytable.num_movies 
FROM (SELECT NB.primaryname,COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'videogame' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2010
--COMPILE A LIST OF ALL THE VIDEOGAME BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2006 TO 2010
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'videogame' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2010' AND TB.startyear > '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2015
--COMPILE A LIST OF ALL THE VIDEOGAME BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2011 TO 2015

SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'videogame' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2015' AND TB.startyear > '2010'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE VIDEOGAME BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2016 TO 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'videogame' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2020' AND TB.startyear > '2015'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE VIDEOGAME BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID AFTER 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'videogame' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear >'2020' 
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;
-------------------------------------------------------------------------------------------------------------------------
--2005
-- PRIOR TO 2006, COMPILE A LIST OF ALL THE VIDEO BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID.

SELECT mytable.primaryname|| ',' || mytable.num_movies 
FROM (SELECT NB.primaryname,COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'video' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2010
--COMPILE A LIST OF ALL THE VIDEO BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2006 TO 2010
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'video' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2010' AND TB.startyear > '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2015
--COMPILE A LIST OF ALL THE VIDEO BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2011 TO 2015

SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'video' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2015' AND TB.startyear > '2010'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE VIDEO BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2016 TO 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'video' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2020' AND TB.startyear > '2015'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE VIDEO BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID AFTER 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'video' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear >'2020' 
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;
-----------------------------------------------------------------------------------------------------
--2005
-- PRIOR TO 2006, COMPILE A LIST OF ALL THE SHORT BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID.

SELECT mytable.primaryname|| ',' || mytable.num_movies 
FROM (SELECT NB.primaryname,COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'short' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2010
--COMPILE A LIST OF ALL THE SHORT BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2006 TO 2010
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'short' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2010' AND TB.startyear > '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2015
--COMPILE A LIST OF ALL THE SHORT BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2011 TO 2015

SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'short' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2015' AND TB.startyear > '2010'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE SHORT BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2016 TO 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'short' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2020' AND TB.startyear > '2015'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE SHORT BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID AFTER 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'short' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear >'2020' 
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--------------------------------------------------------------------------------------------------------------------------
--2005
-- PRIOR TO 2006, COMPILE A LIST OF ALL THE TVSHORT BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID.

SELECT mytable.primaryname|| ',' || mytable.num_movies 
FROM (SELECT NB.primaryname,COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvshort' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2010
--COMPILE A LIST OF ALL THE TVSHORT BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2006 TO 2010
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvshort' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2010' AND TB.startyear > '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2015
--COMPILE A LIST OF ALL THE TVSHORT BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2011 TO 2015

SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvshort' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2015' AND TB.startyear > '2010'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE TVSHORT BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2016 TO 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvshort' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2020' AND TB.startyear > '2015'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE TVSHORT BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID AFTER 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvshort' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear >'2020' 
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

----------------------------------------------------------------------------------------------------------------------------
--2005
-- PRIOR TO 2006, COMPILE A LIST OF ALL THE TVEPISODE BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID.

SELECT mytable.primaryname|| ',' || mytable.num_movies 
FROM (SELECT NB.primaryname,COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvepisode' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2010
--COMPILE A LIST OF ALL THE TVEPISODE BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2006 TO 2010
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvepisode' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2010' AND TB.startyear > '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2015
--COMPILE A LIST OF ALL THE TVEPISODE BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2011 TO 2015

SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvepisode' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2015' AND TB.startyear > '2010'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE TVEPISODE BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2016 TO 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvepisode' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2020' AND TB.startyear > '2015'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE TVEPISODE BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID AFTER 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvepisode' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear >'2020' 
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;
----------------------------------------------------------------------------------------------------------------------------------
--2005
-- PRIOR TO 2006, COMPILE A LIST OF ALL THE tvMOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID.

SELECT mytable.primaryname|| ',' || mytable.num_tvMovies 
FROM (SELECT NB.primaryname,COUNT(*) AS num_tvMovies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvMovie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2010
--COMPILE A LIST OF ALL THE tvMOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2006 TO 2010
SELECT mytable.primaryname || ',' || mytable.num_tvMovies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_tvMovies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvMovie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2010' AND TB.startyear > '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2015
--COMPILE A LIST OF ALL THE tvMOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2011 TO 2015

SELECT mytable.primaryname || ',' || mytable.num_tvMovies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_tvMovies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvMovie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2015' AND TB.startyear > '2010'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE tvMOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2016 TO 2020
SELECT mytable.primaryname || ',' || mytable.num_tvMovies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_tvMovies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvMovie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2020' AND TB.startyear > '2015'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE tvMOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID AFTER 2020
SELECT mytable.primaryname || ',' || mytable.num_tvMovies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_tvMovies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvMovie' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear >'2020' 
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;
----------------------------------------------------------------------------------------------------------------------------------
--2005
-- PRIOR TO 2006, COMPILE A LIST OF ALL THE TVMINISERIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID.

SELECT mytable.primaryname|| ',' || mytable.num_movies 
FROM (SELECT NB.primaryname,COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvminiseries' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2010
--COMPILE A LIST OF ALL THE TVMINISERIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2006 TO 2010
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvminiseries' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2010' AND TB.startyear > '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2015
--COMPILE A LIST OF ALL THE TVMINISERIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2011 TO 2015

SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvminiseries' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2015' AND TB.startyear > '2010'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE TVMINISERIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2016 TO 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvminiseries' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2020' AND TB.startyear > '2015'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE TVMINISERIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID AFTER 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvminiseries' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear >'2020' 
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;
----------------------------------------------------------------------------------------------------------------------------------
--2005
-- PRIOR TO 2006, COMPILE A LIST OF ALL THE TVSERIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID.

SELECT mytable.primaryname|| ',' || mytable.num_movies 
FROM (SELECT NB.primaryname,COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvseries' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2010
--COMPILE A LIST OF ALL THE TVSERIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2006 TO 2010
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvseries' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2010' AND TB.startyear > '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2015
--COMPILE A LIST OF ALL THE TVSERIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2011 TO 2015

SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvseries' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2015' AND TB.startyear > '2010'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE TVSERIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID FROM 2016 TO 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvseries' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2020' AND TB.startyear > '2015'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE TVSERIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID AFTER 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TB.titleType) = 'tvseries' AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear >'2020' 
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;
------------------------------------------------------------------------------------------------------------------------------------
--2005
-- PRIOR TO 2006, COMPILE A LIST OF ALL THE MOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID EACH YEAR.

SELECT mytable.primaryname|| ',' || mytable.num_movies 
FROM (SELECT NB.primaryname,COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2010
--COMPILE A LIST OF ALL THE MOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID EACH YEAR FROM 2006 TO 2010
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2010' AND TB.startyear > '2005'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2015
--COMPILE A LIST OF ALL THE MOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID EACH YEAR FROM 2011 TO 2015

SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2015' AND TB.startyear > '2010'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE MOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID EACH YEAR FROM 2016 TO 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear <= '2020' AND TB.startyear > '2015'
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;

--2020
--COMPILE A LIST OF ALL THE MOVIES BEN AFFLECK, CATHERINE ZETA-JONES, EMMA WATSON, AND JOHNNY DEPP DID EACH YEAR AFTER 2020
SELECT mytable.primaryname || ',' || mytable.num_movies 
FROM (SELECT NB.primaryname, COUNT(*) AS num_movies
      FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
      WHERE NB.nconst = TP.nconst AND
            TP.tconst = TB.tconst AND
            NB.nconst in ('nm0000255','nm0001876','nm0914612','nm0000136') AND
            LOWER(TP.category) IN ('actor','actress') AND 
            TB.startyear NOT LIKE '\N' AND
            TB.startyear >'2020' 
      GROUP BY NB.primaryname)mytable
ORDER BY mytable.primaryname;
------------------------------------------------------------------------------------------------------------------------------

-- Analysis 2
-- Identify an actor or actress (for both) who has performed in the most and least films in given range of years      
(SELECT NB.nconst,NB.primaryname,COUNT(*) as movies
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
    TP.tconst = TB.tconst AND
    LOWER(TB.titleType) = 'movie' AND
    LOWER(TP.category) IN ('actor') AND 
    TB.startyear NOT LIKE '\N' AND
    TB.startyear BETWEEN '1986' AND '1995' 
GROUP BY NB.nconst, NB.primaryname
ORDER BY movies DESC
FETCH FIRST 1 ROWS ONLY)
union
(SELECT NB.nconst,NB.primaryname,COUNT(*) as movies
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
    TP.tconst = TB.tconst AND
    LOWER(TB.titleType) = 'movie' AND
    LOWER(TP.category) IN ('actress') AND 
    TB.startyear NOT LIKE '\N' AND
    TB.startyear BETWEEN '1986' AND '1995'
GROUP BY NB.nconst, NB.primaryname
ORDER BY movies DESC
FETCH FIRST 1 ROWS ONLY)
union
(SELECT NB.nconst,NB.primaryname,COUNT(*) as movies 
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
    TP.tconst = TB.tconst AND
    LOWER(TB.titleType) = 'movie' AND
    LOWER(TP.category) IN ('actor') AND 
    TB.startyear NOT LIKE '\N' AND
    TB.startyear BETWEEN '1986' AND '1995'
GROUP BY NB.nconst, NB.primaryname
HAVING COUNT(*)=1
FETCH FIRST 1 ROWS ONLY)
union
(SELECT NB.nconst,NB.primaryname,COUNT(*) as movies 
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
    TP.tconst = TB.tconst AND
    LOWER(TB.titleType) = 'movie' AND
    LOWER(TP.category) IN ('actress') AND 
    TB.startyear NOT LIKE '\N' AND
    TB.startyear BETWEEN '1986' AND '1995'
GROUP BY NB.nconst, NB.primaryname, TB.startyear
HAVING COUNT(*)=1
FETCH FIRST 1 ROWS ONLY);


SPOOL OFF