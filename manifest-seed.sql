INSERT INTO users (id, username, password, first_name, last_name, email, bio, access)
VALUES (1,
        'manifestlaw',
        'password',
        'Jared',
        'Glenn',
        'jared_glenn@yahoo.com',
        'Creator of Manifest',
        'admin');

INSERT INTO kinships (id, name, plural, population, creation_year, private)
VALUES (1,
        'mugwump',
        'mugwumps',
        820000,
        -1000,
        false),
        (2,
        'duskmott',
        'duskmotts',
        1500000,
        -1000,
        false),
        (3,
        'wudrigar',
        'wudrigar',
        500000,
        200,
        false),
        (4,
        'pardrin',
        'pardrin',
        1000000,
        200,
        false),
        (5,
        'hangman',
        'hangmen',
        500000,
        500,
        false),
        (6,
        'hokflatzul',
        'hokflatzuls',
        820000,
        -1000,
        false);

INSERT INTO images (id, name, url, private)
VALUES (1,
        'mugwump image',
        'mugwump_img',
        false),
        (2,
        'duskmott image',
        'duskmott_img',
        false),
        (3,
        'wudrigar image',
        'wudrigar_img',
        false),
        (4,
        'pardrin image',
        'pardrin_img',
        false),
        (5,
        'hangman image',
        'hangman_img',
        false),
        (6,
        'hokflatzul image',
        'hokflatzul_img',
        false);

INSERT INTO groups (id, name, private)
VALUES (1,
        'Mitipidi Tribe',
        false),
        (2,
        'Nu Numic Tribe',
        false),
        (3,
        'See Atco Tribe',
        false),
        (4,
        'The First Faith',
        false),
        (5,
        'The Stirpec Church',
        false);

INSERT INTO territories (id, name, private)
VALUES (1,
        'Steps',
        false),
        (2,
        'Westilver',
        false),
        (3,
        'The United Allegheny Domains',
        false);

INSERT INTO articles (id, title, text, private)
VALUES (1,
        'Mugwump Introduction',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna 
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
        ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis 
        aute irure dolor in reprehenderit in voluptate velit esse 
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
        cupidatat non proident, sunt in culpa qui officia deserunt 
        mollit anim id est laborum.',
        false),
        (2,
        'Mugwump Life',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna 
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
        ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis 
        aute irure dolor in reprehenderit in voluptate velit esse 
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
        cupidatat non proident, sunt in culpa qui officia deserunt 
        mollit anim id est laborum.',
        false),
        (3,
        'Mugwump Psychology',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna 
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
        ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis 
        aute irure dolor in reprehenderit in voluptate velit esse 
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
        cupidatat non proident, sunt in culpa qui officia deserunt 
        mollit anim id est laborum.',
        false),
        (4,
        'Mugwump Comments',
        '',
        false),
        (5,
        'Duskmott Introduction',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna 
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
        ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis 
        aute irure dolor in reprehenderit in voluptate velit esse 
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
        cupidatat non proident, sunt in culpa qui officia deserunt 
        mollit anim id est laborum.',
        false),
        (6,
        'Duskmott Life',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna 
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
        ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis 
        aute irure dolor in reprehenderit in voluptate velit esse 
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
        cupidatat non proident, sunt in culpa qui officia deserunt 
        mollit anim id est laborum.',
        false),
        (7,
        'Duskmott Psychology',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna 
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
        ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis 
        aute irure dolor in reprehenderit in voluptate velit esse 
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
        cupidatat non proident, sunt in culpa qui officia deserunt 
        mollit anim id est laborum.',
        false),
        (8,
        'Duskmott Comments',
        '',
        false);

INSERT INTO comments (id, user_id, text)
VALUES (1,
        1,
        'Pretty interesting stuff!'),
        (2,
        1,
        'I mean, theyre called bigfoots. Shouldnt their feet be like a meter long?'),
        (3,
        1,
        'Wow! This is exactly the world I wanted to see!'),
        (4,
        1,
        'This ones my favorite!');
        
INSERT INTO kinships_images (kinship_id, image_id)
VALUES (1,
        1),
        (2,
        2),
        (3,
        3),
        (4,
        4),
        (5,
        5),
        (6,
        6);

INSERT INTO kinships_groups (kinship_id, group_id)
VALUES (1,
        1),
        (1,
        2),
        (1,
        3),
        (1,
        4),
        (2,
        4),
        (2,
        5),
        (4,
        4),
        (6,
        4);

INSERT INTO kinships_territories (kinship_id, territory_id)
VALUES (1,
        1),
        (2,
        3),
        (4,
        1),
        (4,
        2);

INSERT INTO groups_territories (group_id, territory_id)
VALUES (1,
        1),
        (2,
        1),
        (3,
        1),
        (4,
        1),
        (4,
        2),
        (5,
        3);
        
INSERT INTO page_article (page_name, article_id)
VALUES ('mugwump',
        1),
        ('mugwump',
        2),
        ('mugwump',
        3),
        ('duskmott',
        4),
        ('duskmott',
        5),
        ('duskmott',
        6);
        
INSERT INTO article_comment (article_id, comment_id)
VALUES (4,
        1),
        (4,
        2),
        (4,
        3),
        (4,
        4),
        (8,
        1),
        (8,
        2),
        (8,
        3),
        (8,
        4);
