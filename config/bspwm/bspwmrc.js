#!/usr/bin/env node

const sh = require('shelljs');
const bspwm = require('./bspwm.js')
const util = require('./util.js')

sh.config.silent = true;

function setDisplayOpts(display, ...opts) {
  sh.exec(`xrander --output ${display} ${opts.join(' ')}`);
}

function setBackground(bgPath) {
  sh.exec(`feh --bg-center ${bgPath}`);
}

// dep checks:
const deps = ['bspc', 'xrandr', 'feh', 'xrdb']
const notInstalled = deps.find(dep => !util.isInstalled(dep));

if (notInstalled) {
  sh.echo(`${notInstalled} is not installed`);
  sh.exit(0);
}

// get colors
const colors2 = util.getColors(); 


// set rules for home
if (util.getHost() === 'home') {

  sh.echo('host -> home');

  sh.exec('xrandr --output DP-2 --primary --mode 1920x1080 --rotate normal --rate 144.0 ' + 
	  '--output HDMI-0 --left-of DP-2 --mode 1366x768 --rotate left --rate 60.0');


  bspwm.addDesktops('HDMI-0', 'lg_a');
  bspwm.addDesktops('DP-2', 'a', 'b', 'c');
} 

if (util.getHost() === 'katana') {
  bspwm.addDesktops('LVDS-1', 'a', 'b', 'c');
}

// set rules for all
setBackground('/usr/home/jesse/resource/wallpapers/1552441584675.png');

bspwm.removeDesktop('Desktop');
bspwm.removeDesktop('Desktop');

bspwm.addRule('Firefox', 'state=tiled', 'follow=on', 'border=on');
bspwm.addRule('Alacritty', 'state=tiled', 'follow=on', 'border=on');
bspwm.addRule('IntelliJ IDEA', 'state=tiled', 'follow=on', 'border=off', 'focus=on');

bspwm.setConfig('border_width', '2');
bspwm.setConfig('window_gap', '12');
bspwm.setConfig('split_ratio', '0.56');
bspwm.setConfig('borderless_monocle', true );
bspwm.setConfig('gapless_monocle', true );
bspwm.setConfig('focused_border_color', '#FF6663');
bspwm.addRule('Screenkey', 'manage=off');

// start bar
sh.exec(`${process.env.HOME}/env/config/polybar/launch.sh`);
