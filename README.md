# README
Storymoriのサーバーサイド実装

## DBの設定
```
cp .env.sample .env
```
`.env`の中身を自分のDBに合わせて修正する

* Ruby version
```
2.6.2
```

* Rails version
```
5.2.3
```

## 実装計画
### Api

```
- Get
  - /api/stories
  - storyデータの取得
- Post
  - /api/stories
  - storyデータ保存、保存時のvalidationエラーを返す
- Get
  - /api/stories/:story_id/pages/:page_id
  - storyに紐づくpageを取得
- Post
  - /api/stories/:story_id/pages/:parent_id/next
  - pageの保存、保存時のvalidationエラーを返す
```

### シーケンス図
![Imgur](https://i.imgur.com/BJqipqh.png)
