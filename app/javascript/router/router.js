import Vue from "vue";
import VueRouter from "vue-router";
import PostList from "../posts/PostList.vue";
import PostForm from "../posts/PostForm.vue";
import PostEdit from "../posts/PostEdit.vue";

Vue.use(VueRouter);

const routes = [
  { path: "/", name: "PostList", component: PostList },
  { path: "/create", component: PostForm },
  { path: "/edit/:id", component: PostEdit },
];

export default new VueRouter({ routes });
