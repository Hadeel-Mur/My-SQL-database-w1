USE userdb:
// ENTITIES
// 1- recipe
// 2- category
// 3- ingredients
// 4- steps

// recipe table: 1-recipe id, 2- name, 3- steps, 4- category id
// category table: 1- category id, 2- name
// ingredients table: 1- ingredient id, 2- name
// steps table: 1- step id, 2- description 3- recipe id


CREATE TABLE Recipe (
   recipeId       integer           NOT null,
   name           Char(255)         NOT null,
   steps          text              NOT null,
   categoryId     integer           NOT null,
   CONSTRAINT     recPK             PRIMARY KEY(recipeId),
   CONSTRAINT     categoryIdFK      FOREIGN KEY  REFERENCES  Category(categoryId)
);

CREATE TABLE Category (
    categoryId     integer           NOT null,
    name           Char(255)         NOT null
);

CREATE TABLE Ingredients (
    ingredientId   integer           NOT null,
    name           Char(255)         NOT null
);

CREATE TABLE Recipe_Ingredients (
    recipeId       integer           NOT null,
    ingredientId   integer           NOT null,
    CONSTRAINT     recipeIdFK        FOREIGN KEY  REFERENCES  Recipe(recipeId),
    CONSTRAINT     ingredientIdFK    FOREIGN KEY  REFERENCES  ingredients(ingredientId),
    CONSTRAINT     (recipeIdPK, ingredientIdPK )  PRIMARY KEY(recipeId, ingredientId),
);

CREATE TABLE Steps (
    steptId        integer           NOT null,
    description    TEXT              NOT null,
    CONSTRAINT     stepPK            PRIMARY KEY(stepId),
    CONSTRAINT     recipeIdFK        FOREIGN KEY  REFERENCES  Recipe(recipeId)
);

1- Where can you add a primary key?
each table

2- Which tables should be linked with a foreign key?
(Recipe, Category), (Recipe_Ingredients, Recipe), (Recipe_Ingredients, Ingredients), (Steps, Recipe)

3- What type of relationships do you see between the tables?
(Recipe, Category) one to many
(Recipe_Ingredients, Recipe) many to many
(Recipe_Ingredients, Ingredients) many to many
(Recipe, Steps) one to many


- Can you make queries to get:
  - All the vegetarian recipes with potatoes
  - All the cakes that do not need baking
  - All the vegan and Japanese recipes

1-
SELECT r.name
FROM Recipe r
JOIN Recipe_Ingredients ri on r.recipeId = ri.recipeId
JOIN Ingredients i on r.ingredientId = i.ingredientId
JOIN Category c on r.categoryId = c.categoryId
WHERE c.name = 'vegetarian' AND i.name = 'potato'

2-
SELECT r.name
FROM Recipe r
JOIN Category c on r.categoryId = c.categoryId
JOIN Steps s on r.recipeId = s.recipeId
WHERE s.name = 'cake' AND s.description NOT LIKE 'bake'

3-
SELECT r.name
FROM Recipe r
JOIN Category c on r.categoryId = c.categoryId
WHERE c.name = 'vegan' AND 
SELECT r.recipeId
FROM Recipe r
JOIN Category c on r.categoryId = c.categoryId
WHERE c.name = 'Japanses'
