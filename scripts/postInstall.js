#!/usr/bin/env node

var fs = require('fs');
var path = require('path');

console.log('Ionic Scene Delegate Plugin Post Install Script');
console.log('Setting up iOS Scene Delegate configuration...');

// Verificar que estamos en un proyecto Cordova
var configPath = path.join(process.cwd(), 'config.xml');
if (!fs.existsSync(configPath)) {
    console.log('Not in a Cordova project, skipping post install.');
    process.exit(0);
}

console.log('Post install completed successfully.');