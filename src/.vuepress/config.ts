import { defineUserConfig } from "vuepress";
import theme from "./theme.js";

export default defineUserConfig({
  base: "/",

  lang: "zh-CN",
  title: "等风来的博客",
  description: "等风来的博客",

  theme,

  head: [
    [
      "script",
      {
        src: "https://cloud.umami.is/script.js",
        defer: true,
        "data-website-id": "ef51c282-79b3-4121-873b-1c81afc89449",
      },
    ],
  ],
});
