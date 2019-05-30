const sh = require('shelljs');
const os = require('os');
const { handle } = require('./error.js');

sh.config.silent = true;

const addDesktops = (monitor, ...desktops) => {
  sh.exec(`bspc monitor ${monitor} -a ${desktops.join(' ')}`);
};

const removeDesktop = (desktop) => {
  sh.exec(`bspc desktop ${desktop} -r`);
}

const addRule = (application, ...args) => {
  sh.exec(`bspc rule -a ${application} ${args.join(' ')}`)
}

const setConfig = (property, value) => {
   sh.exec(`bspc config ${property} '${value}'`);
}

module.exports = { addDesktops: handle(addDesktops), 
		   removeDesktop: handle(removeDesktop), 
	           addRule: handle(addRule),
	           setConfig: handle(setConfig) };
