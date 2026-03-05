#!/usr/bin/env bun

import fs from "node:fs"
import os from "node:os"
import {spawnSync} from 'node:child_process'

const nip='/root/ni.json'


let termux_nodepath="/data/data/com.termux/files/usr/bin/node"

if(fs.existsSync(termux_nodepath))
{
  spawnSync(termux_nodepath,["-e",`fs.writeFileSync( "${nip}", JSON.stringify(os.networkInterfaces()) )` ]);
}
else if(fs.existsSync("/android/r"))
{
  spawnSync("/bin/sh",["/android/r","node","-e",`fs.writeFileSync( "${nip}", JSON.stringify(os.networkInterfaces()) )` ]);
}


//  Patch os.networkInterfaces

  
if(fs.existsSync(nip))
{
  os.networkInterfaces=()=>JSON.parse( 
    fs.readFileSync(nip).toString() 
  );
}
