BEGIN TRANSACTION 

DECLARE @fish int;
DECLARE @shellfish INT;
DECLARE @otheracquatic INT;

DECLARE @dairy INT;
DECLARE @game INT;
DECLARE @meatpoultry INT;
DECLARE @eggs INT;

DECLARE @oilssugars INT;
DECLARE @produce INT;
DECLARE @grainsbeans INT;
DECLARE @nutsseeds INT;

SELECT @fish = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Fish'
SELECT @shellfish = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Shellfish'
SELECT @otheracquatic = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Other acquatic animals'

SELECT @dairy = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Dairy'
SELECT @game = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Game'
SELECT @meatpoultry = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Meat-poultry'
SELECT @eggs = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Eggs'

SELECT @oilssugars = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Oils-sugars'
SELECT @produce = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Produce'
SELECT @grainsbeans = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Grains-beans'
SELECT @nutsseeds = FoodMajorTypeId
FROM FoodMajorType fm
WHERE fm.Name = N'Nuts-seeds'

INSERT INTO FoodSubtype (FoodMajorTypeId, Name)
	VALUES (@fish, N'Siluriformes (catfish)'), (@fish, N'Other fish');
INSERT INTO FoodSubtype (FoodMajorTypeId, Name)
	VALUES (@shellfish, N'Mollusks'), (@shellfish, N'Crustaceans');
INSERT INTO FoodSubtype (FoodMajorTypeId, Name)
	VALUES (@dairy, N'Solid/semi-solid dairy products'), (@dairy, N'Fluid milk');
INSERT INTO FoodSubtype (FoodMajorTypeId, Name)
	VALUES (@meatpoultry, N'Meat'), (@meatpoultry, N'Poultry');
INSERT INTO FoodSubtype (FoodMajorTypeId, Name)
	VALUES (@eggs, N'Shell eggs'), (@eggs, N'Egg products');
INSERT INTO FoodSubtype (FoodMajorTypeId, Name)
	VALUES (@produce, N'Fruits'), (@produce, N'Vegetables');
INSERT INTO FoodSubtype (FoodMajorTypeId, Name)
	VALUES (@grainsbeans, N'Grains'), (@produce, N'Beans');
INSERT INTO FoodSubtype (FoodMajorTypeId, Name)
	VALUES (@nutsseeds, N'Nuts'), (@produce, N'Seeds');

ROLLBACK TRANSACTION