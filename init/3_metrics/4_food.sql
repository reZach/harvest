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
declare @soliddairyunpasteurized int;
declare @soliddairypasteurized int;
declare @fluidmilkunpasteurized int;
declare @fluidmilkpasteurized int;

declare @beefrawprocessed int;
declare @beefreadytoeat int;
declare @beefacidified int;
declare @beefdried int;
declare @beefsaltcured int;
declare @beeffullycooked int;
declare @beefhotdog int;
declare @beefsaladspread int;
declare @beefotherfullycookedsliced int;
declare @beefotherfullycookednotsliced int;
declare @beefdiced int;
declare @beefpatties int;
declare @beefsausage int;
declare @beefmeatplusnonmeat int;
declare @beefthermalprocess int;

declare @porkrawprocessed int;
declare @porkreadytoeat int;
declare @porkacidified int;
declare @porkdried int;
declare @porksaltcured int;
declare @porkfullycooked int;
declare @porkhotdog int;
declare @porksaladspread int;
declare @porkotherfullycookedsliced int;
declare @porkotherfullycookednotsliced int;
declare @porkdiced int;
declare @porkpatties int;
declare @porksausage int;
declare @porkmeatplusnonmeat int;
declare @porkthermalprocess int;

declare @porkintactraw int;
declare @porktenderized int;
declare @porkground int;
declare @othermeatintactraw int;
declare @othermeattenderized int;
declare @othermeatground int;

declare @chickenrawprocessed int;
declare @chickenacidified int;
declare @chickendried int;
declare @chickensaltcured int;
declare @chickenhotdog int;
declare @chickensaladspread int;
declare @chickenotherfullycookedsliced int;
declare @chickenotherfullycookednotsliced int;
declare @chickendiced int;
declare @chickenpatties int;
declare @chickensausage int;
declare @chickenmeatplusnonmeat int;
declare @chickenthermalprocess int;

declare @turkeyrawprocessed int;
declare @turkeyacidified int;
declare @turkeydried int;
declare @turkeysaltcured int;
declare @turkeyhotdog int;
declare @turkeysaladspread int;
declare @turkeyotherfullycookedsliced int;
declare @turkeyotherfullycookednotsliced int;
declare @turkeydiced int;
declare @turkeypatties int;
declare @turkeysausage int;
declare @turkeymeatplusnonmeat int;
declare @turkeythermalprocess int;

declare @turkeyintactraw int;
declare @turkeynonintactraw int;
declare @otherpoultryintactraw int;
declare @otherpoultrynonintactraw int;

declare @shelleggspasteurized int;
declare @shelleggsunpasteurized int;
declare @eggproductssubstitues int;
declare @eggproductscooked int;
declare @eggproductsreadytoeatliquidfrozen int;
declare @eggproductsreadytoeatdried int;

declare @fruittropicalfrozen int;
declare @fruittropicaldried int;
declare @fruittropicalfreshcut int;
declare @fruittropicalraw int;
declare @fruittropicalcanned int;
declare @fruitsubtropicalfrozen int;
declare @fruitsubtropicaldried int;
declare @fruitsubtropicalfreshcut int;
declare @fruitsubtropicalraw int;
declare @fruitsubtropicalcanned int;
declare @fruitsmallfrozen int;
declare @fruitsmalldried int;
declare @fruitsmallfreshcut int;
declare @fruitsmallraw int;
declare @fruitsmallcanned int;
declare @fruitstonefrozen int;
declare @fruitstonedried int;
declare @fruitstonefreshcut int;
declare @fruitstoneraw int;
declare @fruitstonecanned int;
declare @fruitpomefrozen int;
declare @fruitpomedried int;
declare @fruitpomefreshcut int;
declare @fruitpomeraw int;
declare @fruitpomecanned int;
declare @fruitmelonfrozen int;
declare @fruitmelondried int;
declare @fruitmelonfreshcut int;
declare @fruitmelonraw int;
declare @fruitmeloncanned int;

declare @fungifresh int;
declare @fungidried int;
declare @fungicanned int;

declare @rootsfresh int;
declare @rootscanned int;
declare @tubersfresh int;
declare @tuberscanned int;
declare @bulbsfresh int;
declare @bulbscanned int;
declare @otherundergroundfresh int;
declare @otherundergroundcanned int;

declare @legumesfresh int;
declare @legumescanned int;
declare @legumesfrozen int;
declare @legumesdried int;
declare @vinegrownfresh int;
declare @vinegrowncanned int;
declare @vinegrownfrozen int;
declare @vinegrowndried int;
declare @solanaceousfresh int;
declare @solanaceouscanned int;
declare @solanaceousfrozen int;
declare @solanaceousdried int;
declare @otherseededfresh int;
declare @otherseededcanned int;
declare @otherseededfrozen int;
declare @otherseededdried int;

declare @herbsfresh int;
declare @herbsdried int;
declare @herbsteas int;

declare @vegrowflowerfresh int;
declare @vegrowflowercanned int;
declare @vegrowflowerfrozen int;
declare @vegrowflowerdried int;
declare @vegrowleafyfresh int;
declare @vegrowleafycanned int;
declare @vegrowleafyfrozen int;
declare @vegrowleafydried int;
declare @vegrowstemfresh int;
declare @vegrowstemcanned int;
declare @vegrowstemfrozen int;
declare @vegrowstemdried int;

declare @grainsflour int;
declare @grainswhole int;
declare @grainsbread int;
declare @grainsdough int;
declare @grainspasta int;
declare @grainscereals int;
declare @grainscakes int;
declare @grainsbiscuitscookies int;

declare @beanswhole int;
declare @beanscanned int;
declare @beansground int;

declare @nutsprocessed int;
declare @nutsunprocessed int;

declare @seedscrushed int;
declare @seedswhole int;
declare @seedspaste int;

SELECT @soliddairyunpasteurized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @soliddairyproducts and f.Name = N'Unpasteurized'
SELECT @soliddairypasteurized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @soliddairyproducts and f.Name = N'Pasteurized'
SELECT @fluidmilkunpasteurized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @fluidmilk and f.Name = N'Unpasteurized'
SELECT @fluidmilkpasteurized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @fluidmilk and f.Name = N'Pasteurized'

SELECT @beefrawprocessed = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @beef and f.Name = N'Raw otherwise processed'
SELECT @beefreadytoeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @beef and f.Name = N'Ready to eat'
SELECT @beefacidified = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beefreadytoeat and f.Name = N'Acidified/fermented'
SELECT @beefdried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beefreadytoeat and f.Name = N'Dried'
SELECT @beefsaltcured = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beefreadytoeat and f.Name = N'Salt-cured'
SELECT @beeffullycooked = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beefreadytoeat and f.Name = N'Fully cooked'
SELECT @beefhotdog = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked and f.Name = N'Hot dog products'
SELECT @beefsaladspread = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked and f.Name = N'Salad/spread/pate'
SELECT @beefotherfullycookedsliced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked and f.Name = N'Other fully-cooked sliced'
SELECT @beefotherfullycookednotsliced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked and f.Name = N'Other fully-cooked not sliced'
SELECT @beefdiced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked and f.Name = N'Diced/shredded'
SELECT @beefpatties = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked and f.Name = N'Patties/nuggets'
SELECT @beefsausage = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked and f.Name = N'Sausage products'
SELECT @beefmeatplusnonmeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked and f.Name = N'Meat + nonmeat multicomponent'
SELECT @beefthermalprocess = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked and f.Name = N'Thermal process/commercial sterile'

-- foods
INSERT INTO Food (FoodGroupId, FoodMajorTypeId, FoodSubtypeId, FoodSubtypeVarietyId, FoodProcessingTypeId, Example) VALUES 
	(@plant, @produce, @vegetables, @vegrootbulbs, NULL, N'fresh onion')
declare @choppedredonion int;
select @choppedredonion = FoodId
from Food f
where f.FoodGroupId = @plant and f.FoodMajorTypeId = @produce and f.FoodSubtypeId = @vegetables and f.FoodSubtypeVarietyId = @vegrootbulbs
INSERT INTO FoodTranslation (LanguageId, FoodId, Name) VALUES (@english, @choppedredonion, N'chopped red onion')

ROLLBACK TRANSACTION