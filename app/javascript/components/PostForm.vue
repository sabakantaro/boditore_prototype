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
                  <label> タグ </label>
                  <v-select
                    for="tag"
                    placeholder="選択してください"
                    name="post.tag"
                    :options="options"
                    v-model="post.tag"
                    class="
                      bg-white
                      shadow
                      appearance-none
                      border
                      rounded
                      w-11/12
                      md:w-full
                      text-gray-700
                      leading-tight
                      focus:outline-none
                      focus:shadow-outline
                      focus:border-b-2
                      focus:border-blue-400
                      block
                      mx-auto
                    "
                  ></v-select>
                  <!-- <label for="筋トレ">筋トレ</label>
                  <input
                    type="checkbox"
                    id="筋トレ"
                    value="筋トレ"
                    v-model="tag"
                  />
                  <label for="食事">食事</label>
                  <input
                    type="checkbox"
                    id="食事"
                    value="食事"
                    v-model="tag"
                  />
                  <label for="その他">その他</label>
                  <input
                    type="checkbox"
                    id="その他"
                    value="その他"
                    v-model="tag"
                  />
                  <br />
                  <div>回答：{{ tag }}</div> -->
                  <br />
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
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";

const token = document
  .getElementsByName("csrf-token")[0]
  .getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;

export default {
  components: { "v-select": vSelect },
  data() {
    return {
      dialog: false,
      post: {},
      uploadedImage: "",
      // tag: "",
      // postTag: "",
      options: ["筋トレ", "食事", "その他"],
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
