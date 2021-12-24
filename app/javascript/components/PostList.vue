<template>
  <div class="">
    <ul class="">
      <li
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
              v-bind:src="require('./images/post-image.jpg')"
            />

            <hr />
          </div>
        </a>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
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
  },
};
</script>
