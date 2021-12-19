import Vue from "vue/dist/vue.esm.js";
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";
import PostForm from "../components/PostForm.vue";
import PostList from "../components/PostList.vue";
import "@mdi/font/css/materialdesignicons.css";

Vue.use(Vuetify);
const vuetify = new Vuetify({
  icons: {
    iconfont: "mdi",
  },
});

var main = new Vue({
  vuetify,
  el: "#main",
  components: {
    navbar: PostForm,
    contents: PostList,
  },
});
