<template>
  <div class="relative hover:bg-gray-100 active:bg-gray-200">
    <div v-for="user in users" :key="user.id">
      <a v-bind:href="'users/' + user.id">
        <div class="text-sm flex justify-between items-center px-4 pt-4">
          <div class="flex display-start items-center">
            <img
              v-if="user.image_url"
              class="rounded-full h-16 w-16 flex items-center justify-center"
              v-bind:src="user.image_url"
            />
            <img
              v-else
              class="rounded-full h-16 w-16 flex items-center justify-center"
              v-bind:src="require('./images/default.png')"
            />

            <h3 class="px-4 pt-4 text-xl">{{ user.name }}</h3>
          </div>
        </div>

        <h3 class="px-4 pt-4 text-xl">
          <i class="fas fa-fist-raised"></i> トレーニング歴：{{
            user.experience
          }}年
        </h3>
        <div class="px-4 pt-4 text-xl">
          <i class="fas fa-id-card"></i> プロフィール：
        </div>
        <p class="p-4 flex items-center">{{ user.profile }}</p>
      </a>
    </div>
  </div>
</template>

<style scoped lang="scss">
// .user-wrapper {
//   margin: 0px 300px;
//   & a {
//     text-decoration: none;
//     overflow: hidden;
//   }
// }

// .user-card {
//   text-align: center;
//   width: 100%;
// }
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
