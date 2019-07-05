#!/usr/bin/env node

const sh = require('shelljs');
const bspwm = require('./bspwm.js')
const util = require('./util.js')

sh.config.silent = true;

function setDisplayOpts(display, ...opts) {
  sh.exec(`xrander --output ${display} ${opts.join(' ')}`);
}

function setBackground(bgPath) {
  sh.exec(`feh --bg-scale --no-fehbg ${bgPath}`);
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

  //bspwm.setConfig('focused_border_color', '#FF6663');
	//6F3950 855666
  bspwm.setConfig('focused_border_color', '#D57755');
  bspwm.setConfig('normal_border_color', '#855666');
} 

if (util.getHost() === 'katana') {
  bspwm.addDesktops('LVDS-1', 'a', 'b', 'c');
  bspwm.setConfig('focused_border_color', '#FF0000');
}

// set rules for all

setBackground('/usr/home/jesse/resource/wallpapers/default/default');
bspwm.removeDesktop('Desktop');
bspwm.removeDesktop('Desktop');

bspwm.addRule('Firefox:Navigator', 'desktop=a', 'state=tiled', 'follow=on', 'border=off', 'focus=on');
bspwm.addRule('Alacritty', 'state=tiled', 'follow=on', 'border=on', 'focus=on');
bspwm.addRule('IntelliJ IDEA', 'state=tiled', 'follow=on', 'border=off', 'focus=on');
bspwm.addRule('mpv', 'state=tiled', 'follow=on', 'border=on', 'focus=on');
bspwm.addRule('polybar-mybar3_DP-2', 'focus=on', 'border=on', 'floating=on');
bspwm.addRule('Firefox:*', 'focus=on', 'border=on', 'floating=on');
bspwm.addRule('feh', 'focus=off', 'border=off', 'floating=on',  
	      'layer=below', 'state=floating');
bspwm.addRule('Pqiv', 'focus=off', 'border=off', 'floating=on',  
	      'layer=below', 'state=floating');

bspwm.setConfig('border_width', '2');
bspwm.setConfig('border_radius', '6');
bspwm.setConfig('window_gap', '12');
bspwm.setConfig('split_ratio', '0.56');
bspwm.setConfig('borderless_monocle', true );
bspwm.setConfig('gapless_monocle', true );
bspwm.setConfig('focus_follows_pointer', false);

bspwm.addRule('Screenkey', 'manage=off');

// start bar
sh.exec(`${process.env.HOME}/env/config/polybar/launch`);
