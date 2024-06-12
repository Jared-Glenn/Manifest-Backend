# Manifest Backend

### Structure
The Manifest Backend is an Express App that acts as an API for the Manifest Frontend. It has access to much more data than there are currently routes for, but the overall structure is in place for JWT, full RESTful API, Admin access, and a comments section available to users.

### Routes

Two main routes are currently in use for the backend.

#### Get Kinships

This route (/kinships) is used to gain an up-to-date list of kinships and their main qualities, including their associated images.

#### Get Kinship

This route (/kinships/:name) provides much more detailed information on a single kinship, which can be used to fill out a large article and various other data points. This makes use of a complex SQL query to produce a single object with information from upwards of eight different tables, all organized for use on the frontend.