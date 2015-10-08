var webpack = require('webpack');
var path = require('path');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

/**
 * see http://webpack.github.io/docs/configuration.html
 * for webpack configuration options
 */
module.exports = {
  name: "app-styles",
  context: path.join(__dirname, '..', '/web/static/css'),
  entry: './app.css',
  output: {
    path: path.join(__dirname, '..', '/priv/static/css'),
    filename: 'app.css'
  },
  module: {
    loaders: [
      {
        test: /web\/static.*\.css$/,
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader')
      }
    ]
  },
  plugins: [
    new ExtractTextPlugin("app.css")
  ]
};
