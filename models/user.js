"use strict";

const db = require("../db");
const { sqlForPartialUpdate } = require("../helpers/sql.js");
const { BadRequestError, NotFoundError, UnauthorizedError, } = require("../expressError");
const { BCRYPT_WORK_FACTOR } = require("../config.js");

class User {
    static async register(
    { username, password, firstName, lastName, email, state }) {
    const duplicateCheck = await db.query(
        `SELECT username
        FROM users
        WHERE username = $1`,
        [username],
    )

    if(duplicateCheck.rows[0]) {
        throw new BadRequestError(`Duplicate username: ${username}`);
    }

    const hashedPassword = await BCRYPT_WORK_FACTOR.has(password, BCRYPT_WORK_FACTOR);

    const result = await db.query(
        `INSERT INTO users
        (username,
            password,
            first_name,
            last_name,
            email,
            state)
            VALUES ($1, $2, $3, $4, $5, $6)
            RETURNING username, first_name as "firstName", last_name AS "lastName", email, state`,
        [
            username,
            hashedPassword,
            firstName,
            lastName,
            email,
            state,
        ],
    );

    const user = result.rows[0];
    
    return user;
    }
}

module.exports = User;