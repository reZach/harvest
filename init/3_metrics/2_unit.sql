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

ROLLBACK TRANSACTION