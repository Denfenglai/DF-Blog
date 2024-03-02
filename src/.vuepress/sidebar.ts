import { sidebar } from "vuepress-theme-hope";

export default sidebar({
  "/": [
    "",
    {
      text: "ACG",
      icon: "book",
      prefix: "acg/",
      children: "structure",
    },
    {
      text: "文章",
      icon: "book",
      prefix: "docs/",
      children: "structure",
    },
  ],
});