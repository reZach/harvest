begin transaction 

--IFSAC stuff
insert into FoodGroup (Name)
	values (N'Aquatic animals'), (N'Land animals'), (N'Plants');
declare @aquatic int;
declare @land INT;
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

insert into FoodMajorType (FoodGroupId, Name)
	values (@aquatic, N'Fish'), (@aquatic, N'Shellfish'), (@aquatic, N'Other acquatic animals');
insert into FoodMajorType (FoodGroupId, Name)
	values (@land, N'Dairy'), (@land, N'Game'), (@land, N'Meat-poultry'), (@land, N'Eggs');
insert into FoodMajorType (FoodGroupId, Name)
	values (@plant, N'Oils-sugars'), (@plant, N'Produce'), (@plant, N'Grains-beans'), (@plant, N'Nuts-seeds');
declare @fish int;
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

insert into FoodSubtype (FoodMajorTypeId, Name)
	values (@fish, N'Siluriformes (catfish)'), (@fish, N'Other fish');
insert into FoodSubtype (FoodMajorTypeId, Name)
	values (@shellfish, N'Mollusks'), (@shellfish, N'Crustaceans');
insert into FoodSubtype (FoodMajorTypeId, Name)
	values (@dairy, N'Solid/semi-solid dairy products'), (@dairy, N'Fluid milk');
insert into FoodSubtype (FoodMajorTypeId, Name)
	values (@meatpoultry, N'Meat'), (@meatpoultry, N'Poultry');
insert into FoodSubtype (FoodMajorTypeId, Name)
	values (@eggs, N'Shell eggs'), (@eggs, N'Egg products');
insert into FoodSubtype (FoodMajorTypeId, Name)
	values (@produce, N'Fruits'), (@produce, N'Vegetables');
insert into FoodSubtype (FoodMajorTypeId, Name)
	values (@grainsbeans, N'Grains'), (@produce, N'Beans');
insert into FoodSubtype (FoodMajorTypeId, Name)
	values (@nutsseeds, N'Nuts'), (@produce, N'Seeds');

rollback transaction