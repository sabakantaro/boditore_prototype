<template>
  <v-app>
    <v-row>
      <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn fixed bottom right v-bind="attrs" v-on="on">
            <v-icon x-large>mdi-send-circle</v-icon>
          </v-btn>
        </template>

        <v-card>
          <v-card-title>
            <v-layout justify-center>
              <span class="text-h5">新規投稿</span>
            </v-layout>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <form v-on:submit.prevent="postItem()">
                  <label>タイトル</label><br />
                  <v-textarea
                    name="post.title"
                    type="text"
                    v-model="post.title"
                    class="mt-0"
                    solo
                    label="タイトルを入力してください。"
                    auto-grow
                    rows="1"
                    value=""
                    placeholder="おすすめの大胸筋トレーニング"
                  >
                  </v-textarea>
                  <label>投稿内容</label><br />
                  <v-textarea
                    name="post.content"
                    type="area"
                    v-model="post.content"
                    class="mt-0"
                    solo
                    label="投稿内容を入力してください。"
                    auto-grow
                    rows="1"
                    value=""
                    placeholder="インクラインダンベルフライ"
                  >
                  </v-textarea>
                  <label>画像</label><br />
                  <input
                    name="uploadedImage"
                    type="file"
                    ref="file"
                    v-on:change="onFileChange()"
                  /><br />
                  <v-layout justify-center class="pt-5">
                    <v-btn
                      elevation="16"
                      class="font-weight-bold blue"
                      @click="dialog = false"
                    >
                      <input type="submit" value="投稿" />
                    </v-btn>
                  </v-layout>
                </form>
              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="red darken-1" text @click="dialog = false">
              <v-icon>mdi-close-box</v-icon>
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </v-app>
</template>

<script>
import axios from "axios";

const token = document
  .getElementsByName("csrf-token")[0]
  .getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;

export default {
  data() {
    return {
      dialog: false,
      post: {},
      uploadedImage: "",
    };
  },
  methods: {
    onFileChange() {
      let file = event.target.files[0] || event.dataTransfer.files;
      let reader = new FileReader();
      reader.onload = () => {
        this.uploadedImage = event.target.result;
        this.post.image = this.uploadedImage;
      };
      reader.readAsDataURL(file);
    },
    postItem() {
      return new Promise((resolve, _) => {
        axios({
          url: "api/v1/posts",
          data: {
            post: this.post,
          },
          method: "POST",
        })
          .then((res) => {
            this.post = {};
            this.uploadedImage = "";
            this.$refs.file.value = "";
            resolve(res);
          })
          .catch((e) => {
            console.log(e);
          });
      });
    },
  },
};
</script>
