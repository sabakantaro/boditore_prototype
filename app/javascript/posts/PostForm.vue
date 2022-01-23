<template>
  <div class="">
    <div
      class="m-4 p-4 h-auto divide-y divide-gray-400 bg-white rounded-md shadow"
    >
      <div class="">
        <p class="text-xs text-red-500 mb-2">
          {{ Validation.postValidate }}
        </p>
        <form v-on:submit.prevent="postItem()">
          <label class="form-text pb-4">タイトル</label><br />
          <textarea
            name="post.title"
            type="text"
            v-model="post.title"
            class="post-title placeholder-gray-300 border w-full"
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
            class="post-content placeholder-gray-300 border w-full"
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
            ref="preview"
            v-on:change="onFileChange()"
            id="image_upload"
          />
          <div v-if="url" class="py-4 flex justify-center">
            <img :src="url" class="w-full" />
          </div>
          <br />
          <div class="py-4 flex justify-center">
            <input
              type="submit"
              value="投稿"
              class="cursor-pointer px-3 py-2 bg-gray-500 text-white font-semibold rounded hover:bg-gray-700"
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
      url: "",
      dialog: false,
      post: {},
      uploadedImage: "",
      options: ["筋トレ", "食事", "その他"],
      Validation: {
        postValidate: "",
      },
    };
  },
  methods: {
    onFileChange() {
      let file = event.target.files[0] || event.dataTransfer.files;
      let reader = new FileReader();
      reader.onload = () => {
        const file = this.$refs.preview.files[0];
        this.url = URL.createObjectURL(file);
        this.uploadedImage = event.target.result;
        this.post.image = this.uploadedImage;
      };
      reader.readAsDataURL(file);
    },
    postItem() {
      var PostValidate = false;
      if (!this.post.title) {
        this.Validation.postValidate = "タイトルを入力してください";
      } else if (!this.post.content) {
        this.Validation.postValidate = "投稿内容を入力してください";
      } else if (!this.post.tag) {
        this.Validation.postValidate = "タグを選択してください";
      } else {
        PostValidate = true;
      }
      if (PostValidate == true) {
        return new Promise((resolve, _) => {
          axios({
            url: "api/v1/posts",
            data: {
              post: this.post,
            },
            method: "POST",
          })
            .then((res) => {
              this.$router.push({ path: "/" });
            })
            .catch((e) => {
              console.log(e);
            });
        });
      }
    },
  },
};
</script>
