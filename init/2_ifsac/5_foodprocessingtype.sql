BEGIN TRANSACTION 

DECLARE @soliddairyproducts int;
DECLARE @fluidmilk int;

DECLARE @beef int;
DECLARE @pork int;
DECLARE @othermeat int;

DECLARE @chicken int;
DECLARE @turkey int;
DECLARE @otherpoultry int;

DECLARE @shelleggs int;
DECLARE @eggproducts int;

DECLARE @fruittropical int;
DECLARE @fruitsubtropical int;
DECLARE @fruitsmall int;
DECLARE @fruitstone int;
DECLARE @fruitpome int;
DECLARE @fruitmelons int;

DECLARE @vegfungi int;

DECLARE @vegrootroots int;
DECLARE @vegroottubers int;
DECLARE @vegrootbulbs int;
DECLARE @vegrootother int;

DECLARE @vegseededlegumes int;
DECLARE @vegseededvine int;
DECLARE @vegseededsolanaceous int;
DECLARE @vegseededother int;

DECLARE @vegherbs int;

DECLARE @vegrowcropsflower int;
DECLARE @vegrowcropsleafy int;
DECLARE @vegrowcropsstem int;

DECLARE @grains int;
DECLARE @beans int;

DECLARE @nuts int;
DECLARE @seeds int;

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
	VALUES (@soliddairyproducts, NULL, NULL, N'Unpasteurized'), (@soliddairyproducts, NULL, NULL, N'Pasteurized'), (@fluidmilk, NULL, NULL, N'Unpasteurized'), (@fluidmilk, NULL, NULL, N'Pasteurized');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @beef, NULL, N'Ready to eat'), (NULL, @beef, NULL, N'Raw otherwise processed'), (NULL, @pork, NULL, N'Ready to eat'), (NULL, @pork, NULL, N'Raw otherwise processed');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
    VALUES (NULL, @pork, NULL, N'Intact raw'), (NULL, @pork, NULL, N'Non-intact raw'), (NULL, @othermeat, NULL, N'Intact raw'), (NULL, @othermeat, NULL, N'Non-intact raw');

-- subtree #1 meat/beef/ready to eat
DECLARE @beefreadytoeatsubtree int;

SELECT @beefreadytoeatsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Ready to eat'
AND f.FoodSubtypeVarietyId = @beef

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @beefreadytoeatsubtree, N'Acidified/fermented'), (NULL, NULL, @beefreadytoeatsubtree, N'Dried'), (NULL, NULL, @beefreadytoeatsubtree, N'Salt-cured'), (NULL, NULL, @beefreadytoeatsubtree, N'Fully cooked');

DECLARE @beefreadytoeatfullycookedsubtree int;

SELECT @beefreadytoeatfullycookedsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Fully cooked'
AND f.ParentFoodProcessingTypeId = @beefreadytoeatsubtree

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @beefreadytoeatfullycookedsubtree, N'Hot dog products'), (NULL, NULL, @beefreadytoeatfullycookedsubtree, N'Salad/spread/pate'), (NULL, NULL, @beefreadytoeatfullycookedsubtree, N'Other fully-cooked sliced'), (NULL, NULL, @beefreadytoeatfullycookedsubtree, N'Other fully-cooked not sliced'), (NULL, NULL, @beefreadytoeatfullycookedsubtree, N'Diced/shredded'), (NULL, NULL, @beefreadytoeatfullycookedsubtree, N'Patties/nuggets'), (NULL, NULL, @beefreadytoeatfullycookedsubtree, N'Sausage products'), (NULL, NULL, @beefreadytoeatfullycookedsubtree, N'Meat + nonmeat multicomponent'), (NULL, NULL, @beefreadytoeatfullycookedsubtree, N'Thermal process/commercial sterile');

-- subtree #2 meat/pork/ready to eat
DECLARE @porkreadytoeatsubtree int;

SELECT @porkreadytoeatsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Ready to eat'
AND f.FoodSubtypeVarietyId = @pork

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @porkreadytoeatsubtree, N'Acidified/fermented'), (NULL, NULL, @porkreadytoeatsubtree, N'Dried'), (NULL, NULL, @porkreadytoeatsubtree, N'Salt-cured'), (NULL, NULL, @porkreadytoeatsubtree, N'Fully cooked');

DECLARE @porkreadytoeatfullycookedsubtree int;

SELECT @porkreadytoeatfullycookedsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Fully cooked'
AND f.ParentFoodProcessingTypeId = @porkreadytoeatsubtree

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @porkreadytoeatfullycookedsubtree, N'Hot dog products'), (NULL, NULL, @porkreadytoeatfullycookedsubtree, N'Salad/spread/pate'), (NULL, NULL, @porkreadytoeatfullycookedsubtree, N'Other fully-cooked sliced'), (NULL, NULL, @porkreadytoeatfullycookedsubtree, N'Other fully-cooked not sliced'), (NULL, NULL, @porkreadytoeatfullycookedsubtree, N'Diced/shredded'), (NULL, NULL, @porkreadytoeatfullycookedsubtree, N'Patties/nuggets'), (NULL, NULL, @porkreadytoeatfullycookedsubtree, N'Sausage products'), (NULL, NULL, @porkreadytoeatfullycookedsubtree, N'Meat + nonmeat multicomponent'), (NULL, NULL, @porkreadytoeatfullycookedsubtree, N'Thermal process/commercial sterile');

-- subtree #3 meat/pork/non-intact raw
DECLARE @porknonintactrawsubtree int;

SELECT @porknonintactrawsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Non-intact raw'
AND f.FoodSubtypeVarietyId = @pork

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @porknonintactrawsubtree, N'Tenderized/injected meat'), (NULL, NULL, @porknonintactrawsubtree, N'Ground meat');

-- subtree #4 meat/other/non-intact raw
DECLARE @othermeatnonintactrawsubtree int;

SELECT @othermeatnonintactrawsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Non-intact raw'
AND f.FoodSubtypeVarietyId = @othermeat

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES 
	(NULL, NULL, @othermeatnonintactrawsubtree, N'Tenderized/injected meat'), 
	(NULL, NULL, @othermeatnonintactrawsubtree, N'Ground meat');


INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @chicken, NULL, N'Ready to eat'), (NULL, @chicken, NULL, N'Raw otherwise processed'), (NULL, @turkey, NULL, N'Ready to eat'), (NULL, @turkey, NULL, N'Raw otherwise processed');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
    VALUES (NULL, @turkey, NULL, N'Intact raw'), (NULL, @turkey, NULL, N'Non-intact raw'), (NULL, @otherpoultry, NULL, N'Intact raw'), (NULL, @otherpoultry, NULL, N'Non-intact raw');

-- subtree #5 poultry/chicken/ready to eat
DECLARE @chickenreadytoeatsubtree int;

SELECT @chickenreadytoeatsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Ready to eat'
AND f.FoodSubtypeVarietyId = @chicken

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @chickenreadytoeatsubtree, N'Acidified/fermented'), (NULL, NULL, @chickenreadytoeatsubtree, N'Dried'), (NULL, NULL, @chickenreadytoeatsubtree, N'Salt-cured'), (NULL, NULL, @chickenreadytoeatsubtree, N'Fully cooked');

DECLARE @chickenreadytoeatfullycookedsubtree int;

SELECT @chickenreadytoeatfullycookedsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Fully cooked'
AND f.ParentFoodProcessingTypeId = @chickenreadytoeatsubtree

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @chickenreadytoeatfullycookedsubtree, N'Hot dog products'), (NULL, NULL, @chickenreadytoeatfullycookedsubtree, N'Salad/spread/pate'), (NULL, NULL, @chickenreadytoeatfullycookedsubtree, N'Other fully-cooked sliced'), (NULL, NULL, @chickenreadytoeatfullycookedsubtree, N'Other fully-cooked not sliced'), (NULL, NULL, @chickenreadytoeatfullycookedsubtree, N'Diced/shredded'), (NULL, NULL, @chickenreadytoeatfullycookedsubtree, N'Patties/nuggets'), (NULL, NULL, @chickenreadytoeatfullycookedsubtree, N'Sausage products'), (NULL, NULL, @chickenreadytoeatfullycookedsubtree, N'Meat + nonmeat multicomponent'), (NULL, NULL, @chickenreadytoeatfullycookedsubtree, N'Thermal process/commercial sterile');

-- subtree #6 poultry/turkey/ready to eat
DECLARE @turkeyreadytoeatsubtree int;

SELECT @turkeyreadytoeatsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Ready to eat'
AND f.FoodSubtypeVarietyId = @turkey

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @turkeyreadytoeatsubtree, N'Acidified/fermented'), (NULL, NULL, @turkeyreadytoeatsubtree, N'Dried'), (NULL, NULL, @turkeyreadytoeatsubtree, N'Salt-cured'), (NULL, NULL, @turkeyreadytoeatsubtree, N'Fully cooked');

DECLARE @turkeyreadytoeatfullycookedsubtree int;

SELECT @turkeyreadytoeatfullycookedsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Fully cooked'
AND f.ParentFoodProcessingTypeId = @turkeyreadytoeatsubtree

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @turkeyreadytoeatfullycookedsubtree, N'Hot dog products'), (NULL, NULL, @turkeyreadytoeatfullycookedsubtree, N'Salad/spread/pate'), (NULL, NULL, @turkeyreadytoeatfullycookedsubtree, N'Other fully-cooked sliced'), (NULL, NULL, @turkeyreadytoeatfullycookedsubtree, N'Other fully-cooked not sliced'), (NULL, NULL, @turkeyreadytoeatfullycookedsubtree, N'Diced/shredded'), (NULL, NULL, @turkeyreadytoeatfullycookedsubtree, N'Patties/nuggets'), (NULL, NULL, @turkeyreadytoeatfullycookedsubtree, N'Sausage products'), (NULL, NULL, @turkeyreadytoeatfullycookedsubtree, N'Meat + nonmeat multicomponent'), (NULL, NULL, @turkeyreadytoeatfullycookedsubtree, N'Thermal process/commercial sterile');


INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@shelleggs, NULL, NULL, N'Unpasteurized'), (@shelleggs, NULL, NULL, N'Pasteurized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@eggproducts, NULL, NULL, N'Egg substitues'), (@eggproducts, NULL, NULL, N'Cooked egg products'), (@eggproducts, NULL, NULL, N'Ready to eat egg products');

-- subtree #7 eggs/egg products/ready to eat egg products
DECLARE @eggproductsreadytoeatsubtree int;

SELECT @eggproductsreadytoeatsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Ready to eat egg products'
AND f.FoodSubtypeId = @eggproducts

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @eggproductsreadytoeatsubtree, N'Liquid OR frozen'), (NULL, NULL, @eggproductsreadytoeatsubtree, N'Dried');


INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @fruittropical, NULL, N'Frozen'), (NULL, @fruittropical, NULL, N'Dried'), (NULL, @fruittropical, NULL, N'Fresh-cut'), (NULL, @fruittropical, NULL, N'Raw'), (NULL, @fruittropical, NULL, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @fruitsubtropical, NULL, N'Frozen'), (NULL, @fruitsubtropical, NULL, N'Dried'), (NULL, @fruitsubtropical, NULL, N'Fresh-cut'), (NULL, @fruitsubtropical, NULL, N'Raw'), (NULL, @fruitsubtropical, NULL, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @fruitsmall, NULL, N'Frozen'), (NULL, @fruitsmall, NULL, N'Dried'), (NULL, @fruitsmall, NULL, N'Fresh-cut'), (NULL, @fruitsmall, NULL, N'Raw'), (NULL, @fruitsmall, NULL, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @fruitstone, NULL, N'Frozen'), (NULL, @fruitstone, NULL, N'Dried'), (NULL, @fruitstone, NULL, N'Fresh-cut'), (NULL, @fruitstone, NULL, N'Raw'), (NULL, @fruitstone, NULL, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @fruitpome, NULL, N'Frozen'), (NULL, @fruitpome, NULL, N'Dried'), (NULL, @fruitpome, NULL, N'Fresh-cut'), (NULL, @fruitpome, NULL, N'Raw'), (NULL, @fruitpome, NULL, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @fruitmelons, NULL, N'Frozen'), (NULL, @fruitmelons, NULL, N'Dried'), (NULL, @fruitmelons, NULL, N'Fresh-cut'), (NULL, @fruitmelons, NULL, N'Raw'), (NULL, @fruitmelons, NULL, N'Canned/containerized');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegfungi, NULL, N'Fresh'), (NULL, @vegfungi, NULL, N'Dried'), (NULL, @vegfungi, NULL, N'Canned/containerized');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegrootroots, NULL, N'Fresh'), (NULL, @vegrootroots, NULL, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegroottubers, NULL, N'Fresh'), (NULL, @vegroottubers, NULL, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegrootbulbs, NULL, N'Fresh'), (NULL, @vegrootbulbs, NULL, N'Canned/containerized');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegrootother, NULL, N'Fresh'), (NULL, @vegrootother, NULL, N'Canned/containerized');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegseededlegumes, NULL, N'Fresh'), (NULL, @vegseededlegumes, NULL, N'Canned/containerized'), (NULL, @vegseededlegumes, NULL, N'Frozen'), (NULL, @vegseededlegumes, NULL, N'Dried');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegseededvine, NULL, N'Fresh'), (NULL, @vegseededvine, NULL, N'Canned/containerized'), (NULL, @vegseededvine, NULL, N'Frozen'), (NULL, @vegseededvine, NULL, N'Dried');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegseededsolanaceous, NULL, N'Fresh'), (NULL, @vegseededsolanaceous, NULL, N'Canned/containerized'), (NULL, @vegseededsolanaceous, NULL, N'Frozen'), (NULL, @vegseededsolanaceous, NULL, N'Dried');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegseededother, NULL, N'Fresh'), (NULL, @vegseededother, NULL, N'Canned/containerized'), (NULL, @vegseededother, NULL, N'Frozen'), (NULL, @vegseededother, NULL, N'Dried');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegherbs, NULL, N'Fresh herbs'), (NULL, @vegherbs, NULL, N'Dried herbs'), (NULL, @vegherbs, NULL, N'Teas');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegrowcropsflower, NULL, N'Fresh'), (NULL, @vegrowcropsflower, NULL, N'Canned/containerized'), (NULL, @vegrowcropsflower, NULL, N'Frozen'), (NULL, @vegrowcropsflower, NULL, N'Dried');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegrowcropsleafy, NULL, N'Fresh'), (NULL, @vegrowcropsleafy, NULL, N'Canned/containerized'), (NULL, @vegrowcropsleafy, NULL, N'Frozen'), (NULL, @vegrowcropsleafy, NULL, N'Dried');
INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, @vegrowcropsstem, NULL, N'Fresh'), (NULL, @vegrowcropsstem, NULL, N'Canned/containerized'), (NULL, @vegrowcropsstem, NULL, N'Frozen'), (NULL, @vegrowcropsstem, NULL, N'Dried');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@grains, NULL, NULL, N'Ground'), (@grains, NULL, NULL, N'Whole');

-- subtree #8 grains/ground
DECLARE @grainsgroundsubtree int;

SELECT @grainsgroundsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Ground'
AND f.FoodSubtypeId = @grains

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @grainsgroundsubtree, N'Flour'), (NULL, NULL, @grainsgroundsubtree, N'Flour-based product');

DECLARE @grainsgroundflourbasedsubtree int;

SELECT @grainsgroundflourbasedsubtree = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.Name = N'Flour-based product'
AND f.ParentFoodProcessingTypeId = @grainsgroundsubtree

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (NULL, NULL, @grainsgroundflourbasedsubtree, N'Breads'), (NULL, NULL, @grainsgroundflourbasedsubtree, N'Doughs'), (NULL, NULL, @grainsgroundflourbasedsubtree, N'Pastas'), (NULL, NULL, @grainsgroundflourbasedsubtree, N'Prepared cereals'), (NULL, NULL, @grainsgroundflourbasedsubtree, N'Cakes'), (NULL, NULL, @grainsgroundflourbasedsubtree, N'Biscuits/cookies/wafers');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@beans, NULL, NULL, N'Whole, dried'), (@beans, NULL, NULL, N'Canned/containerized'), (@beans, NULL, NULL, N'Ground, flour');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@nuts, NULL, NULL, N'Processed'), (@nuts, NULL, NULL, N'Unprocessed');

INSERT INTO FoodProcessingType (FoodSubtypeId, FoodSubtypeVarietyId, ParentFoodProcessingTypeId, Name)
	VALUES (@seeds, NULL, NULL, N'Crushed/cracked/ground'), (@seeds, NULL, NULL, N'Whole, dried'), (@seeds, NULL, NULL, N'Paste');

ROLLBACK TRANSACTION