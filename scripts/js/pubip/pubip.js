#!/usr/bin/env node

const chalk = require('chalk');
const cliSpinners = require('cli-spinners');
const ansiEscapes = require('ansi-escapes');
const axios = require('axios'); 
require('dotenv').config({ path: __dirname + "/.env" })

async function getIP(testSite) {
    
    let response = await axios.get(testSite);
    
    await print_ip(response.data);	
}

async function print_ip(ip){
	  process.stdout.write(ansiEscapes.eraseLine);
	  process.stdout.cursorTo(0);
          console.log( "ip: " + chalk.bold.greenBright(ip));  
	  process.stdout.write(ansiEscapes.cursorShow);
}

(async function main(){
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
	
      await getIP(testSite)
	
      clearInterval(interv);
})();

