# taxi-stand-system-frontend
タクシー乗り場の可視化・効率化システムのフロントエンド。  
## 環境構築  
1.bicycle-system-frontendディレクトリに移動
```
cd taxi-stand-system-frontend
```
2.Dockerイメージのビルド
```
docker compose up -d --build  
```
3.コンテナに入る
```
docker container exec -it taxi-stand-system-frontend-nuxt-1 bash
```
4.モジュールをインストール
```
yarn install
```
5.サーバーを起動
```
yarn dev
```
