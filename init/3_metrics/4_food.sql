BEGIN TRANSACTION

--languages
DECLARE @english int;

SELECT @english = LanguageId
FROM Language l
WHERE l.Code = N'eng'

--food group
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

--food major type
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

--food subtype
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

--food subtype varieties
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

--food processing type


-- foods
INSERT INTO Food (FoodGroupId, FoodMajorTypeId, FoodSubtypeId, FoodSubtypeVarietyId, FoodProcessingTypeId, Example) VALUES 
	(@plant, @produce, @vegetables, @vegrootbulbs, NULL, N'onion')
declare @choppedredonion int;
select @choppedredonion = FoodId
from Food f
where f.FoodGroupId = @plant and f.FoodMajorTypeId = @produce and f.FoodSubtypeId = @vegetables and f.FoodSubtypeVarietyId = @vegrootbulbs
INSERT INTO FoodTranslation (LanguageId, FoodId, Name) VALUES (@english, @choppedredonion, N'chopped red onion')

ROLLBACK TRANSACTION