var path = require('path');
var express = require('express');
var webpack = require('webpack');
var config = require('./webpack_js.config.js');

var app = express();
var compiler = webpack(config);

app.use(require('webpack-dev-middleware')(compiler, {
  noInfo: true,
  publicPath: config.output.publicPath
}));

app.use(require('webpack-hot-middleware')(compiler));

app.listen(8080, 'localhost', function(err) {
  if (err) {
    console.log(err);
    return;
  }

  // kill server when stdin received
  process.stdin.on('end', function() {
    process.exit(0)
  });
  process.stdin.resume();

  console.log('Custom webpack dev server listing at http://localhost:8080');
});
