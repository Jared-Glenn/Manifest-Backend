// This expands the Error into various ExpressErrors.

class ExpressError extends Error {
    constructor(message, status) {
        super();
        this.message = message;
        this.status = status;
    }
}

// 404 Error, Not Found

class NotFoundError extends ExpressError {
    constructor(message = "Not Found") {
        super(message, 404);
    }
}

// 401 Error, Unauthorized

class UnauthorizedError extends ExpressError {
    constructor(message = "Unauthorized") {
        super(message, 401);
    }
}

// 400 Error, Bad Request

class BadRequestError extends ExpressError {
    constructor(message = "Bad Request") {
        super(message, 403);
    }
}

// 403 Error, Bad Request

class ForbiddenError extends ExpressError {
    constructor(message = "Bad Request") {
        super(message, 403);
    }
}

module.export = {
    ExpressError,
    NotFoundError,
    UnauthorizedError,
    BadRequestError,
    ForbiddenError,
};