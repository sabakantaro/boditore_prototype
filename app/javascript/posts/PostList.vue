<template>
  <div class="">
    <div class="py-4 flex justify-center">
      <button
        class="cursor-pointer px-3 py-2 bg-blue-500 text-white font-semibold rounded hover:bg-blue-700"
      >
        <router-link to="/create"
          >新規投稿する<i class="fas fa-paper-plane"></i
        ></router-link>
      </button>
    </div>
    <hr />
    <div>
      <div
        class="relative hover:bg-gray-100 active:bg-gray-200"
        v-for="post in posts"
        :key="post.id"
      >
        <a v-bind:href="'posts/' + post.id">
          <div>
            <div class="py-4 flex justify-center">
              <h3 class="px-4 pt-4 text-xl">{{ post.title }}</h3>
            </div>
            <p class="p-4 flex items-center">{{ post.content }}<br /></p>
            <p class="p-4 flex items-center">#{{ post.tag }}</p>
            <img
              v-if="post.image_url"
              class="w-full"
              v-bind:src="post.image_url"
            />
            <img
              v-else
              class="w-full"
              v-bind:src="require('../components/images/post-image.jpg')"
            />

            <hr />
          </div>
        </a>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "PostList",
  data: function () {
    return {
      id: this.$route.params.id,
      posts: "posts",
    };
  },
  mounted() {
    this.setPost();
  },
  methods: {
    setPost: function () {
      axios
        .get("/api/v1/posts")
        .then((response) => (this.posts = response.data));
    },
    // deletePost(id) {
    //   axios.delete(`/api/v1/posts/${id}`).then((res) => {
    //     this.posts = [];
    //     this.setPost();
    //   });
    // },
  },
};
</script>
