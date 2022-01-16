import Vue from "vue";
import Vuex from "vuex";
// import router from "../router/router.js";
// import axios from "axios";

Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    // posts: [],
  },
  mutations: {
    // setPost(state) {
    //   state.posts = [];
    //   axios.get("/api/v1/posts").then((res) => (state.posts = res.data));
    //   (error) => {
    //     console.log(error);
    //   };
    // },
    // deletePost(state, { id }) {
    //   axios.delete(`/api/v1/posts/${id}`).then((res) => {
    //     state.posts = [];
    //   });
    // },
  },
});

export default store;
