BEGIN TRANSACTION 

-- CREATE TABLES
PRINT N'Creating tables' 

CREATE TABLE Language(
    LanguageId int PRIMARY KEY IDENTITY,
    Code nvarchar(3),
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
    FoodSubtypeId int NULL,
    ParentFoodSubtypeVarietyId int NULL,
    Name nvarchar(255)
) CREATE TABLE FoodProcessingType(
    FoodProcessingTypeId int PRIMARY KEY IDENTITY,
    FoodSubtypeId int NULL,
    FoodSubtypeVarietyId int NULL,
    ParentFoodProcessingTypeId int NULL,
    Name nvarchar(255)
) CREATE TABLE Food(
    FoodId int PRIMARY KEY IDENTITY,
    FoodGroupId int,
    FoodMajorTypeId int NULL,
    FoodSubtypeId int NULL,
    FoodSubtypeVarietyId int NULL,
    FoodProcessingTypeId int NULL,
    SizeId int null,
    Variant nvarchar(255) null,
    Example nvarchar(255) null
) CREATE TABLE FoodTranslation (
    FoodTranslationId int PRIMARY KEY IDENTITY,
    LanguageId int,
    FoodId int,
    Name nvarchar(255)
) CREATE TABLE Size (
    SizeId int primary key identity,
    Name nvarchar(75)
) CREATE TABLE Time(
    TimeId int PRIMARY KEY IDENTITY,
    Days int,
    Hours int,
    Minutes int,
    Seconds int
) CREATE TABLE Unit(
    UnitId int PRIMARY KEY IDENTITY,
    LanguageId int,
    Singular nvarchar(50),
    Plural nvarchar(50),
    AbbreviationSingle nvarchar(20),
    AbbreviationPlural nvarchar(20),
    MetricSystem BIT
) CREATE TABLE Measurement (
    MeasurementId int PRIMARY KEY IDENTITY,
    UnitId int,
    Amount decimal(10, 2) NULL,
    AmountMax decimal(10, 2) NULL
) CREATE TABLE Ingredient(
    IngredientId int PRIMARY KEY IDENTITY,
    FoodId int,
    MeasurementId int,
    Optional bit
) CREATE TABLE Recipe(
    RecipeId int PRIMARY KEY IDENTITY,
    LanguageId int,
    Guid uniqueidentifier,
    PrepTimeId int,
    CookTimeId int,
    TotalTimeId int,
    Title nvarchar(255) NULL,
    Servings int
) CREATE TABLE RecipeSubcomponent (
    RecipeSubcomponentId int PRIMARY KEY IDENTITY,
    Name nvarchar(100),
    RecipeSubcomponentOrder int
) CREATE TABLE RecipeStep(
    RecipeStepId int PRIMARY KEY IDENTITY,
    RecipeId int,
    RecipeStepOrder int,
    Description nvarchar(500)
) CREATE TABLE RecipeIngredient(
    RecipeIngredientId int PRIMARY KEY IDENTITY,
    RecipeId int,
    IngredientId int,
    RecipeSubcomponentId int NULL,
    RecipeIngredientOrder int
) CREATE TABLE Brand(
    BrandId int PRIMARY KEY IDENTITY,
    Name nvarchar(100)
) CREATE TABLE FoodBrand(
    FoodBrandId int PRIMARY KEY IDENTITY,
    FoodId int,
    BrandId int,
    UnitId int,
    Amount decimal(10, 2)
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
    CONSTRAINT FK_RecipeIngredient_IngredientId FOREIGN KEY (IngredientId) REFERENCES Ingredient (IngredientId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_RecipeIngredient_RecipeSubcomponentId FOREIGN KEY (RecipeSubcomponentId) REFERENCES RecipeSubcomponent (RecipeSubcomponentId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    Unit
ADD
    CONSTRAINT FK_Unit_LanguageId FOREIGN KEY (LanguageId) REFERENCES Language (LanguageId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    Measurement
ADD
    CONSTRAINT FK_Measurement_UnitId FOREIGN KEY (UnitId) REFERENCES Unit (UnitId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    Ingredient
ADD
    CONSTRAINT FK_Ingredient_FoodId FOREIGN KEY (FoodId) REFERENCES Food (FoodId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Ingredient_MeasurementId FOREIGN KEY (MeasurementId) REFERENCES Measurement (MeasurementId) ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE
    Food
ADD
    CONSTRAINT FK_Food_FoodGroupId FOREIGN KEY (FoodGroupId) REFERENCES FoodGroup (FoodGroupId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Food_FoodMajorTypeId FOREIGN KEY (FoodMajorTypeId) REFERENCES FoodMajorType (FoodMajorTypeId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Food_FoodSubtypeId FOREIGN KEY (FoodSubtypeId) REFERENCES FoodSubtype (FoodSubtypeId) On deletE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Food_FoodSubtypeVarietyId FOREIGN KEY (FoodSubtypeVarietyId) REFERENCES FoodSubtypeVariety (FoodSubtypeVarietyId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Food_FoodProcessingTypeId FOREIGN KEY (FoodProcessingTypeId) REFERENCES FoodProcessingType (FoodProcessingTypeId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Food_SizeId FOREIGN KEY (SizeId) REFERENCES Size (SizeId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    FoodTranslation
ADD
    CONSTRAINT FK_FoodTranslation_LanguageId FOREIGN KEY (LanguageId) REFERENCES Language (LanguageId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_FoodTranslation_FoodId FOREIGN KEY (FoodId) REFERENCES Food (FoodId) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
    FoodMajorType
ADD
    CONSTRAINT FK_FoodMajorType_FoodGroupId FOREIGN KEY (FoodGroupId) REFERENCES FoodGroup (FoodGroupId) ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE
    FoodSubtype
ADD 
    CONSTRAINT FK_FoodSubtype_FoodMajorTypeId FOREIGN KEY (FoodMajorTypeId) REFERENCES FoodMajorType (FoodMajorTypeId) ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE
    FoodSubtypeVariety
ADD
    CONSTRAINT FK_FoodSubtypeVariety_FoodSubtypeId FOREIGN KEY (FoodSubtypeId) REFERENCES FoodSubtype (FoodSubtypeId) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_FoodSubtypeVariety_FoodSubtypeVarietyId FOREIGN KEY (ParentFoodSubtypeVarietyId) REFERENCES FoodSubtypeVariety (FoodSubtypeVarietyId) ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE
    FoodProcessingType
ADD
    CONSTRAINT FK_FoodProcessingType_FoodSubtypeId FOREIGN KEY (FoodSubtypeId) REFERENCES FoodSubtype (FoodSubtypeId) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_FoodProcessingType_FoodSubtypeVarietyId FOREIGN KEY (FoodSubtypeVarietyId) REFERENCES FoodSubtypeVariety (FoodSubtypeVarietyId) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_FoodProcessingType_FoodProcessingTypeId FOREIGN KEY (ParentFoodProcessingTypeId) REFERENCES FoodProcessingType (FoodProcessingTypeId) ON DELETE NO ACTION ON UPDATE NO ACTION 
ALTER TABLE
    FoodBrand
ADD
    CONSTRAINT FK_FoodBrand_FoodId FOREIGN KEY (FoodId) REFERENCES Food (FoodId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_FoodBrand_BrandId FOREIGN KEY (BrandId) REFERENCES Brand (BrandId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_FoodBrand_UnitId FOREIGN KEY (UnitId) REFERENCES Unit (UnitId) ON DELETE CASCADE ON UPDATE CASCADE

PRINT N'Constraints created' 

ROLLBACK TRANSACTION