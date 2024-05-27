const { BadRequestError } = require("../expressError");

// This helper function takes the body of the request and parses the kys from it.e

// The keys are placed into a string for placement in an SQL command along with $-notation.

// This then allows only the given data to be updated without causing the request to be rejected due
// to missing data.

function sqlForPartialUpdate(dataToUpdate, jsToSql) {
    const keys = Object.keys(dataToUpdate);
    if (keys.length === 0) throw new BadRequestError("No data");
  
    // {firstName: 'Aliya', age: 32} => ['"first_name"=$1', '"age"=$2']
    const cols = keys.map((colName, idx) =>
        `"${jsToSql[colName] || colName}"=$${idx + 1}`,
    );
  
    return {
      setCols: cols.join(", "),
      values: Object.values(dataToUpdate),
    };
  }
  
  module.exports = { sqlForPartialUpdate };
  