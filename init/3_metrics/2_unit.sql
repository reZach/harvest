BEGIN TRANSACTION

DECLARE @english int;

SELECT @english = LanguageId
FROM Language l
WHERE l.Code = N'eng'

INSERT INTO Unit (LanguageId, Singular, Plural, AbbreviationSingle, AbbreviationPlural, MetricSystem)
	VALUES 
	(@english, N'', N'', N'', N'', 0), 
	(@english, N'pound', N'pounds', N'lb.', N'lbs.', 0), 
	(@english, N'ounce', N'ounces', N'oz.', N'oz.', 0), 
	(@english, N'pint', N'pints', N'pt.', N'pts.', 0), 
	(@english, N'cup', N'cups', N'c.', N'c.', 0), 
	(@english, N'tablespoon', N'tablespoons', N'tbsp.', N'tbsps.', 0), 
	(@english, N'teaspoon', N'teaspoons', N'tsp.', N'tsps.', 0)

DECLARE @nounit int;
DECLARE @pound int;
DECLARE @ounce int;
DECLARE @pint int;
DECLARE @cup int;
DECLARE @tablespoon int;
DECLARE @teaspoon int;

SELECT @nounit = UnitId
FROM Unit u
WHERE u.Singular = N''
SELECT @pound = UnitId
FROM Unit u
WHERE u.Singular = N'pound'
SELECT @ounce = UnitId
FROM Unit u
WHERE u.Singular = N'ounce'
SELECT @pint = UnitId
FROM Unit u
WHERE u.Singular = N'pint'
SELECT @cup = UnitId
FROM Unit u
WHERE u.Singular = N'cup'
SELECT @tablespoon = UnitId
FROM Unit u
WHERE u.Singular = N'tablespoon'
SELECT @teaspoon = UnitId
FROM Unit u
WHERE u.Singular = N'teaspoon'

INSERT INTO Measurement (UnitId, Amount, AmountMax)
VALUES 
	(@nounit, 0.5, null),	
	(@nounit, 1, null),
	(@nounit, 2, null),
	(@nounit, 3, null),
	(@nounit, 4, null),
	(@nounit, 5, null),
	(@nounit, 6, null),
	(@nounit, 7, null),
	(@nounit, 8, null),
	(@tablespoon, 1, null),
	(@tablespoon, 2, null),

INSERT INTO Size(Name)
	VALUES
	(N'small'),
	(N'medium'),
	(N'large'),
	(N'thin'),
	(N'average'),
	(N'thick')

ROLLBACK TRANSACTION