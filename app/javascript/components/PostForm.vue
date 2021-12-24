<template>
  <div class="">
    <div
      class="m-4 p-4 h-auto divide-y divide-gray-400 bg-white rounded-md shadow"
    >
      <div class="">
        <form v-on:submit.prevent="postItem()">
          <label class="form-text pb-4">タイトル</label><br />
          <textarea
            name="post.title"
            type="text"
            v-model="post.title"
            class="placeholder-gray-800 border w-full"
            label="タイトルを入力してください。"
            value=""
            placeholder="おすすめの大胸筋トレーニング"
          >
          </textarea>
          <label>投稿内容</label><br />
          <textarea
            name="post.content"
            type="area"
            v-model="post.content"
            class="placeholder-gray-800 border w-full"
            label="投稿内容を入力してください。"
            auto-grow
            value=""
            placeholder="インクラインダンベルフライ"
          >
          </textarea>
          <label class="form-text pb-4"> タグ </label>
          <v-select
            for="tag"
            placeholder="選択してください"
            name="post.tag"
            :options="options"
            v-model="post.tag"
            class="bg-white shadow appearance-none border rounded w-11/12 md:w-full text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:border-b-2 focus:border-blue-400 block mx-auto"
          ></v-select>
          <br />
          <label class="form-text pb-4">画像</label><br />
          <input
            name="uploadedImage"
            type="file"
            ref="file"
            v-on:change="onFileChange()"
          /><br />
          <div class="py-4 flex justify-center">
            <input
              type="submit"
              value="投稿"
              class="cursor-pointer px-3 py-2 bg-green-500 text-white font-semibold rounded hover:bg-blue-700"
              @click="dialog = false"
            />
          </div>
        </form>
      </div>
    </div>
  </div>
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
