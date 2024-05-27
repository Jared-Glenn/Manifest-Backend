"use strict"

// Setup the database for Manifest

const { Client } = require("pg");
const { getDatabaseUri } = require("./config");

let db;

if (process.env.NODE_ENV === "production") {
    db = newClient({
        connectionString: getDatabaseUri(),
        ssl: {
            rejectUnauthorize: false
        }
    })
}
else {
    db = new Client({
        connectionString: getDatabaseUri()
    });
}

db.connect();

module.exports = db;