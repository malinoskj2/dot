const sh = require('shelljs');
const os = require('os');
const { handleExports } = require('./error.js');

sh.config.silent = true;

const db = sh.exec('xrdb -query');
const colors = [ 'foreground', 'background',
        'color0', 'color1', 'color2',
        'color3', 'color4', 'color5',
        'color6', 'color7' ];

const getColor = (color) => {
 return db.grep(`${color}:`)
        .exec('awk \'{print $NF}\'')
        .replace(/\n+$/, '');
};

const colorMap = new Map(colors.map(color => [color, getColor(color)]));

const getColors = () => {
  return colorMap;
};

const getHost = () =>  {
  return os.hostname();
};

const isInstalled = (dep) => {
  return sh.exec(`command -v ${dep}`)
};

module.exports = handleExports(getColors, getHost, isInstalled);
