-- https://www.foodnetwork.com/recipes/food-network-kitchen/cheddar-and-apple-grilled-cheese-sandwiches-5496992

--languages
DECLARE @english int;

SELECT @english = LanguageId
FROM Language l
WHERE l.Code = N'eng'

--time
DECLARE @fivet int;
DECLARE @tent int;
DECLARE @fifteent int;

SELECT @fivetime = TimeId
FROM Time t
WHERE t.Days = 0 and t.Hours = 0 and t.Minutes = 5 and t.Seconds = 0
SELECT @tentime = TimeId
FROM Time t
WHERE t.Days = 0 and t.Hours = 0 and t.Minutes = 10 and t.Seconds = 0
SELECT @fifteentime = TimeId
FROM Time t
WHERE t.Days = 0 and t.Hours = 0 and t.Minutes = 15 and t.Seconds = 0

--size
DECLARE @small int;
DECLARE @medium int;
DECLARE @large int;
DECLARE @thin int;
DECLARE @average int;
DECLARE @thick int;

SELECT @small = SizeId
FROM Size s
WHERE s.Name = N'small'
SELECT @medium = SizeId
FROM Size s
WHERE s.Name = N'medium'
SELECT @large = SizeId
FROM Size s
WHERE s.Name = N'large'
SELECT @thin = SizeId
FROM Size s
WHERE s.Name = N'thin'
SELECT @average = SizeId
FROM Size s
WHERE s.Name = N'average'
SELECT @thick = SizeId
FROM Size s
WHERE s.Name = N'thick'

insert into Recipe (LanguageId, Guid, PrepTimeId, CookTimeId, TotalTimeId, Title, Servings)
values (@english, NEWID(), @fivetime, @tentime, @fifteentime, N'Cheddar and apple grilled cheese sandwiches', 2)

DECLARE @recipeid int;

SELECT @recipeid = MAX(RecipeId)
FROM Recipe

--foods
DECLARE @slicedsourdough int;
DECLARE @slicedsharpcheddar int;
DECLARE @thinslicedapple int;
DECLARE @unsaltedbutter int;

SELECT @slicedsourdough = FoodId
FROM Food f
WHERE f.Variant = N'sourdough' and f.Example = N'sliced fresh bread'
SELECT @slicedsharpcheddar = FoodId
FROM Food f
WHERE f.SizeId = @average and f.Variant = N'sharp cheddar' and f.Example = N'sliced cheese'
SELECT @thinslicedapple = FoodId
FROM Food f
WHERE f.SizeId = @thin and f.Variant = null and f.Example = N'sliced apple'
SELECT @unsaltedbutter = FoodId
FROM Food f
WHERE f.Variant = N'unsalted' and f.Example = N'butter'

--unit
DECLARE @nounit int;
DECLARE @tablespoon int;

SELECT @nounit = UnitId
FROM Unit u
WHERE u.Singular = N''
SELECT @tablespoon = UnitId
FROM Unit u
WHERE u.Singular = N'tablespoon'

--measurement
DECLARE @four int;
DECLARE @six int;
DECLARE @half int;
DECLARE @two int;

SELECT @four = MeasurementId
FROM Measurement m
WHERE m.UnitId = @nounit and m.Amount = 4
SELECT @six = MeasurementId
FROM Measurement m
WHERE m.UnitId = @nounit and m.Amount = 6
SELECT @half = MeasurementId
FROM Measurement m
WHERE m.UnitId = @nounit and m.Amount = 0.5
SELECT @two = MeasurementId
FROM Measurement m
WHERE m.UnitId = @tablespoon and m.Amount = 2

--ingredients
insert into Ingredient (FoodId, MeasurementId, Optional)
values (@slicedsourdough, @four, 0),
(@slicedsharpcheddar, @six, 0),
(@thinslicedapple, @half, 0),
(@unsaltedbutter, @two, 0)

DECLARE @sourdoughfour int;
DECLARE @slicedsharpcheddarsix int;
DECLARE @thinslicedapplehalf int;
DECLARE @unsaltedbuttertwo int;

select @sourdoughfour = IngredientId
FROM Ingredient i
WHERE i.FoodId = @slicedsourdough and i.MeasurementId = @four and i.Optional = 0
select @slicedsharpcheddarsix = IngredientId
FROM Ingredient i
WHERE i.FoodId = @slicedsharpcheddar and i.MeasurementId = @six and i.Optional = 0
select @thinslicedapplehalf = IngredientId
FROM Ingredient i
WHERE i.FoodId = @thinslicedapple and i.MeasurementId = @half and i.Optional = 0
select @unsaltedbuttertwo = IngredientId
FROM Ingredient i
WHERE i.FoodId = @unsaltedbutter and i.MeasurementId = @two and i.Optional = 0

--recipe ingredient
insert into RecipeIngredient (RecipeId, IngredientId, RecipeSubcomponentId, RecipeIngredientOrder)
values (@recipeid, @sourdoughfour, null, 1),
    (@recipeid, @slicedsharpcheddarsix, null, 2),
    (@recipeid, @thinslicedapplehalf, null, 3),
    (@recipeid, @unsaltedbuttertwo, null, 4)

--recipe step
insert into RecipeStep (RecipeId, RecipeStepOrder, Description)
values (@recipeid, 1, N'Put 2 slices of bread on a cutting board or work surface. Top each with two slices of cheese, the apple slices, a third slice of cheese and another piece of bread. Press down lightly.'),
(@recipeid, 2, N'Heat 1 tablespoon butter in a large skillet over medium-low heat. Add the sandwiches and cook until the bread toasts and the cheese is slightly melted, 3 to 5 minutes. Flip with a spatula and add the remaining tablespoon of butter to the pan. Cook until the other side is toasted and the cheese is melted, about 3 minutes more. You may need to lower the heat to prevent the bread from burning before the cheese melts.')