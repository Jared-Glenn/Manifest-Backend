"use strict";

// All routes for kinships.

const jsonschema = require("jsonschema");
const express = require("express");
const { ensureAdmin } = require("../middleware/auth");

const { BadRequestError } = require("../expressError");
const Kinship = require("../models/kinship");

const router = new express.Router();

// POST - Admin only
// { kinship } => { kinship }

// kinship = { name, plural, population, creation_year, is_private }

router.post("/", ensureAdmin, async function (req, res, next) {
    try {
        const kinship = await Kinship.create(req.body);
        return res.status(201).json({ kinship });
    }
    catch (err) {
        return next(err);
    }
});

router.get("/", async function (req, res, next) {
    try {
        const kinships = await Kinship.findAll();
        return res.json({ kinships });
    }
    catch (err) {
        return next(err);
    }
})

router.get("/:name", async function (req, res, next) {
    try {
        const kinship = await Kinship.get(req.params.name);
        return res.json({ kinship });
    }
    catch (err) {
        return next(err);
 }})

 module.exports = router;