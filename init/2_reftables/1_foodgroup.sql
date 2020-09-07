BEGIN TRANSACTION 

INSERT INTO FoodGroup (Name)
	VALUES (N'Aquatic animals'), (N'Land animals'), (N'Plants'), (N'Other');

ROLLBACK TRANSACTION