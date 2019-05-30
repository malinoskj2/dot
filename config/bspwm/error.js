const sh = require('shelljs');
sh.config.silent = true;

const cliHandler = errorHandler => evalFunc => (...args) => {
  const res = evalFunc(...args);
  errorHandler(evalFunc.name) ;
  return res;
};

const errorHandler = (name,res) => {
  if (sh.error()) {
    sh.echo(`There was an error -> ${name}()`);
  }
};

const handle = cliHandler(errorHandler);
module.exports = { handle };
