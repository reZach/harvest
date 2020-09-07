BEGIN TRANSACTION 

DECLARE @mollusks int;

DECLARE @meat int;
DECLARE @poultry int;

DECLARE @fruits int;
DECLARE @vegetables int;

SELECT @mollusks = FoodSubtypeId
FROM FoodSubtype fs
WHERE fs.Name = N'Mollusks'

SELECT @meat = FoodSubtypeId
FROM FoodSubtype fs
WHERE fs.Name = N'Meat'
SELECT @poultry = FoodSubtypeId
FROM FoodSubtype fs
WHERE fs.Name = N'Poultry'

SELECT @fruits = FoodSubtypeId
FROM FoodSubtype fs
WHERE fs.Name = N'Fruits'
SELECT @vegetables = FoodSubtypeId
FROM FoodSubtype fs
WHERE fs.Name = N'Vegetables'


INSERT INTO FoodSubtypeVariety (FoodSubtypeId, Name)
	VALUES (@mollusks, N'Bivalve'), (@mollusks, N'Non-bivalve');

INSERT INTO FoodSubtypeVariety (FoodSubtypeId, Name)
	VALUES (@meat, N'Beef'), (@meat, N'Pork'), (meat, N'Other meat');
INSERT INTO FoodSubtypeVariety (FoodSubtypeId, Name)
	VALUES (@poultry, N'Chicken'), (@poultry, N'Turkey'), (@poultry, N'Other poultry');

INSERT INTO FoodSubtypeVariety (FoodSubtypeId, Name)
	VALUES (@fruits, N'Tropical'), (@fruits, N'Sub-tropical'), (@fruits, N'Small'), (@fruits, N'Stone'), (@fruits, N'Pome'), (@fruits, N'Melons');
INSERT INTO FoodSubtypeVariety (FoodSubtypeId, Name)
	VALUES (@vegetables, N'Fungi'), (@vegetables, N'Sprouts'), (@vegetables, N'Root/underground'), (@vegetables, N'Seeded vegetables'), (@vegetables, N'Herbs'), (@vegetables, N'Vegetable row crops');


DECLARE @rootunderground int;
DECLARE @seededvegetables int;
DECLARE @vegetablerowcrops int;

SELECT @rootunderground = FoodSubtypeId
FROM FoodSubtypeVariety fv
WHERE fv.Name = N'Root/underground'
SELECT @seededvegetables = FoodSubtypeId
FROM FoodSubtypeVariety fv
WHERE fv.Name = N'Seeded vegetables'
SELECT @vegetablerowcrops = FoodSubtypeId
FROM FoodSubtypeVariety fv
WHERE fv.Name = N'Vegetable row crops'

INSERT INTO FoodSubtypeVariety (ParentFoodSubtypeVarietyId, Name)
    Values (@rootunderground, N'Roots'), (@rootunderground, N'Tubers'), (@rootunderground, N'Bulbs'), (@rootunderground, N'Other underground');
INSERT INTO FoodSubtypeVariety (ParentFoodSubtypeVarietyId, Name)
    Values (@seededvegetables, N'Legumes'), (@seededvegetables, N'Vine-grown'), (@seededvegetables, N'Solanaceous'), (@seededvegetables, N'Other seeded');
INSERT INTO FoodSubtypeVariety (ParentFoodSubtypeVarietyId, Name)
    Values (@vegetablerowcrops, N'Flower'), (@vegetablerowcrops, N'Leafy'), (@vegetablerowcrops, N'Stem');

ROLLBACK TRANSACTION