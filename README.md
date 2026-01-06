# firebase_cli_labs

## Session 記錄
```bash
 codex resume 019b8e0b-148d-7ca3-bffa-95ed57c6731e
```

## 目的
- 以最小、可驗證的實驗熟悉 Firebase CLI 的核心能力與常見流程。
- 建立可重現的 CLI 操作與驗證方式。

## 實驗總覽
- 目前無實驗子目錄。

## 共通前置條件
- 已安裝 Firebase CLI。
- 已登入 Firebase CLI（`firebase login`）。
- 已在 repo 根目錄完成一次 `firebase init`，並保留根目錄的 `firebase.json`/`.firebaserc`。
- 已選定 Firebase 專案（`firebase use <project-id>` 或在 `firebase.json` 設定）。
- 建議從 repo 根目錄執行 CLI 指令；若在子目錄執行，請使用 `--config ../firebase.json` 指向設定檔。
- Firebase CLI 是用來管理 Firebase 專案與各種服務的命令列工具。
- 初始設定建議在 repo 根目錄完成：
```bash
firebase login
firebase init
firebase projects:list
firebase use <project-id>
```

## 注意事項
- 不要貼出或提交任何 API key 或憑證。
- 所有實驗僅在工作目錄內讀寫，避免影響系統環境。
