# ModSkeleton Modsを生成するためのカスタムビルドプロファイル

ModSkeleton ModsはUnreal Engine 4のDLCシステムを使って作られている。Modをcookしてパッケージするためには、二つのカスタムプロジェクトランチャープロファイルを作成しなければならない。一つは親となるゲームをビルドするためのもの、もう一つは親となるゲームのバージョンを参照しながら、DLC / Plugin / Modをビルドするためのものである。

## 1 - 親ゲーム用プロファイル

#### 1.1 - プロジェクトランチャーを開く

![Open Project Launcher](open_project_launcher.jpg)

#### 1.2 - 新しいカスタムプロファイルを作成する

![Create Custom Profile](new_profile.jpg)

#### 1.3 - プロファイルに名前をつける

![Name Profile](main_1_name.jpg)

#### 1.4 - ビルドするようプロファイルを設定する

![Build](main_2_build.jpg)

#### 1.5 - "By the Book"設定でクックするよう設定する

- クック対象とするプラットフォームを選択すること

![Cook By the Book](main_3_cook_book.jpg)

#### 1.6 - Cooking "Release" Settings

- "ディストリビューション用にゲームのリリースバージョンを作成"をチェック
- "作成する新しいリリースの名前"にバージョン名を入力

![Cook Release Settings](main_4_cook_release.jpg)

#### 1.7 - Cooking "Advanced" Settings

- "バージョン情報無しでパッケージを保存する"のチェックをはずす
- "全てのコンテンツを単一ファイル(UnrealPak)に格納します"をチェック

![Cook Advanced Settings](main_5_cook_advanced.jpg)

#### 1.8 - ローカル環境でパッケージ化するよう設定する

- ローカル環境にパッケージ化および格納を選択

![Package and Store Locally](main_6_package.jpg)

#### 1.9 - デプロイしないよう設定する

![Do Not Deploy](main_7_deploy.jpg)

## 2 - MOD用プロファイル (ModSkeletonExamplePluginA)

#### 2.1 - プロジェクトランチャーを開く

![Open Project Launcher](open_project_launcher.jpg)

#### 2.2 - 新しいカスタムプロファイルを作成する

![Create Custom Profile](new_profile.jpg)

#### 2.3 - プロファイルに名前をつける

![Name Profile](plugin_1_name.jpg)

#### 2.4 - ビルドするようプロファイルを設定する

![Build](main_2_build.jpg)

#### 2.5 - "By the Book"設定でクックするよう設定する

- cook対象とするプラットフォームを選択すること

![Cook By the Book](main_3_cook_book.jpg)

#### 2.6 - クックの"リリース"設定

- "ディストリビューション用にゲームのリリースバージョンを作成"のチェックをはずす
- "作成する新しいリリースの名前"を空欄にする
- "Release version this is based on."を先程設定した親ゲームのバージョン名に設定
- "DLCをビルド"をチェック
- "ビルドするDLCの名前"を"ModSkeletonExamplePluginA"に設定

![Cook Release Settings](plugin_4_cook_release.jpg)

#### 2.7 - クックの"詳細設定"

- "バージョン情報無しでパッケージを保存する"のチェックをはずす
- "全てのコンテンツを単一ファイル(UnrealPak)に格納します"をチェック

![Cook Advanced Settings](main_5_cook_advanced.jpg)

#### 2.8 - ローカル環境でパッケージ化するよう設定する

- ローカル環境にパッケージ化および格納を選択

![Package and Store Locally](main_6_package.jpg)

#### 2.9 - デプロイしないよう設定する

![Do Not Deploy](main_7_deploy.jpg)
