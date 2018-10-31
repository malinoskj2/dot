#!/usr/bin/env node

const chalk = require('chalk');
const cliSpinners = require('cli-spinners');
const ansiEscapes = require('ansi-escapes');
const axios = require('axios'); 
require('dotenv').config();

async function getIP(testSite) {
    
    let response = await axios.get(testSite);
	
    return response.data;	
}

(function main(){
	let testSite = process.env.TEST_URL;

	let spinner = cliSpinners.pong;
	
	let i = 0;
	process.stdout.write(ansiEscapes.cursorHide);
	
	let interv = setInterval(()=>{
		process.stdout.cursorTo(0);
        	process.stdout.write(
			chalk.dim("ip: ") + 
			chalk.green(spinner.frames[i % spinner.frames.length]));

		i++;
	},spinner.interval);
	
	getIP(testSite).then((ip)=>{
	  process.stdout.write(ansiEscapes.eraseLine);
	  process.stdout.cursorTo(0);
          console.log( "ip: " + chalk.bold.greenBright(ip));  
	  process.stdout.write(ansiEscapes.cursorShow);
	  clearInterval(interv);
	});
})();

