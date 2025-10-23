SELECT AVG(amount) FROM company;
SELECT SUM(amount) FROM company;
SELECT MAX(amount) FROM company;
SELECT MIN(amount) FROM company;
SELECT COUNT(*) FROM company;

SELECT companyn, SUM(amount) FROM company GROUP BY companyn;
SELECT companyn, MIN(amount) FROM company GROUP BY companyn;
SELECT companyn, MAX(amount) FROM company GROUP BY companyn;
SELECT companyn, COUNT(*) FROM company GROUP BY companyn;
SELECT companyn, COUNT(*) FROM company GROUP BY companyn HAVING COUNT(*)>1;
SELECT companyn, SUM(amount) FROM company GROUP BY companyn HAVING SUM(amount)>10000;
