import Vue from "vue/dist/vue.esm.js";
import PostForm from "../components/PostForm.vue";
import PostList from "../components/PostList.vue";
// import "../packs/index.css";

var post = new Vue({
  el: "#post",
  components: {
    navbar: PostForm,
    contents: PostList,
  },
});
