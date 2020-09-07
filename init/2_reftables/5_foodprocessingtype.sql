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

declare @vegfungi int;

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

SELECT @vegfungi = FoodSubtypeVarietyId
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
    VALUES (null, @turkey, null, N'Intact raw'), (null, @turkey, null N'Non-intact raw'), (null, @otherpoultry, null, N'Intact raw'), (null, @otherpoultry, null N'Non-intact raw');

-- subtree #5 poultry/chicken/ready to eat
declare @chickenreadytoeatsubtree int;

select @chickenreadytoeatsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Ready to eat'
and f.FoodSubtypeVarietyId = @chicken

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @chickenreadytoeatsubtree, N'Acidified/fermented'), (null, null, @chickenreadytoeatsubtree, N'Dried'), (null, null, @chickenreadytoeatsubtree, N'Salt-cured'), (null, null, @chickenreadytoeatsubtree, N'Fully cooked');

declare @chickenreadytoeatfullycookedsubtree int;

select @chickenreadytoeatfullycookedsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Fully cooked'
and f.ParentFoodProcessingTypeId = @chickenreadytoeatsubtree

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @chickenreadytoeatfullycookedsubtree, N'Hot dog products'), (null, null, @chickenreadytoeatfullycookedsubtree, N'Salad/spread/pate'), (null, null, @chickenreadytoeatfullycookedsubtree, N'Other fully-cooked sliced'), (null, null, @chickenreadytoeatfullycookedsubtree, N'Other fully-cooked not sliced'), (null, null, @chickenreadytoeatfullycookedsubtree, N'Diced/shredded'), (null, null, @chickenreadytoeatfullycookedsubtree, N'Patties/nuggets'), (null, null, @chickenreadytoeatfullycookedsubtree, N'Sausage products'), (null, null, @chickenreadytoeatfullycookedsubtree, N'Meat + nonmeat multicomponent'), (null, null, @chickenreadytoeatfullycookedsubtree, N'Thermal process/commercial sterile');

-- subtree #6 poultry/turkey/ready to eat
declare @turkeyreadytoeatsubtree int;

select @turkeyreadytoeatsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Ready to eat'
and f.FoodSubtypeVarietyId = @turkey

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @turkeyreadytoeatsubtree, N'Acidified/fermented'), (null, null, @turkeyreadytoeatsubtree, N'Dried'), (null, null, @turkeyreadytoeatsubtree, N'Salt-cured'), (null, null, @turkeyreadytoeatsubtree, N'Fully cooked');

declare @turkeyreadytoeatfullycookedsubtree int;

select @turkeyreadytoeatfullycookedsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Fully cooked'
and f.ParentFoodProcessingTypeId = @turkeyreadytoeatsubtree

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @turkeyreadytoeatfullycookedsubtree, N'Hot dog products'), (null, null, @turkeyreadytoeatfullycookedsubtree, N'Salad/spread/pate'), (null, null, @turkeyreadytoeatfullycookedsubtree, N'Other fully-cooked sliced'), (null, null, @turkeyreadytoeatfullycookedsubtree, N'Other fully-cooked not sliced'), (null, null, @turkeyreadytoeatfullycookedsubtree, N'Diced/shredded'), (null, null, @turkeyreadytoeatfullycookedsubtree, N'Patties/nuggets'), (null, null, @turkeyreadytoeatfullycookedsubtree, N'Sausage products'), (null, null, @turkeyreadytoeatfullycookedsubtree, N'Meat + nonmeat multicomponent'), (null, null, @turkeyreadytoeatfullycookedsubtree, N'Thermal process/commercial sterile');


INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@shelleggs, null, null, N'Unpasteurized'), (@shelleggs, null, null, N'Pasteurized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@eggproducts, null, null, N'Egg substitues'), (@eggproducts, null, null, N'Cooked egg products'), (@eggproducts, null, null, N'Ready to eat egg products');

-- subtree #7 eggs/egg products/ready to eat egg products
declare @eggproductsreadytoeatsubtree int;

select @eggproductsreadytoeatsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Ready to eat egg products'
and f.FoodSubtypeId = @eggproducts

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @eggproductsreadytoeatsubtree, N'Liquid or frozen'), (null, null, @eggproductsreadytoeatsubtree, N'Dried');


INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @fruittropical, null, N'Frozen'), (null, @fruittropical, null, N'Dried'), (null, @fruittropical, null, N'Fresh-cut'), (null, @fruittropical, null, N'Raw'), (null, @fruittropical, null, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @fruitsubtropical, null, N'Frozen'), (null, @fruitsubtropical, null, N'Dried'), (null, @fruitsubtropical, null, N'Fresh-cut'), (null, @fruitsubtropical, null, N'Raw'), (null, @fruitsubtropical, null, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @fruitsmall, null, N'Frozen'), (null, @fruitsmall, null, N'Dried'), (null, @fruitsmall, null, N'Fresh-cut'), (null, @fruitsmall, null, N'Raw'), (null, @fruitsmall, null, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @fruitstone, null, N'Frozen'), (null, @fruitstone, null, N'Dried'), (null, @fruitstone, null, N'Fresh-cut'), (null, @fruitstone, null, N'Raw'), (null, @fruitstone, null, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @fruitpome, null, N'Frozen'), (null, @fruitpome, null, N'Dried'), (null, @fruitpome, null, N'Fresh-cut'), (null, @fruitpome, null, N'Raw'), (null, @fruitpome, null, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @fruitmelons, null, N'Frozen'), (null, @fruitmelons, null, N'Dried'), (null, @fruitmelons, null, N'Fresh-cut'), (null, @fruitmelons, null, N'Raw'), (null, @fruitmelons, null, N'Canned/containerized');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegfungi, null, N'Fresh'), (null, @vegfungi, null, N'Dried'), (null, @vegfungi, null, N'Canned/containerized');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegrootroots, null, N'Fresh'), (null, @vegrootroots, null, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegroottubers, null, N'Fresh'), (null, @vegroottubers, null, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegrootbulbs, null, N'Fresh'), (null, @vegrootbulbs, null, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegrootother, null, N'Fresh'), (null, @vegrootother, null, N'Canned/containerized');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegseededlegumes, null, N'Fresh'), (null, @vegseededlegumes, null, N'Canned/containerized'), (null, @vegseededlegumes, null, N'Frozen'), (null, @vegseededlegumes, null, N'Dried');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegseededvine, null, N'Fresh'), (null, @vegseededvine, null, N'Canned/containerized'), (null, @vegseededvine, null, N'Frozen'), (null, @vegseededvine, null, N'Dried');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegseededsolanaceous, null, N'Fresh'), (null, @vegseededsolanaceous, null, N'Canned/containerized'), (null, @vegseededsolanaceous, null, N'Frozen'), (null, @vegseededsolanaceous, null, N'Dried');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegseededother, null, N'Fresh'), (null, @vegseededother, null, N'Canned/containerized'), (null, @vegseededother, null, N'Frozen'), (null, @vegseededother, null, N'Dried');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegherbs, null, N'Fresh herbs'), (null, @vegherbs, null, N'Dried herbs'), (null, @vegherbs, null, N'Teas');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegrowcropsflower, null, N'Fresh'), (null, @vegrowcropsflower, null, N'Canned/containerized'), (null, @vegrowcropsflower, null, N'Frozen'), (null, @vegrowcropsflower, null, N'Dried');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegrowcropsleafy, null, N'Fresh'), (null, @vegrowcropsleafy, null, N'Canned/containerized'), (null, @vegrowcropsleafy, null, N'Frozen'), (null, @vegrowcropsleafy, null, N'Dried');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, @vegrowcropsstem, null, N'Fresh'), (null, @vegrowcropsstem, null, N'Canned/containerized'), (null, @vegrowcropsstem, null, N'Frozen'), (null, @vegrowcropsstem, null, N'Dried');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@grains, null, null, N'Ground'), (@grains, null, null, N'Whole');

-- subtree #8 grains/ground
declare @grainsgroundsubtree int;

select @grainsgroundsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Ground'
and f.FoodSubtypeId = @grains

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @grainsgroundsubtree, N'Flour'), (null, null, @grainsgroundsubtree, N'Flour-based product');

declare @grainsgroundflourbasedsubtree int;

select @grainsgroundflourbasedsubtree = FoodProcessingTypeId
from FoodProcessingType f
where f.Name = N'Flour-based product'
and f.ParentFoodProcessingTypeId = @grainsgroundsubtree

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (null, null, @grainsgroundflourbasedsubtree, N'Breads'), (null, null, @grainsgroundflourbasedsubtree, N'Doughs'), (null, null, @grainsgroundflourbasedsubtree, N'Pastas'), (null, null, @grainsgroundflourbasedsubtree, N'Prepared cereals'), (null, null, @grainsgroundflourbasedsubtree, N'Cakes'), (null, null, @grainsgroundflourbasedsubtree, N'Biscuits/cookies/wafers');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@beans, null, null, N'Whole, dried'), (@beans, null, null, N'Canned/containerized'), (@beans, null, null, N'Ground, flour');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@nuts, null, null, N'Processed'), (@nuts, null, null, N'Unprocessed');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@seeds, null, null, N'Crushed/cracked/ground'), (@seeds, null, null, N'Whole, dried'), (@seeds, null, null, N'Paste');

ROLLBACK TRANSACTION