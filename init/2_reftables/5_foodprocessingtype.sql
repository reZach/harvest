BEGIN TRANSACTION 

DECLARE @soliddairyproducts int;
DECLARE @fluidmilk int;

DECLARE @beef int;
declare @pork int;
declare @othermeat int;

declare @chicken int;
declare @turkey int;
declare @otherpoultry int;

declare @shelleggs int;
declare @eggproducts int;

declare @fruittropical int;
declare @fruitsubtropical int;
declare @fruitsmall int;
declare @fruitstone int;
declare @fruitpome int;
declare @fruitmelons int;

declare @vegrootfungi int;
declare @vegrootroots int;
declare @vegroottubers int;
declare @vegrootbulbs int;
declare @vegrootother int;

declare @vegseededlegumes int;
declare @vegseededvine int;
declare @vegseededsolanaceous int;
declare @vegseededother int;

declare @vegherbs int;

declare @vegrowcropsflower int;
declare @vegrowcropsleafy int;
declare @vegrowcropsstem int;

declare @grains int;
declare @beans int;

declare @nuts int;
declare @seeds int;

SELECT @soliddairyproducts = FoodSubtypeId
FROM FoodSubtype f
WHERE f.Name = N'Solid/semi-solid dairy products'
SELECT @fluidmilk = FoodSubtypeId
FROM FoodSubtype f
WHERE f.Name = N'Fluid milk'

SELECT @beef = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Beef'
SELECT @pork = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Pork'
SELECT @othermeat = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Other meat'

SELECT @chicken = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Chicken'
SELECT @turkey = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Turkey'
SELECT @otherpoultry = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Other poultry'

SELECT @shelleggs = FoodSubtypeId
FROM FoodSubtype f
WHERE f.Name = N'Shell eggs'
SELECT @eggproducts = FoodSubtypeId
FROM FoodSubtype f
WHERE f.Name = N'Egg products'

SELECT @fruittropical = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Tropical'
SELECT @fruitsubtropical = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Sub-tropical'
SELECT @fruitsmall = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Small'
SELECT @fruitstone = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Stone'
SELECT @fruitpome = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Pome'
SELECT @fruitmelons = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Melons'

SELECT @vegrootfungi = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Fungi'
SELECT @vegrootroots = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Roots'
SELECT @vegroottubers = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Tubers'
SELECT @vegrootbulbs = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Bulbs'
SELECT @vegrootother = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Other underground'

SELECT @vegseededlegumes = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Legumes'
SELECT @vegseededvine = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Vine-grown'
SELECT @vegseededsolanaceous = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Solanaceous'
SELECT @vegseededother = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Other seeded'

SELECT @vegherbs = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Herbs'

SELECT @vegrowcropsflower = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Flower'
SELECT @vegrowcropsleafy = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Leafy'
SELECT @vegrowcropsstem = FoodSubtypeVarietyId
FROM FoodSubtypeVariety f
WHERE f.Name = N'Stem'

SELECT @grains = FoodSubtypeId
FROM FoodSubtype f
WHERE f.Name = N'Grains'
SELECT @beans = FoodSubtypeId
FROM FoodSubtype f
WHERE f.Name = N'Beans'

SELECT @nuts = FoodSubtypeId
FROM FoodSubtype f
WHERE f.Name = N'Nuts'
SELECT @seeds = FoodSubtypeId
FROM FoodSubtype f
WHERE f.Name = N'Seeds'


INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@soliddairyproducts, null, null, N'Unpasteurized'), (@soliddairyproducts, null, null, N'Pasteurized'), (@fluidmilk, null, null, N'Unpasteurized'), (@fluidmilk, null, null, N'Pasteurized');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @beef, null, N'Ready to eat'), (null, @beef, null, N'Raw otherwise processed'), (null, @pork, null, N'Ready to eat'), (null, @pork, null, N'Raw otherwise processed');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
    VALUES (null, @pork, null, N'Intact raw'), (null, @pork, null N'Non-intact raw'), (null, @othermeat, null, N'Intact raw'), (null, @othermeat, null N'Non-intact raw');

-- subtree #1 meat/beef/ready to eat
declare @beefreadytoeatsubtree int;

select @beefreadytoeatsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Ready to eat'
and f.FoodSubtypeVarietyId = @beef

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @beefreadytoeatsubtree, N'Acidified/fermented'), (null, null, @beefreadytoeatsubtree, N'Dried'), (null, null, @beefreadytoeatsubtree, N'Salt-cured'), (null, null, @beefreadytoeatsubtree, N'Fully cooked');

declare @beefreadytoeatfullycookedsubtree int;

select @beefreadytoeatfullycookedsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Fully cooked'
and f.ParentFoodProcessingTypeId = @beefreadytoeatsubtree

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @beefreadytoeatfullycookedsubtree, N'Hot dog products'), (null, null, @beefreadytoeatfullycookedsubtree, N'Salad/spread/pate'), (null, null, @beefreadytoeatfullycookedsubtree, N'Other fully-cooked sliced'), (null, null, @beefreadytoeatfullycookedsubtree, N'Other fully-cooked not sliced'), (null, null, @beefreadytoeatfullycookedsubtree, N'Diced/shredded'), (null, null, @beefreadytoeatfullycookedsubtree, N'Patties/nuggets'), (null, null, @beefreadytoeatfullycookedsubtree, N'Sausage products'), (null, null, @beefreadytoeatfullycookedsubtree, N'Meat + nonmeat multicomponent'), (null, null, @beefreadytoeatfullycookedsubtree, N'Thermal process/commercial sterile');

-- subtree #2 meat/pork/ready to eat
declare @porkreadytoeatsubtree int;

select @porkreadytoeatsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Ready to eat'
and f.FoodSubtypeVarietyId = @pork

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @porkreadytoeatsubtree, N'Acidified/fermented'), (null, null, @porkreadytoeatsubtree, N'Dried'), (null, null, @porkreadytoeatsubtree, N'Salt-cured'), (null, null, @porkreadytoeatsubtree, N'Fully cooked');

declare @porkreadytoeatfullycookedsubtree int;

select @porkreadytoeatfullycookedsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Fully cooked'
and f.ParentFoodProcessingTypeId = @porkreadytoeatsubtree

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @porkreadytoeatfullycookedsubtree, N'Hot dog products'), (null, null, @porkreadytoeatfullycookedsubtree, N'Salad/spread/pate'), (null, null, @porkreadytoeatfullycookedsubtree, N'Other fully-cooked sliced'), (null, null, @porkreadytoeatfullycookedsubtree, N'Other fully-cooked not sliced'), (null, null, @porkreadytoeatfullycookedsubtree, N'Diced/shredded'), (null, null, @porkreadytoeatfullycookedsubtree, N'Patties/nuggets'), (null, null, @porkreadytoeatfullycookedsubtree, N'Sausage products'), (null, null, @porkreadytoeatfullycookedsubtree, N'Meat + nonmeat multicomponent'), (null, null, @porkreadytoeatfullycookedsubtree, N'Thermal process/commercial sterile');

-- subtree #3 meat/pork/non-intact raw
declare @porknonintactrawsubtree int;

select @porknonintactrawsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Non-intact raw'
and f.FoodSubtypeVarietyId = @pork

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @porknonintactrawsubtree, N'Tenderized/injected meat'), (null, null, @porknonintactrawsubtree, N'Ground meat');

-- subtree #4 meat/other/non-intact raw
declare @othermeatnonintactrawsubtree int;

select @othermeatnonintactrawsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Non-intact raw'
and f.FoodSubtypeVarietyId = @othermeat

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @othermeatnonintactrawsubtree, N'Tenderized/injected meat'), (null, null, @othermeatnonintactrawsubtree, N'Ground meat');


INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @chicken, null, N'Ready to eat'), (null, @chicken, null, N'Raw otherwise processed'), (null, @turkey, null, N'Ready to eat'), (null, @turkey, null, N'Raw otherwise processed');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
    VALUES (null, @pork, null, N'Intact raw'), (null, @pork, null N'Non-intact raw'), (null, @othermeat, null, N'Intact raw'), (null, @othermeat, null N'Non-intact raw');

ROLLBACK TRANSACTION