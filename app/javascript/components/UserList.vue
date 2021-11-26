<template>
  <v-row class="user-card">
    <v-col cols="3" v-for="user in users" :key="user.id">
      <a v-bind:href="'users/' + user.id">
        <v-card class="">
          <img
            v-if="user.image_url"
            class="user-image"
            v-bind:src="user.image_url"
          />
          <img
            v-else
            class="user-image"
            v-bind:src="require('./images/default.png')"
          />
          <h3>
            {{ user.name }}
          </h3>
          <h3>トレーニング歴：{{ user.experience }}年</h3>
          <p>{{ user.profile }}</p>
        </v-card>
      </a>
    </v-col>
  </v-row>
</template>

<style scoped lang="scss">
.user-image {
  height: 322px;
  width: 322px;
}
.user-card {
  text-align: center;
  & a {
    text-decoration: none;
    overflow: hidden;
  }
}
</style>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
      users: "users",
    };
  },
  mounted() {
    this.setUser();
  },
  methods: {
    setUser: function () {
      axios
        .get("/api/v1/users")
        .then((response) => (this.users = response.data));
    },
  },
};
</script>
