# Google 帳號登入（Flutter）

## 範圍說明
- 本文件涵蓋 Firebase Authentication 的 Google 帳號登入流程。
- Google 登入屬於 Firebase Authentication 的 OAuth 社群登入功能。

## 語言/版本
- Flutter (Dart)
- Firebase Auth SDK (FlutterFire)
- Firebase CLI
- FlutterFire CLI

## 實驗 3.1：Google 登入（基本流程）
### 目的
- 使用 Google 帳號完成登入，取得使用者資訊。

### 前置需求
- 已在 `flutter_app/` 建立 Flutter 專案並完成 `flutterfire configure`。
- 需在 Firebase Console 啟用 Google Sign-in Method，並完成平台設定（Android/iOS）。

### 步驟
1. 安裝 Google Sign-In 套件：
```bash
flutter pub add google_sign_in
```

2. 在實驗頁加入 Google 登入流程（示意）：
```dart
// TODO: 加入 Google Sign-In 流程
```

### 成功判斷
- 使用 Google 帳號登入成功。
- `currentUser` 可取得 email 或 uid。

## 失敗排查（選填）
- 若無法彈出 Google 登入頁，確認平台設定是否完成。
- 若出現 `operation-not-allowed`，確認 Google Provider 已啟用。

## 參考連結（選填）
- Firebase Auth（Google Sign-In）：https://firebase.google.com/docs/auth/flutter/google-signin
