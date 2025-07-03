-- Check null value in every columns
SELECT
  COUNTIF(Rank IS NULL)AS null_rank,
  COUNTIF(Name IS NULL OR Name = '')AS null_name,
  COUNTIF(Industry IS NULL OR Industry = '') AS null_industry,
  COUNTIF(`Revenue _USD millions_` IS NULL) AS null_revenue,
  COUNTIF(`Revenue growth` IS NULL) AS null_growth,
  COUNTIF(Employees IS NULL) AS null_employees,
  COUNTIF(Headquarters IS NULL OR Headquarters = '') AS null_headquarters
FROM precise-victory-433508-s4.LargestCompaniesinUS.CompaniesinUS

-- Check name duplicate
SELECT
  Name,
  COUNT(*)As count
FROM
  precise-victory-433508-s4.LargestCompaniesinUS.CompaniesinUS
GROUP BY Name
HAVING COUNT(*)>1

-- Split City and State
SELECT
  Headquarters,
  SPLIT(Headquarters, ', ')[SAFE_OFFSET(0)] AS City,
  SPLIT(Headquarters, ', ')[SAFE_OFFSET(1)] AS State
FROM
  precise-victory-433508-s4.LargestCompaniesinUS.CompaniesinUS

-- Create cleaned table
CREATE TABLE `precise-victory-433508-s4.LargestCompaniesinUS.CompaniesinUSCleaned` AS
SELECT
  Rank,
  Name,
  Industry,
  `Revenue _USD millions_`,
  `Revenue growth`,
  Employees,
  Headquarters,
  SPLIT(Headquarters, ', ')[SAFE_OFFSET(0)] AS City,
  SPLIT(Headquarters, ', ')[SAFE_OFFSET(1)] AS State
FROM
  precise-victory-433508-s4.LargestCompaniesinUS.CompaniesinUS


SELECT * 
FROM precise-victory-433508-s4.LargestCompaniesinUS.CompaniesinUSCleaned
ORDER BY Rank 
