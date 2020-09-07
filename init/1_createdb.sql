BEGIN TRANSACTION 

-- CREATE TABLES
PRINT N'Creating tables' 

CREATE TABLE Language(
    LanguageId int PRIMARY KEY IDENTITY,
    Code char(3),
    --iso 639-2
    Name nvarchar(255)
) 
--ifsac food categorization scheme
CREATE TABLE FoodGroup(
    FoodGroupId int PRIMARY KEY IDENTITY,
    Name nvarchar(255)
) CREATE TABLE FoodMajorType(
    FoodMajorTypeId int PRIMARY KEY IDENTITY,
    FoodGroupId int,
    Name nvarchar(255)
) CREATE TABLE FoodSubtype(
    FoodSubtypeId int PRIMARY KEY IDENTITY,
    FoodMajorTypeId int,
    Name nvarchar(255)
) CREATE TABLE FoodSubtypeVariety(
    FoodSubtypeVarietyId int PRIMARY KEY IDENTITY,
    FoodSubtypeId int null,
    ParentFoodSubtypeVarietyId int null,
    Name nvarchar(255)
) CREATE TABLE FoodProcessingType(
    FoodProcessingTypeId int PRIMARY KEY IDENTITY,
    FoodSubtypeId int null,
    FoodSubtypeVarietyId int null,
    ParentFoodProcessingTypeId int null,
    Name nvarchar(255)
) CREATE TABLE Food(
    FoodId int PRIMARY KEY IDENTITY,
    FoodGroupId int,
    FoodMajorTypeId int,
    FoodSubtypeId int,
    FoodSubtypeVarietyId int,
    FoodProcessingTypeId int,
    Name nvarchar(255)
) CREATE TABLE Time(
    TimeId int PRIMARY KEY IDENTITY,
    Label nvarchar(255),
    Days int,
    Hours int,
    Minutes int,
    Seconds int
) CREATE TABLE Unit(
    UnitId int PRIMARY KEY IDENTITY,
    Singular nvarchar(50),
    Plural nvarchar(50),
    AbbreviationSingle nvarchar(20),
    AbbreviationPlural nvarchar(20)
) CREATE TABLE Ingredient(
    IngredientId int PRIMARY KEY IDENTITY,
    FoodId int,
    UnitId int,
    Amount decimal(10, 2)
) CREATE TABLE Recipe(
    RecipeId int PRIMARY KEY IDENTITY,
    LanguageId int,
    Guid uniqueidentifier,
    PrepTimeId int,
    CookTimeId int,
    TotalTimeId int,
    Description nvarchar(255) NULL,
    Servings int
) CREATE TABLE RecipeStep(
    RecipeStepId int PRIMARY KEY IDENTITY,
    RecipeId int,
    RecipeStepOrder int,
    Description nvarchar(500)
) CREATE TABLE RecipeIngredient(
    RecipeIngredientId int PRIMARY KEY IDENTITY,
    RecipeId int,
    IngredientId int,
    RecipeIngredientOrder int
) 

PRINT N'Tables created' 

-- CREATE CONSTRAINTS
PRINT N'Creating constraints'

ALTER TABLE
    Recipe
ADD
    CONSTRAINT FK_Recipe_LanguageId FOREIGN KEY (LanguageId) REFERENCES Language (LanguageId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Recipe_PrepTimeId FOREIGN KEY(PrepTimeId) REFERENCES Time (TimeId) ON DELETE no action ON UPDATE no action,
    CONSTRAINT FK_Recipe_CookTimeId FOREIGN KEY(CookTimeId) REFERENCES Time (TimeId) ON DELETE no action ON UPDATE no action,
    CONSTRAINT FK_Recipe_TotalTimeId FOREIGN KEY(TotalTimeId) REFERENCES Time (TimeId) ON DELETE no action ON UPDATE no action
ALTER TABLE
    RecipeStep
ADD
    CONSTRAINT FK_RecipeStep_RecipeId FOREIGN KEY (RecipeId) REFERENCES Recipe (RecipeId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    RecipeIngredient
ADD
    CONSTRAINT FK_RecipeIngredient_RecipeId FOREIGN KEY (RecipeId) REFERENCES Recipe (RecipeId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_RecipeIngredient_IngredientId FOREIGN KEY (IngredientId) REFERENCES Ingredient (IngredientId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    Ingredient
ADD
    CONSTRAINT FK_Ingredient_FoodId FOREIGN KEY (FoodId) REFERENCES Food (FoodId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Ingredient_UnitId FOREIGN KEY (UnitId) REFERENCES Unit (UnitId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    Food
ADD
    CONSTRAINT FK_Food_FoodGroupId FOREIGN KEY (FoodGroupId) REFERENCES FoodGroup (FoodGroupId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Food_FoodMajorTypeId FOREIGN KEY (FoodMajorTypeId) REFERENCES FoodMajorType (FoodMajorTypeId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Food_FoodSubtypeId FOREIGN KEY (FoodSubtypeId) REFERENCES FoodSubtype (FoodSubtypeId) On deletE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Food_FoodSubtypeVarietyId FOREIGN KEY (FoodSubtypeVarietyId) REFERENCES FoodSubtypeVariety (FoodSubtypeVarietyId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Food_FoodProcessingTypeId FOREIGN KEY (FoodProcessingTypeId) REFERENCES FoodProcessingType (FoodProcessingTypeId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    FoodMajorType
ADD
    CONSTRAINT FK_FoodMajorType_FoodGroupId FOREIGN KEY (FoodGroupId) REFERENCES FoodGroup (FoodGroupId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    FoodSubtype
ADD 
    CONSTRAINT FK_FoodSubtype_FoodMajorTypeId FOREIGN KEY (FoodMajorTypeId) REFERENCES FoodMajorType (FoodMajorTypeId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    FoodSubtypeVariety
ADD
    CONSTRAINT FK_FoodSubtypeVariety_FoodSubtypeId FOREIGN KEY (FoodSubtypeId) REFERENCES FoodSubtype (FoodSubtypeId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_FoodSubtypeVariety_FoodSubtypeVarietyId FOREIGN KEY (ParentFoodSubtypeVarietyId) REFERENCES FoodSubtypeVariety (FoodSubtypeVarietyId) ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE
    FoodProcessingType
ADD
    CONSTRAINT FK_FoodProcessingType_FoodSubtypeId FOREIGN KEY (FoodSubtypeId) REFERENCES FoodSubtype (FoodSubtypeId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_FoodProcessingType_FoodSubtypeVarietyId FOREIGN KEY (FoodSubtypeVarietyId) REFERENCES FoodSubtypeVariety (FoodSubtypeVarietyId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_FoodProcessingType_FoodProcessingTypeId FOREIGN KEY (ParentFoodProcessingTypeId) REFERENCES FoodProcessingType (FoodProcessingTypeId) ON DELETE NO ACTION ON UPDATE NO ACTION 
    
PRINT N'Constraints created' 

ROLLBACK TRANSACTION