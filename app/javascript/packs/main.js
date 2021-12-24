import Vue from "vue/dist/vue.esm.js";
import PostForm from "../components/PostForm.vue";
import PostList from "../components/PostList.vue";

var main = new Vue({
  el: "#main",
  components: {
    navbar: PostForm,
    contents: PostList,
  },
});
