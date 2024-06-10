"use strict";

const db = require("../db");
const { BadRequestError, NotFoundError } = require("../expressError");
const { sqlForPartialUpdate } = require("../helpers/sql");

class Kinship {


    static async create ({ name, plural, population, creation_year, is_private }) {
        const duplicateCheck = await db.query(
            `SELECT name
            FROM kinships
            WHERE name = $1`,
            [ name ]
        );

        if (duplicateCheck.rows[0]) {
            throw new BadRequestError(`Duplicate kinship: ${ name }`);
        }

        const res = await db.query(
            `INSERT INTO kinships
            (name, plural, population, creation_year, is_private)
            VALUES ($1, $2, $3, $4, $5)
            RETURNING id, name, population, creation_year, is_private`,
            [ name, plural, population, creation_year, is_private ]
        );

        const kinship = res.rows[0];

        return kinship;
    }

    // Find all the kinships and their associated images and list them each in alphabetical order by name.
    static async findAll() {
        const kinships = await db.query(
            `SELECT 
                k.id AS kinship_id,
                k.name AS kinship_name,
                k.plural,
                k.population,
                k.creation_year,
                k.is_private,
                i.id AS image_id,
                i.name AS image_name,
                i.url,
                i.is_private AS image_isPrivate
            FROM kinships k
            LEFT JOIN kinships_images ki ON k.id = ki.kinship_id
            LEFT JOIN images i ON ki.image_id = i.id
            ORDER BY k.name`);
        
        return kinships.rows;
    }

    static async get(name) {
        const kinship = await db.query(
            `SELECT 
            jsonb_build_object(
                'kinship_id', k.id,
                'kinship_name', k.name,
                'plural', k.plural,
                'population', k.population,
                'creation_year', k.creation_year,
                'is_private', k.is_private,
                'articles', (
                    SELECT jsonb_agg(
                        jsonb_build_object(
                            'article_id', a.id,
                            'title', a.title,
                            'text', a.text,
                            'is_private', a.is_private,
                            'comments', (
                                SELECT jsonb_agg(
                                    jsonb_build_object(
                                        'comment_id', c.id,
                                        'user_id', c.user_id,
                                        'text', c.text
                                    )
                                )
                                FROM comments c
                                JOIN article_comment ac ON c.id = ac.comment_id
                                WHERE ac.article_id = a.id
                            )
                        )
                    )
                    FROM articles a
                    JOIN page_article pa ON a.id = pa.article_id
                    WHERE pa.page_name = k.name
                ),
                'territories', (
                    SELECT jsonb_agg(
                        jsonb_build_object(
                            'territory_id', t.id,
                            'name', t.name,
                            'is_private', t.is_private
                        )
                    )
                    FROM territories t
                    JOIN kinships_territories kt ON t.id = kt.territory_id
                    WHERE kt.kinship_id = k.id
                ),
                'groups', (
                    SELECT jsonb_agg(
                        jsonb_build_object(
                            'group_id', g.id,
                            'name', g.name,
                            'is_private', g.is_private
                        )
                    )
                    FROM groups g
                    JOIN kinships_groups kg ON g.id = kg.group_id
                    WHERE kg.kinship_id = k.id
                ),
                'images', (
                    SELECT jsonb_agg(
                        jsonb_build_object(
                            'image_id', i.id,
                            'name', i.name,
                            'url', i.url,
                            'is_private', i.is_private
                        )
                    )
                    FROM images i
                    JOIN kinships_images ki ON i.id = ki.image_id
                    WHERE ki.kinship_id = k.id
                )
            ) AS kinship_data
        FROM kinships k
        WHERE k.name = $1`,
            [ name ]
        );

        return kinship.rows;
    }
}

module.exports = Kinship;