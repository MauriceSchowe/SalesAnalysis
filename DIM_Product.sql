-- Join [DimProductCategory] and [DimProductSubcategory] because the column ProductCategories does not exist in [DimProduct]
WITH ProductCategories AS
(
SELECT ProductSubcategoryKey, EnglishProductCategoryName, EnglishProductSubcategoryName
FROM [AdventureWorksDW2019].[dbo].[DimProductCategory] AS c
JOIN [AdventureWorksDW2019].[dbo].[DimProductSubcategory] AS s ON
c.ProductCategoryKey = s.ProductCategoryKey
)


SELECT [ProductKey]
      --,[ProductAlternateKey]
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,[EnglishProductName] AS ProductName
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      --,[Color]
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      --,[ListPrice]
      --,[Size]
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      --,[ProductLine]
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      --,[ModelName]
      --,[LargePhoto]
      --,[EnglishDescription]
      --,[FrenchDescription]
      --,[ChineseDescription]
      --,[ArabicDescription]
      --,[HebrewDescription]
      --,[ThaiDescription]
      --,[GermanDescription]
      --,[JapaneseDescription]
      --,[TurkishDescription]
      --,[StartDate]
      --,[EndDate]
      --,[Status]
	  ,CASE WHEN EnglishProductCategoryName IS NULL THEN 'Not specified' ELSE EnglishProductCategoryName END AS Category
	  ,CASE WHEN EnglishProductSubcategoryName IS NULL THEN 'Not specified' ELSE EnglishProductSubcategoryName END AS Subcategory
  FROM [AdventureWorksDW2019].[dbo].[DimProduct] AS p
  LEFT JOIN ProductCategories AS c
  ON p.[ProductSubcategoryKey] = c.[ProductSubcategoryKey]