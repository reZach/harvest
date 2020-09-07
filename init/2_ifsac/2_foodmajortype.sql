BEGIN TRANSACTION 

DECLARE @aquatic int;
DECLARE @land INT;
DECLARE @plant INT;

SELECT @aquatic = FoodGroupId
FROM FoodGroup fg
WHERE fg.Name = N'Aquatic animals'
SELECT @land = FoodGroupId
FROM FoodGroup fg
WHERE fg.Name = N'Land animals'
SELECT @plant = FoodGroupId
FROM FoodGroup fg
WHERE fg.Name = N'Plants'

INSERT INTO FoodMajorType (FoodGroupId, Name)
	VALUES (@aquatic, N'Fish'), (@aquatic, N'Shellfish'), (@aquatic, N'Other acquatic animals');
INSERT INTO FoodMajorType (FoodGroupId, Name)
	VALUES (@land, N'Dairy'), (@land, N'Game'), (@land, N'Meat-poultry'), (@land, N'Eggs');
INSERT INTO FoodMajorType (FoodGroupId, Name)
	VALUES (@plant, N'Oils-sugars'), (@plant, N'Produce'), (@plant, N'Grains-beans'), (@plant, N'Nuts-seeds');

ROLLBACK TRANSACTION