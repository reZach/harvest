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
	values (@aquatic, N'Fish'), (@aquatic, N'Shellfish'), (@aquatic, N'Other  acquatic animals');
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


insert into FoodSubtype (FoodGroupId, Name)
	values (2, N'Dairy'), (2, N'Game'), (2, N'Meat-poultry'), (2, N'Eggs');

rollback transaction