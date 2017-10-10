const express = require('express');
const serialize = require('serialize-javascript');

const env = {};
if (process.env.EXPOSE_VARS) {
  for(var v of process.env.EXPOSE_VARS.split(" ")) {
    env[v] = process.env[v];
  }
}

const app = express();
app.use(express.static("/var/www/html/"));
app.enable('etag');

app.get('/env.js', function (req, res) {
  res.set('Content-Type', 'application/javascript');
  res.send('window._env = ' + serialize(env));
});

app.get('/*', function (req, res) {
  res.sendFile("/var/www/html/index.html");
});

app.listen(8080);

