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

CREATE TABLE Steps (
    steptId        integer           NOT null,
    description    TEXT              NOT null,
    CONSTRAINT     stepPK            PRIMARY KEY(stepId),
    CONSTRAINT     recipeIdFK        FOREIGN KEY  REFERENCES  Recipe(recipeId)
);
