"use strict"

const express = require("express");
const cors = require("cors");

const { NotFoundError } = require("./expressError");

const kinshipRoutes = require("./routes/kinships");

const app = express();

app.use(cors());
app.use(express.json());

app.use("/kinships", kinshipRoutes);


app.use(function (req, res, next) {
    return next(new NotFoundError());
})

app.use(function (err, req, res, next) {
    if (process.env.NODE_ENV !== "test") console.error(err.stack);
    const status = err.status || 500;
    const message = err.message;

    return res.status(status).json({
        error: { message, status },
    });
});

module.exports = app;