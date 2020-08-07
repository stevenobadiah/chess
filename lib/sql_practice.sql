
--3.1
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1960

--3.2
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

--3.3
SELECT yr, subject
FROM nobel
WHERE winner = "Albert Einstein"

--3.4
SELECT winner
FROM nobel
WHERE subject = "Peace" AND yr >= 2000

--3.5
SELECT *
FROM nobel
WHERE subject = "Literature"
And yr BETWEEN 1980 AND 1989

--3.6
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

--3.7
SELECT winner
FROM nobel
WHERE LEFT(winner, 4) = "John"

--3.8
SELECT yr, subject, winner
FROM nobel
WHERE (yr = 1980 AND subject = "Physics")
   OR (yr = 1984 AND subject = "Chemistry")

--3.9
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
AND subject NOT IN ("Chemistry", "Medicine")

--3.10
SELECT yr, subject, winner
FROM nobel
WHERE (subject = "Medicine" AND yr < 1910) 
OR (subject = "Literature" AND yr >= 2004)

--3.11
SELECT *
FROM nobel
WHERE winner = "PETER GRÜNBERG"

--3.12
SELECT *
FROM nobel
WHERE winner = "EUGENE O'NEILL"

--3.13
SELECT winner, yr, subject FROM nobel
WHERE LEFT(winner, 3) = "Sir"
ORDER BY yr DESC, winner

--3.14
SELECT winner, subject
  FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Chemistry', 'Physics'), subject, winner

--4.1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--4.2
SELECT name 
FROM world 
WHERE continent = "Europe" 
AND (gdp/population) > 
  (SELECT (gdp/population) 
  FROM world 
  WHERE name = "United Kingdom")

--4.3
SELECT name, continent 
FROM world 
WHERE continent IN 
(SELECT continent FROM world WHERE name IN ('Argentina', 'Australia') GROUP BY continent)
ORDER BY name

--4.4
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland');

--4.5
SELECT name, 
CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100, 0), '%') AS 'percentage' 
FROM world
WHERE continent = 'Europe'

--4.6
SELECT name
FROM world
WHERE gdp >
  ALL(SELECT gdp
  FROM world
  WHERE gdp>0 AND continent = 'Europe')

--4.7
SELECT continent, name, area
FROM world x
WHERE area >= ALL
  (SELECT area FROM world y
      WHERE x.continent = y.continent
        AND area > 0)

--4.8
SELECT continent, name
FROM world x
WHERE name <= ALL
  (SELECT name
  FROM world y
  WHERE x.continent = y.continent)

--4.9
SELECT name, continent, population
FROM world
WHERE continent NOT IN
  (SELECT continent
  FROM world
  WHERE population >= 25000000)

--4.10
SELECT name, continent
FROM world x
WHERE population > ALL
  (SELECT population * 3
  FROM world y
  WHERE x.continent = y.continent
  AND x.name != y.name)

--5.1
SELECT SUM(population)
FROM world

--5.2
SELECT DISTINCT continent
FROM world

--5.3
SELECT SUM(gdp) AS "Africa's Total GDP"
FROM world
GROUP BY continent
HAVING continent = 'Africa'

--5.4
SELECT COUNT(name)
FROM world
WHERE area >= 1000000

--5.5
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

--5.6
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

--5.7
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent

--5.8
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000