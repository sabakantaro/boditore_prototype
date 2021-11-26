<template>
  <div class="post__wrapper">
    <ul class="post__index">
      <li class="post__index__item" v-for="post in posts" :key="post.id">
        <div class="post__index__item__user">
          <h3>{{ post.title }}</h3>
          {{ post.content }}
          <img
            v-if="post.image_url"
            class="post__index__item__img"
            v-bind:src="post.image_url"
          />
          <img
            v-else
            class="post__index__item__img"
            v-bind:src="require('./images/post-image.jpg')"
          />

          <hr />
          <a v-bind:href="'posts/' + post.id">詳細を見る</a>
        </div>
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
