'use strict';

var fs = require('fs');
var path = require('path');

var share = process.argv.filter(a => a.startsWith('--custom-dir=')).map(a => a.split('=')[1])[0] || process.env.HOME;
if (share[0] === '~') {
  share = path.join(process.env.HOME, share.slice(1));
}
share = path.resolve(share);
console.log(' -> Root directory is', share);

function exists (directory, callback) {
  let root = '/';
  let dirs = directory.split('/');
  function one () {
    root = path.join(root, dirs.shift());
    fs.stat(root, (e) => {
      if (!e && dirs.length) {
        one();
      }
      else if (e && e.code === 'ENOENT') {
        fs.mkdir(root, (e) => {
          if (e) {
            callback(e);
          }
          else if (dirs.length) {
            one();
          }
          else {
            callback();
          }
        });
      }
      else {
        callback(e);
      }
    });
  }
  one();
}

var {id, ids} = require('./config.js');
var dir = path.join(share, id);
var name = id;

function manifest (root, type, callback) {
  console.log(' -> Creating a directory at', root);
  exists(root, (e) => {
    if (e) {
      throw e;
    }

    let origins;
    if (type === 'chrome') {
      origins = '"allowed_origins": ' + JSON.stringify(ids.chrome.map(id => 'chrome-extension://' + id + '/'));
    }
    else {
      origins = '"allowed_extensions": ' + JSON.stringify(ids.firefox);
    }
    fs.writeFile(path.join(root, name + '.json'), `{
  "name": "${name}",
  "description": "Node Host for Native Messaging",
  "path": "${path.join(dir, 'run.sh')}",
  "type": "stdio",
  ${origins}
}`, (e) => {
      if (e) {
        throw e;
      }
      callback();
    });
  });
}

function application (callback) {
  console.log(' -> Creating a directory at', dir);
  exists(dir, (e) => {
    if (e) {
      console.log('\x1b[31m', `-> You dont have permission to use "${share}" directory.` ,'\x1b[0m');
      console.log('\x1b[31m', '-> Use custom directory instead. Example:' ,'\x1b[0m');
      console.log('\x1b[31m', '-> ./install.sh --custom-dir=~/' ,'\x1b[0m');

      throw e;
    }

    let isNode = process.argv.filter(a => a === '--add_node').length === 0;
    let run = isNode ? `#!/bin/bash\n${process.argv[2]} host.js` : '#!/bin/bash\n./node host.js';

    fs.writeFile(path.join(dir, 'run.sh'), run, (e) => {
      if (e) {
        throw e;
      }
      fs.chmodSync(path.join(dir, 'run.sh'), '0755');
      if (!isNode) {
        fs.createReadStream(process.argv[0]).pipe(fs.createWriteStream(path.join(dir, 'node')));
        fs.chmodSync(path.join(dir, 'node'), '0755');
      }
      fs.createReadStream('host.js').pipe(fs.createWriteStream(path.join(dir, 'host.js')));
      fs.createReadStream('config.js').pipe(fs.createWriteStream(path.join(dir, 'config.js')));
      fs.createReadStream('messaging.js').pipe(fs.createWriteStream(path.join(dir, 'messaging.js')));

      callback();
    });
  });
}

function chrome (callback) {
  if (ids.chrome.length) {
    let loc = path.join(
      process.env.HOME,
      'Library/Application Support/Google/Chrome/NativeMessagingHosts'
    );
    manifest(loc, 'chrome', callback);
    console.error(' -> Chrome Browser is supported');
  }
  else {
    callback();
  }
}
function chromium (callback) {
  if (ids.chrome.length) {
    let loc = path.join(
      process.env.HOME,
      'Library/Application Support/Chromium/NativeMessagingHosts'
    );
    manifest(loc, 'chrome', callback);
    console.error(' -> Chromium Browser is supported');
  }
  else {
    callback();
  }
}
function firefox (callback) {
  if (ids.firefox.length) {
    let loc = path.join(
      process.env.HOME,
      'Library/Application Support/Mozilla/NativeMessagingHosts'
    );
    manifest(loc, 'firefox', callback);
    console.error(' -> Firefox Browser is supported');
  }
  else {
    callback();
  }
}
chrome(() => chromium(() => firefox(() => {
  application(() => {
    console.error(' -> Native Host is installed in', dir);
    console.error('\n\n>>> Application is ready to use <<<\n\n');
  });
})));
