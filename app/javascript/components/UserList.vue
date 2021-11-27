<template>
  <v-card class="user-wrapper">
    <v-col cols="16" v-for="user in users" :key="user.id">
      <v-container fluid>
        <v-row dense>
          <v-col>
            <v-card class="user-card">
              <a v-bind:href="'users/' + user.id">
                <v-img
                  v-if="user.image_url"
                  class="white--text align-end"
                  height="300px"
                  v-bind:src="user.image_url"
                >
                </v-img>
                <v-img
                  v-else
                  class="white--text align-end"
                  height="300px"
                  v-bind:src="require('./images/default.png')"
                >
                </v-img>
              </a>
              <h3>{{ user.name }}</h3>
              <h3>トレーニング歴：{{ user.experience }}年</h3>

              <v-card-actions>
                <v-btn color="orange lighten-2" text> プロフィール </v-btn>

                <v-spacer></v-spacer>

                <v-btn icon @click="show = !show">
                  <v-icon>{{
                    show ? "mdi-chevron-up" : "mdi-chevron-down"
                  }}</v-icon>
                </v-btn>
              </v-card-actions>

              <v-expand-transition>
                <div v-show="show">
                  <v-divider></v-divider>

                  <v-card-text>
                    <p>{{ user.profile }}</p>
                  </v-card-text>
                </div>
              </v-expand-transition>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-col>
  </v-card>
</template>

<style scoped lang="scss">
.user-wrapper {
  margin: 0px 300px;
  & a {
    text-decoration: none;
    overflow: hidden;
  }
}

.user-card {
  text-align: center;
  width: 100%;
}
</style>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
      show: false,
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
