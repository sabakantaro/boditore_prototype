import Vue from "vue/dist/vue.esm.js";
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";
import PostForm from "../components/PostForm.vue";
import PostList from "../components/PostList.vue";
import "@mdi/font/css/materialdesignicons.css";
// import vSelect from "vue-select";
// import "vue-select/dist/vue-select.css";

Vue.use(Vuetify);
const vuetify = new Vuetify({
  icons: {
    iconfont: "mdi",
  },
});

// Vue.component("v-select", vSelect);

var main = new Vue({
  vuetify,
  el: "#main",
  // data: {
  //   selected: "",
  //   options: ["foo", "bar", "baz"],
  // },
  components: {
    navbar: PostForm,
    contents: PostList,
  },
});
