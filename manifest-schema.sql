CREATE TABLE "kinships" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "plural" varchar   NOT NULL,
    "population" int   NOT NULL,
    "creation_year" int   NOT NULL,
    "private" boolean   NOT NULL,
    CONSTRAINT "pk_kinships" PRIMARY KEY (
        "id"
    )
);

CREATE TABLE "kinships_images" (
    "kinship_id" int   NOT NULL,
    "image_id" int   NOT NULL,
    CONSTRAINT "pk_kinships_images" PRIMARY KEY (
        "kinship_id", "image_id"
     )
);

CREATE TABLE "images" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "url" varchar   NOT NULL,
    "private" boolean   NOT NULL,
    CONSTRAINT "pk_images" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "kinships_groups" (
    "kinship_id" int   NOT NULL,
    "group_id" int   NOT NULL,
    CONSTRAINT "pk_kinships_groups" PRIMARY KEY (
        "kinship_id", "group_id"
     )
);

CREATE TABLE "groups" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "private" boolean   NOT NULL,
    CONSTRAINT "pk_groups" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "kinships_territories" (
    "kinship_id" int   NOT NULL,
    "territory_id" int   NOT NULL,
    CONSTRAINT "pk_kinships_territories" PRIMARY KEY (
        "kinship_id", "territory_id"
     )
);

CREATE TABLE "territories" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "private" boolean   NOT NULL,
    CONSTRAINT "pk_territories" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "groups_territories" (
    "group_id" int   NOT NULL,
    "territory_id" int   NOT NULL,
    CONSTRAINT "pk_groups_territories" PRIMARY KEY (
        "group_id", "territory_id"
     )
);

CREATE TABLE "articles" (
    "id" int   NOT NULL,
    "title" varchar   NOT NULL,
    "text" text   NOT NULL,
    "private" boolean   NOT NULL,
    CONSTRAINT "pk_articles" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "page_article" (
    "page_name" varchar   NOT NULL,
    "article_id" int   NOT NULL,
    CONSTRAINT "pk_page_article" PRIMARY KEY (
        "page_name", "article_id"
     )
);

CREATE TABLE "article_comment" (
    "article_id" int   NOT NULL,
    "comment_id" int   NOT NULL,
    CONSTRAINT "pk_article_comment" PRIMARY KEY (
        "article_id", "comment_id"
     )
);

CREATE TABLE "comments" (
    "id" int   NOT NULL,
    "user_id" int   NOT NULL,
    "text" varchar   NOT NULL,
    CONSTRAINT "pk_comments" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "users" (
    "id" int   NOT NULL,
    "username" varchar   NOT NULL,
    "password" varchar NOT NULL,
    "first_name" varchar NOT NULL,
    "last_name" varchar NOT NULL,
    "email" varchar NOT NULL,
    "bio" varchar   NOT NULL,
    "access" varchar   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "kinships_images" ADD CONSTRAINT "fk_kinships_images_kinship_id" FOREIGN KEY("kinship_id")
REFERENCES "kinships" ("id");

ALTER TABLE "kinships_images" ADD CONSTRAINT "fk_kinships_images_image_id" FOREIGN KEY("image_id")
REFERENCES "images" ("id");

ALTER TABLE "kinships_groups" ADD CONSTRAINT "fk_kinships_groups_kinship_id" FOREIGN KEY("kinship_id")
REFERENCES "kinships" ("id");

ALTER TABLE "kinships_groups" ADD CONSTRAINT "fk_kinships_groups_group_id" FOREIGN KEY("group_id")
REFERENCES "groups" ("id");

ALTER TABLE "kinships_territories" ADD CONSTRAINT "fk_kinships_territories_kinship_id" FOREIGN KEY("kinship_id")
REFERENCES "kinships" ("id");

ALTER TABLE "kinships_territories" ADD CONSTRAINT "fk_kinships_territories_territory_id" FOREIGN KEY("territory_id")
REFERENCES "territories" ("id");

ALTER TABLE "groups_territories" ADD CONSTRAINT "fk_groups_territories_group_id" FOREIGN KEY("group_id")
REFERENCES "groups" ("id");

ALTER TABLE "groups_territories" ADD CONSTRAINT "fk_groups_territories_territory_id" FOREIGN KEY("territory_id")
REFERENCES "territories" ("id");

ALTER TABLE "page_article" ADD CONSTRAINT "fk_page_article_article_id" FOREIGN KEY("article_id")
REFERENCES "articles" ("id");

ALTER TABLE "article_comment" ADD CONSTRAINT "fk_article_comment_article_id" FOREIGN KEY("article_id")
REFERENCES "articles" ("id");

ALTER TABLE "article_comment" ADD CONSTRAINT "fk_article_comment_comment_id" FOREIGN KEY("comment_id")
REFERENCES "comments" ("id");

ALTER TABLE "comments" ADD CONSTRAINT "fk_comments_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

CREATE INDEX "idx_kinships_name"
ON "kinships" ("name");

CREATE INDEX "idx_kinships_images_image_id"
ON "kinships_images" ("image_id");

CREATE INDEX "idx_kinships_groups_group_id"
ON "kinships_groups" ("group_id");

CREATE INDEX "idx_groups_name"
ON "groups" ("name");

CREATE INDEX "idx_kinships_territories_territory_id"
ON "kinships_territories" ("territory_id");

CREATE INDEX "idx_territories_name"
ON "territories" ("name");

CREATE INDEX "idx_groups_territories_territory_id"
ON "groups_territories" ("territory_id");

CREATE INDEX "idx_page_article_article_id"
ON "page_article" ("article_id");

CREATE INDEX "idx_article_comment_comment_id"
ON "article_comment" ("comment_id");