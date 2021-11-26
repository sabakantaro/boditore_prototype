import Vue from "vue/dist/vue.esm.js";
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";
import UserList from "../components/UserList.vue";
import "@mdi/font/css/materialdesignicons.css";

Vue.use(Vuetify);
const vuetify = new Vuetify({
  icons: {
    iconfont: "mdi",
  },
});

var user = new Vue({
  vuetify,
  el: "#user",

  components: {
    contents: UserList,
  },
});
