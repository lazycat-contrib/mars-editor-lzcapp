# mars-editor-lzcapp

[火星编辑器](https://github.com/whyubel1eve/Mars-Editor-Web) 的 LazyCat LPK 打包 —— 公众号 Markdown 排版工具（纯静态站）。

## 形态

- 纯静态：Vite 构建 `dist/`，`file:///lzcapp/pkg/content/` 直出
- 全部在浏览器本地运行，文稿不上传服务器
- 发布目标：**双商店**（官方商店 + 喵喵商店）

## 版本策略

上游没有 release tag 和镜像，只有 main 分支，因此按每日 patch 递增自动跟版。

## 官方商店要求（已满足）

| 要求 | 处理 |
|------|------|
| 上传/下载接文件选择器 | 注入 lzc-file-chooser-inject.js（图片导入、长图导出） |
| 图标不超过 200 KB | 512x512 PNG，约 35 KB（上游印章字标「火」） |
| 截图（PC 2-8 张） | 2 张本地构建后实拍截图 |
| 仅 PC 平台 | unsupported_platforms: ios, android, tvos |
| 无密码体系 | 纯前端工具，无需登录 |
