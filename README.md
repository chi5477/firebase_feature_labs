# firebase_feature_labs

## Session 記錄
```bash
 codex resume 019b8e0b-148d-7ca3-bffa-95ed57c6731e
```

## 目的
- 以最小、可驗證的實驗熟悉 Firebase 各功能的流程與關鍵概念。
- 以 CLI 與 SDK 為主，建立可重現的操作與驗證方式。

## 實驗總覽
- [01-auth-email-password：Email/Password 登入](./01-auth-email-password/README.md)
- [02-auth-anonymous-link：匿名登入與轉正式帳號](./02-auth-anonymous-link/README.md)
- [03-auth-google-signin：Google 帳號登入](./03-auth-google-signin/README.md)

## 共通前置條件
- 已安裝 Firebase CLI。
- 已安裝 Flutter SDK。
- 已安裝 FlutterFire CLI（`dart pub global activate flutterfire_cli`）。
- 已準備 Firebase 專案可供連線與測試。
- 建議從 repo 根目錄執行 CLI 指令；若在子目錄執行，請使用 `--config ../firebase.json` 指向設定檔。
- 若使用真實專案，需在 Firebase Console 啟用對應的 Sign-in Method（例如 Email/Password、Anonymous）。
- 可改用 Firebase Auth Emulator 進行本機驗證，避免使用 Firebase Console；若需查看帳號列表，請用 Emulator UI。
- Flutter 專案僅需建立一次，建議放在 `flutter_app/`，所有實驗共用此專案。
- 實驗頁面放在 `flutter_app/lib/experiments/`，使用 TabBar 在同一 App 切換不同實驗。

## 一次性初始化流程
```bash
# 1) Firebase CLI 登入與專案確認（在 repo 根目錄）
# - 目的：讓 CLI 取得權限並確認可用專案清單
# - 結果：後續 Emulator/FlutterFire 會使用同一個專案
firebase login
firebase projects:list

# 2) 建立 Flutter 專案（在 repo 根目錄）
flutter create flutter_app

# 3) FlutterFire 設定（在 flutter_app/）
cd flutter_app
flutterfire configure
```


## 注意事項
- 不要貼出或提交任何 API key 或憑證。
- 所有實驗僅在工作目錄內讀寫，避免影響系統環境。
