const { environment } = require("@rails/webpacker");
const { VueLoaderPlugin } = require("vue-loader");
const vue = require("./loaders/vue");
const stylus = require("../loaders/stylus");

environment.plugins.prepend("VueLoaderPlugin", new VueLoaderPlugin());
environment.loaders.prepend("vue", vue);
module.exports = environment;
environment.loaders.prepend("stylus", stylus);

environment.config.merge({
  resolve: {
    alias: {
      vue$: "vue/dist/vue.esm.js",
    },
  },
});
