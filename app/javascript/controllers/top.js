import { createApp } from "vue";
import axios from "axios";

createApp({
  data() {
    return {
      posts: [],
      title: "",
    };
  },
  created() {},
  mounted() {
    axios
      .get("/api/posts")
      .then((response) => {
        this.posts = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    createNewImage() {
      axios
        .post("/api/posts", {
          title: this.title,
          note: "",
        })
        .then((response) => {
          this.posts.unshift(response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
}).mount("#image-genelate-body");
