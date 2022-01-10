<template>
  <div class="">
    <div
      class="m-4 p-4 h-auto divide-y divide-gray-400 bg-white rounded-md shadow"
    >
      <div class="">
        <label class="form-text pb-4">タイトル</label><br />
        <textarea
          name="post.title"
          type="text"
          v-model="post.title"
          class="post-title placeholder-gray-800 border w-full"
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
          class="post-content placeholder-gray-800 border w-full"
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

        <div class="py-4 flex justify-center">
          <div
            class="btn cursor-pointer px-3 py-2 bg-gray-500 text-white font-semibold rounded hover:bg-gray-700"
            v-on:click="updatePost(post.id)"
          >
            更新
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";

export default {
  components: { "v-select": vSelect },
  data() {
    return {
      id: this.$route.params.id,
      options: ["筋トレ", "食事", "その他"],
      post: {
        title: "",
        content: "",
        tag: "",
      },
    };
  },
  mounted: function () {
    this.setpostEdit(this.id);
  },
  methods: {
    setpostEdit(id) {
      axios.get(`api/v1/posts/${id}`).then((res) => {
        this.post.id = res.data.id;
        this.post.title = res.data.title;
        this.post.content = res.data.content;
        this.post.tag = res.data.tag;
      });
    },
    updatePost(id) {
      if (!this.post.title) return;
      axios.put(`/api/v1/posts/${id}`, { post: this.post }).then(
        (res) => {
          this.$router.push({ path: "/" });
        },
        (error) => {
          console.log(error);
        }
      );
    },
  },
};
</script>
