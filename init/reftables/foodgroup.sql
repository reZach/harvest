begin transaction 

insert into FoodGroup (Name)
	values (N'Aquatic animals'), (N'Land animals'), (N'Plants'), (N'Other');

rollback transaction