var webpack = require('webpack');
var path = require('path');

module.exports = {
  entry: {
    all: './source/assets/javascripts/all.js'
  },
  output: {
    path: __dirname + "/.tmp/dist/",
    filename: "assets/javascripts/[name].bundle.js",
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        loader: 'babel-loader',
        exclude: /node_modules/,
        query: {
          presets: ['es2015']
        }
      },
    ]
  },
  plugins: [
    // global access to jquery
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      "window.jQuery": "jquery"
    }),
  ],
};
