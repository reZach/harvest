begin transaction

INSERT INTO Time (Days, Hours, Minutes, Seconds)
	VALUES (0, 0, 5, 0),
    (0, 0, 10, 0),
    (0, 0, 15, 0),
    (0, 0, 20, 0),
    (0, 0, 25, 0),
    (0, 0, 30, 0),
    (0, 0, 35, 0),
    (0, 0, 40, 0),
    (0, 0, 45, 0),
    (0, 0, 50, 0),
    (0, 0, 55, 0),
    (0, 1, 0, 0)

rollback transaction