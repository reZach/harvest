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
DECLARE @soliddairyunpasteurized int;
DECLARE @soliddairypasteurized int;
DECLARE @fluidmilkunpasteurized int;
DECLARE @fluidmilkpasteurized int;

DECLARE @beefrawprocessed int;
DECLARE @beefreadytoeat int;
DECLARE @beefacidified int;
DECLARE @beefdried int;
DECLARE @beefsaltcured int;
DECLARE @beeffullycooked int;
DECLARE @beefhotdog int;
DECLARE @beefsaladspread int;
DECLARE @beefotherfullycookedsliced int;
DECLARE @beefotherfullycookednotsliced int;
DECLARE @beefdiced int;
DECLARE @beefpatties int;
DECLARE @beefsausage int;
DECLARE @beefmeatplusnonmeat int;
DECLARE @beefthermalprocess int;

DECLARE @porkrawprocessed int;
DECLARE @porkreadytoeat int;
DECLARE @porkacidified int;
DECLARE @porkdried int;
DECLARE @porksaltcured int;
DECLARE @porkfullycooked int;
DECLARE @porkhotdog int;
DECLARE @porksaladspread int;
DECLARE @porkotherfullycookedsliced int;
DECLARE @porkotherfullycookednotsliced int;
DECLARE @porkdiced int;
DECLARE @porkpatties int;
DECLARE @porksausage int;
DECLARE @porkmeatplusnonmeat int;
DECLARE @porkthermalprocess int;

DECLARE @porkintactraw int;
DECLARE @porknonintactraw int;
DECLARE @porktenderized int;
DECLARE @porkground int;
DECLARE @othermeatintactraw int;
DECLARE @othermeatnonintactraw int;
DECLARE @othermeattenderized int;
DECLARE @othermeatground int;

DECLARE @chickenrawprocessed int;
DECLARE @chickenreadytoeat int;
DECLARE @chickenacidified int;
DECLARE @chickendried int;
DECLARE @chickensaltcured int;
DECLARE @chickenfullycooked int;
DECLARE @chickenhotdog int;
DECLARE @chickensaladspread int;
DECLARE @chickenotherfullycookedsliced int;
DECLARE @chickenotherfullycookednotsliced int;
DECLARE @chickendiced int;
DECLARE @chickenpatties int;
DECLARE @chickensausage int;
DECLARE @chickenmeatplusnonmeat int;
DECLARE @chickenthermalprocess int;

DECLARE @turkeyrawprocessed int;
DECLARE @turkeyreadytoeat int;
DECLARE @turkeyacidified int;
DECLARE @turkeydried int;
DECLARE @turkeysaltcured int;
DECLARE @turkeyfullycooked int;
DECLARE @turkeyhotdog int;
DECLARE @turkeysaladspread int;
DECLARE @turkeyotherfullycookedsliced int;
DECLARE @turkeyotherfullycookednotsliced int;
DECLARE @turkeydiced int;
DECLARE @turkeypatties int;
DECLARE @turkeysausage int;
DECLARE @turkeymeatplusnonmeat int;
DECLARE @turkeythermalprocess int;

DECLARE @turkeyintactraw int;
DECLARE @turkeynonintactraw int;
DECLARE @otherpoultryintactraw int;
DECLARE @otherpoultrynonintactraw int;

DECLARE @shelleggspasteurized int;
DECLARE @shelleggsunpasteurized int;
DECLARE @eggproductssubstitues int;
DECLARE @eggproductscooked int;
DECLARE @eggproductsreadytoeat int;
DECLARE @eggproductsreadytoeatliquidfrozen int;
DECLARE @eggproductsreadytoeatdried int;

DECLARE @fruittropicalfrozen int;
DECLARE @fruittropicaldried int;
DECLARE @fruittropicalfreshcut int;
DECLARE @fruittropicalraw int;
DECLARE @fruittropicalcanned int;
DECLARE @fruitsubtropicalfrozen int;
DECLARE @fruitsubtropicaldried int;
DECLARE @fruitsubtropicalfreshcut int;
DECLARE @fruitsubtropicalraw int;
DECLARE @fruitsubtropicalcanned int;
DECLARE @fruitsmallfrozen int;
DECLARE @fruitsmalldried int;
DECLARE @fruitsmallfreshcut int;
DECLARE @fruitsmallraw int;
DECLARE @fruitsmallcanned int;
DECLARE @fruitstonefrozen int;
DECLARE @fruitstonedried int;
DECLARE @fruitstonefreshcut int;
DECLARE @fruitstoneraw int;
DECLARE @fruitstonecanned int;
DECLARE @fruitpomefrozen int;
DECLARE @fruitpomedried int;
DECLARE @fruitpomefreshcut int;
DECLARE @fruitpomeraw int;
DECLARE @fruitpomecanned int;
DECLARE @fruitmelonfrozen int;
DECLARE @fruitmelondried int;
DECLARE @fruitmelonfreshcut int;
DECLARE @fruitmelonraw int;
DECLARE @fruitmeloncanned int;

DECLARE @fungifresh int;
DECLARE @fungidried int;
DECLARE @fungicanned int;

DECLARE @rootsfresh int;
DECLARE @rootscanned int;
DECLARE @tubersfresh int;
DECLARE @tuberscanned int;
DECLARE @bulbsfresh int;
DECLARE @bulbscanned int;
DECLARE @otherundergroundfresh int;
DECLARE @otherundergroundcanned int;

DECLARE @legumesfresh int;
DECLARE @legumescanned int;
DECLARE @legumesfrozen int;
DECLARE @legumesdried int;
DECLARE @vinegrownfresh int;
DECLARE @vinegrowncanned int;
DECLARE @vinegrownfrozen int;
DECLARE @vinegrowndried int;
DECLARE @solanaceousfresh int;
DECLARE @solanaceouscanned int;
DECLARE @solanaceousfrozen int;
DECLARE @solanaceousdried int;
DECLARE @otherseededfresh int;
DECLARE @otherseededcanned int;
DECLARE @otherseededfrozen int;
DECLARE @otherseededdried int;

DECLARE @herbsfresh int;
DECLARE @herbsdried int;
DECLARE @herbsteas int;

DECLARE @vegrowflowerfresh int;
DECLARE @vegrowflowercanned int;
DECLARE @vegrowflowerfrozen int;
DECLARE @vegrowflowerdried int;
DECLARE @vegrowleafyfresh int;
DECLARE @vegrowleafycanned int;
DECLARE @vegrowleafyfrozen int;
DECLARE @vegrowleafydried int;
DECLARE @vegrowstemfresh int;
DECLARE @vegrowstemcanned int;
DECLARE @vegrowstemfrozen int;
DECLARE @vegrowstemdried int;

DECLARE @grainsground int;
DECLARE @grainsflour int;
DECLARE @grainsflourbased int;
DECLARE @grainswhole int;
DECLARE @grainsbread int;
DECLARE @grainsdough int;
DECLARE @grainspasta int;
DECLARE @grainscereals int;
DECLARE @grainscakes int;
DECLARE @grainsbiscuitscookies int;

DECLARE @beanswhole int;
DECLARE @beanscanned int;
DECLARE @beansground int;

DECLARE @nutsprocessed int;
DECLARE @nutsunprocessed int;

DECLARE @seedscrushed int;
DECLARE @seedswhole int;
DECLARE @seedspaste int;

SELECT @soliddairyunpasteurized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @soliddairyproducts AND f.Name = N'Unpasteurized'
SELECT @soliddairypasteurized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @soliddairyproducts AND f.Name = N'Pasteurized'
SELECT @fluidmilkunpasteurized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @fluidmilk AND f.Name = N'Unpasteurized'
SELECT @fluidmilkpasteurized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @fluidmilk AND f.Name = N'Pasteurized'

SELECT @beefrawprocessed = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @beef AND f.Name = N'Raw otherwise processed'
SELECT @beefreadytoeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @beef AND f.Name = N'Ready TO eat'
SELECT @beefacidified = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beefreadytoeat AND f.Name = N'Acidified/fermented'
SELECT @beefdried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beefreadytoeat AND f.Name = N'Dried'
SELECT @beefsaltcured = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beefreadytoeat AND f.Name = N'Salt-cured'
SELECT @beeffullycooked = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beefreadytoeat AND f.Name = N'Fully cooked'
SELECT @beefhotdog = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked AND f.Name = N'Hot dog products'
SELECT @beefsaladspread = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked AND f.Name = N'Salad/spread/pate'
SELECT @beefotherfullycookedsliced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked AND f.Name = N'Other fully-cooked sliced'
SELECT @beefotherfullycookednotsliced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked AND f.Name = N'Other fully-cooked NOT sliced'
SELECT @beefdiced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked AND f.Name = N'Diced/shredded'
SELECT @beefpatties = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked AND f.Name = N'Patties/nuggets'
SELECT @beefsausage = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked AND f.Name = N'Sausage products'
SELECT @beefmeatplusnonmeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked AND f.Name = N'Meat + nonmeat multicomponent'
SELECT @beefthermalprocess = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @beeffullycooked AND f.Name = N'Thermal process/commercial sterile'

SELECT @porkrawprocessed = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @pork AND f.Name = N'Raw otherwise processed'
SELECT @porkreadytoeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @pork AND f.Name = N'Ready TO eat'
SELECT @porkacidified = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkreadytoeat AND f.Name = N'Acidified/fermented'
SELECT @porkdried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkreadytoeat AND f.Name = N'Dried'
SELECT @porksaltcured = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkreadytoeat AND f.Name = N'Salt-cured'
SELECT @porkfullycooked = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkreadytoeat AND f.Name = N'Fully cooked'
SELECT @porkhotdog = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkfullycooked AND f.Name = N'Hot dog products'
SELECT @porksaladspread = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkfullycooked AND f.Name = N'Salad/spread/pate'
SELECT @porkotherfullycookedsliced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkfullycooked AND f.Name = N'Other fully-cooked sliced'
SELECT @porkotherfullycookednotsliced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkfullycooked AND f.Name = N'Other fully-cooked NOT sliced'
SELECT @porkdiced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkfullycooked AND f.Name = N'Diced/shredded'
SELECT @porkpatties = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkfullycooked AND f.Name = N'Patties/nuggets'
SELECT @porksausage = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkfullycooked AND f.Name = N'Sausage products'
SELECT @porkmeatplusnonmeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkfullycooked AND f.Name = N'Meat + nonmeat multicomponent'
SELECT @porkthermalprocess = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porkfullycooked AND f.Name = N'Thermal process/commercial sterile'

SELECT @porkintactraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @pork AND f.Name = N'Intact raw'
SELECT @porknonintactraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @pork AND f.Name = N'Non-intact raw'
SELECT @porktenderized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porknonintactraw AND f.Name = N'Tenderized/injected meat'
SELECT @porkground = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @porknonintactraw AND f.Name = N'Ground meat'

SELECT @othermeatintactraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @othermeat AND f.Name = N'Intact raw'
SELECT @othermeatnonintactraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @othermeat AND f.Name = N'Non-intact raw'
SELECT @othermeattenderized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @othermeatnonintactraw AND f.Name = N'Tenderized/injected meat'
SELECT @othermeatground = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @othermeatnonintactraw AND f.Name = N'Ground meat'

SELECT @chickenrawprocessed = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @chicken AND f.Name = N'Raw otherwise processed'
SELECT @chickenreadytoeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @chicken AND f.Name = N'Ready TO eat'
SELECT @chickenacidified = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenreadytoeat AND f.Name = N'Acidified/fermented'
SELECT @chickendried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenreadytoeat AND f.Name = N'Dried'
SELECT @chickensaltcured = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenreadytoeat AND f.Name = N'Salt-cured'
SELECT @chickenfullycooked = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenreadytoeat AND f.Name = N'Fully cooked'
SELECT @chickenhotdog = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenfullycooked AND f.Name = N'Hot dog products'
SELECT @chickensaladspread = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenfullycooked AND f.Name = N'Salad/spread/pate'
SELECT @chickenotherfullycookedsliced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenfullycooked AND f.Name = N'Other fully-cooked sliced'
SELECT @chickenotherfullycookednotsliced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenfullycooked AND f.Name = N'Other fully-cooked NOT sliced'
SELECT @chickendiced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenfullycooked AND f.Name = N'Diced/shredded'
SELECT @chickenpatties = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenfullycooked AND f.Name = N'Patties/nuggets'
SELECT @chickensausage = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenfullycooked AND f.Name = N'Sausage products'
SELECT @chickenmeatplusnonmeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenfullycooked AND f.Name = N'Meat + nonmeat multicomponent'
SELECT @chickenthermalprocess = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @chickenfullycooked AND f.Name = N'Thermal process/commercial sterile'

SELECT @turkeyrawprocessed = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @turkey AND f.Name = N'Raw otherwise processed'
SELECT @turkeyreadytoeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @turkey AND f.Name = N'Ready TO eat'
SELECT @turkeyacidified = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyreadytoeat AND f.Name = N'Acidified/fermented'
SELECT @turkeydried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyreadytoeat AND f.Name = N'Dried'
SELECT @turkeysaltcured = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyreadytoeat AND f.Name = N'Salt-cured'
SELECT @turkeyfullycooked = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyreadytoeat AND f.Name = N'Fully cooked'
SELECT @turkeyhotdog = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyfullycooked AND f.Name = N'Hot dog products'
SELECT @turkeysaladspread = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyfullycooked AND f.Name = N'Salad/spread/pate'
SELECT @turkeyotherfullycookedsliced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyfullycooked AND f.Name = N'Other fully-cooked sliced'
SELECT @turkeyotherfullycookednotsliced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyfullycooked AND f.Name = N'Other fully-cooked NOT sliced'
SELECT @turkeydiced = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyfullycooked AND f.Name = N'Diced/shredded'
SELECT @turkeypatties = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyfullycooked AND f.Name = N'Patties/nuggets'
SELECT @turkeysausage = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyfullycooked AND f.Name = N'Sausage products'
SELECT @turkeymeatplusnonmeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyfullycooked AND f.Name = N'Meat + nonmeat multicomponent'
SELECT @turkeythermalprocess = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @turkeyfullycooked AND f.Name = N'Thermal process/commercial sterile'

SELECT @turkeyintactraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @turkey AND f.Name = N'Intact raw'
SELECT @turkeynonintactraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @turkey AND f.Name = N'Non-intact raw'

SELECT @otherpoultryintactraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @otherpoultry AND f.Name = N'Intact raw'
SELECT @otherpoultrynonintactraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @otherpoultry AND f.Name = N'Non-intact raw'

SELECT @shelleggspasteurized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @shelleggs AND f.Name = N'Pasteurized'
SELECT @shelleggsunpasteurized = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @eggproducts AND f.Name = N'Unpasteurized'

SELECT @eggproductssubstitues = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @shelleggs AND f.Name = N'Egg substitues'
SELECT @eggproductscooked = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @shelleggs AND f.Name = N'Cooked egg products'
SELECT @eggproductsreadytoeat = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @shelleggs AND f.Name = N'Ready TO eat egg products'
SELECT @eggproductsreadytoeatliquidfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @eggproductsreadytoeat AND f.Name = N'Liquid OR frozen'
SELECT @eggproductsreadytoeatdried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @eggproductsreadytoeat AND f.Name = N'Dried'

SELECT @fruittropicalfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruittropical AND f.Name = N'Frozen'
SELECT @fruittropicaldried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruittropical AND f.Name = N'Dried'
SELECT @fruittropicalfreshcut = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruittropical AND f.Name = N'Fresh-cut'
SELECT @fruittropicalraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruittropical AND f.Name = N'Raw'
SELECT @fruittropicalcanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruittropical AND f.Name = N'Canned/containerized'
SELECT @fruitsubtropicalfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitsubtropical AND f.Name = N'Frozen'
SELECT @fruitsubtropicaldried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitsubtropical AND f.Name = N'Dried'
SELECT @fruitsubtropicalfreshcut = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitsubtropical AND f.Name = N'Fresh-cut'
SELECT @fruitsubtropicalraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitsubtropical AND f.Name = N'Raw'
SELECT @fruitsubtropicalcanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitsubtropical AND f.Name = N'Canned/containerized'
SELECT @fruitsmallfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitsmall AND f.Name = N'Frozen'
SELECT @fruitsmalldried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitsmall AND f.Name = N'Dried'
SELECT @fruitsmallfreshcut = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitsmall AND f.Name = N'Fresh-cut'
SELECT @fruitsmallraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitsmall AND f.Name = N'Raw'
SELECT @fruitsmallcanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitsmall AND f.Name = N'Canned/containerized'
SELECT @fruitstonefrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitstone AND f.Name = N'Frozen'
SELECT @fruitstonedried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitstone AND f.Name = N'Dried'
SELECT @fruitstonefreshcut = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitstone AND f.Name = N'Fresh-cut'
SELECT @fruitstoneraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitstone AND f.Name = N'Raw'
SELECT @fruitstonecanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitstone AND f.Name = N'Canned/containerized'
SELECT @fruitpomefrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitpome AND f.Name = N'Frozen'
SELECT @fruitpomedried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitpome AND f.Name = N'Dried'
SELECT @fruitpomefreshcut = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitpome AND f.Name = N'Fresh-cut'
SELECT @fruitpomeraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitpome AND f.Name = N'Raw'
SELECT @fruitpomecanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitpome AND f.Name = N'Canned/containerized'
SELECT @fruitmelonfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitmelon AND f.Name = N'Frozen'
SELECT @fruitmelondried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitmelon AND f.Name = N'Dried'
SELECT @fruitmelonfreshcut = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitmelon AND f.Name = N'Fresh-cut'
SELECT @fruitmelonraw = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitmelon AND f.Name = N'Raw'
SELECT @fruitmeloncanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @fruitmelon AND f.Name = N'Canned/containerized'

SELECT @fungifresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegfungi AND f.Name = N'Fresh'
SELECT @fungidried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegfungi AND f.Name = N'Dried'
SELECT @fungicanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegfungi AND f.Name = N'Canned/containerized'

SELECT @rootsfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrootroots AND f.Name = N'Fresh'
SELECT @rootscanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrootroots AND f.Name = N'Canned/containerized'
SELECT @tubersfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegroottubers AND f.Name = N'Fresh'
SELECT @tuberscanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegroottubers AND f.Name = N'Canned/containerized'
SELECT @bulbsfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrootbulbs AND f.Name = N'Fresh'
SELECT @bulbscanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrootbulbs AND f.Name = N'Canned/containerized'
SELECT @otherundergroundfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrootother AND f.Name = N'Fresh'
SELECT @otherundergroundcanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrootother AND f.Name = N'Canned/containerized'

SELECT @legumesfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededlegumes AND f.Name = N'Fresh'
SELECT @legumescanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededlegumes AND f.Name = N'Canned/containerized'
SELECT @legumesfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededlegumes AND f.Name = N'Frozen'
SELECT @legumesdried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededlegumes AND f.Name = N'Dried'
SELECT @vinegrownfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededvine AND f.Name = N'Fresh'
SELECT @vinegrowncanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededvine AND f.Name = N'Canned/containerized'
SELECT @vinegrownfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededvine AND f.Name = N'Frozen'
SELECT @vinegrowndried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededvine AND f.Name = N'Dried'
SELECT @solanaceousfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededsolanaceous AND f.Name = N'Fresh'
SELECT @solanaceouscanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededsolanaceous AND f.Name = N'Canned/containerized'
SELECT @solanaceousfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededsolanaceous AND f.Name = N'Frozen'
SELECT @solanaceousdried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededsolanaceous AND f.Name = N'Dried'
SELECT @otherseededfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededother AND f.Name = N'Fresh'
SELECT @otherseededcanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededother AND f.Name = N'Canned/containerized'
SELECT @otherseededfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededother AND f.Name = N'Frozen'
SELECT @otherseededdried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegseededother AND f.Name = N'Dried'

SELECT @herbsfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegherbs AND f.Name = N'Fresh herbs'
SELECT @herbsdried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegherbs AND f.Name = N'Dried herbs'
SELECT @herbsteas = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegherbs AND f.Name = N'Teas'

SELECT @vegrowflowerfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsflower AND f.Name = N'Fresh'
SELECT @vegrowflowercanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsflower AND f.Name = N'Canned/containerized'
SELECT @vegrowflowerfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsflower AND f.Name = N'Frozen'
SELECT @vegrowflowerdried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsflower AND f.Name = N'Dried'
SELECT @vegrowleafyfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsleafy AND f.Name = N'Fresh'
SELECT @vegrowleafycanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsleafy AND f.Name = N'Canned/containerized'
SELECT @vegrowleafyfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsleafy AND f.Name = N'Frozen'
SELECT @vegrowleafydried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsleafy AND f.Name = N'Dried'
SELECT @vegrowstemfresh = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsstem AND f.Name = N'Fresh'
SELECT @vegrowstemcanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsstem AND f.Name = N'Canned/containerized'
SELECT @vegrowstemfrozen = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsstem AND f.Name = N'Frozen'
SELECT @vegrowstemdried = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeVarietyId = @vegrowcropsstem AND f.Name = N'Dried'

SELECT @grainsground = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @grains AND f.Name = N'Ground'
SELECT @grainswhole = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @grains AND f.Name = N'Whole'
SELECT @grainsflour = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @grainsground AND f.Name = N'Flour'
SELECT @grainsflourbased = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @grainsground AND f.Name = N'Flour-based product'
SELECT @grainsbread = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @grainsflourbased AND f.Name = N'Breads'
SELECT @grainsdough = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @grainsflourbased AND f.Name = N'Doughs'
SELECT @grainspasta = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @grainsflourbased AND f.Name = N'Pastas'
SELECT @grainscereals = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @grainsflourbased AND f.Name = N'Prepared cereals'
SELECT @grainscakes = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @grainsflourbased AND f.Name = N'Cakes'
SELECT @grainsbiscuitscookies = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodProcessingTypeId = @grainsflourbased AND f.Name = N'Biscuits/cookies/wafers'

SELECT @beanswhole = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @beans AND f.Name = N'Whole, dried'
SELECT @beanscanned = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @beans AND f.Name = N'Canned/containerized'
SELECT @beansground = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @beans AND f.Name = N'Ground, flour'

SELECT @nutsprocessed = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @nuts AND f.Name = N'Processed'
SELECT @nutsunprocessed = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @nuts AND f.Name = N'Unprocessed'

SELECT @seedscrushed = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @seeds AND f.Name = N'Crushed/cracked/ground'
SELECT @seedswhole = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @seeds AND f.Name = N'Whole, dried'
SELECT @seedspaste = FoodProcessingTypeId
FROM FoodProcessingType f
WHERE f.FoodSubtypeId = @seeds AND f.Name = N'Paste'

-- foods
INSERT INTO Food (FoodGroupId, FoodMajorTypeId, FoodSubtypeId, FoodSubtypeVarietyId, FoodProcessingTypeId, Example) VALUES 
	(@plant, @produce, @vegetables, @vegrootbulbs, @bulbsfresh, N'fresh onion')
DECLARE @onion int;
SELECT @onion = FoodId
FROM Food f
WHERE f.FoodGroupId = @plant AND f.FoodMajorTypeId = @produce AND f.FoodSubtypeId = @vegetables AND f.FoodSubtypeVarietyId = @vegrootbulbs and f.FoodProcessingTypeId = @bulbsfresh
INSERT INTO FoodTranslation (LanguageId, FoodId, Name) VALUES 
(@english, @onion, N'yellow onion'),
(@english, @onion, N'sweet onion'),
(@english, @onion, N'red onion'),
(@english, @onion, N'white onion'),
(@english, @onion, N'shallot'),

ROLLBACK TRANSACTION