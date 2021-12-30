import Vue from "vue/dist/vue.esm.js";
import UserList from "../components/UserList.vue";
// import "../packs/index.css";

var user = new Vue({
  el: "#user",

  components: {
    contents: UserList,
  },
});
