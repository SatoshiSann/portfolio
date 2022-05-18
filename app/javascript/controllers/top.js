import { createApp } from "vue";
const targetId = "#cards-list";
const element = document.querySelector(targetId);
if (element !== null) {
  const app = createApp({
    data() {
      return {
        posts: [
          {
            imageSrc: "/500x500.png",
            title: "カードのタイトル",
            note: "noteがずらずら",
          },
          {
            imageSrc: "/500x500.png",
            title: "カードのタイトル",
            note: "noteがずらずら",
          },
          {
            imageSrc: "/500x500.png",
            title: "カードのタイトル",
            note: "noteがずらずら",
          },
          {
            imageSrc: "/500x500.png",
            title: "カードのタイトル",
            note: "noteがずらずら",
          },
          {
            imageSrc: "/500x500.png",
            title: "カードのタイトル",
            note: "noteがずらずら",
          },
        ],
      };
    },
    created() {},
  });

  const vm = app.mount(targetId);
}
