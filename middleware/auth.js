"use strict";

const jwt = require("jsonwebtoken");
const { SECRET_KEY } = require("../config");
const { UnauthorizedError } = require("../expressError");

function ensureAdmin(req, res, next) {
    try {
        if (!res.locals.user || res.locals.user.access !== "admin") {
            throw new UnauthorizedError();
        }
        return next();
    }
    catch (err) {
        return next(err);
    }
}

module.exports = { ensureAdmin };