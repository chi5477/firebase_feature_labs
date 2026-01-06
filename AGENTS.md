# AGENTS.md（firebase_auth_labs）

本文件為本專案層級的 AI/Codex 行為規範。若與全域 `~/.codex/AGENTS.md` 衝突，**以本文件為優先**；但安全/危險操作限制仍應優先遵守。

---

## 1. 語言與溝通
- 與使用者互動預設使用繁體中文。
- 程式碼、API 名稱、錯誤訊息、JSON 欄位、環境變數可用英文。

---

## 2. 專案目標與範圍
- 本 repo 用於「Firebase 登入相關實驗」。
- 內容以文件與可重現實驗流程為主。

---

## 3. 專案結構
- 根目錄提供總覽與導覽：`README.md`
- 每個實驗子目錄以 `README.md` 說明步驟與驗證方式
- 實驗資料夾命名以遞增數字前綴（例如：`01-dns-basics`、`02-token-count`）

---

## 4. README 格式規範

### 4.1 根目錄 README.md（總覽用）
固定段落（順序如下）：
1. `# <Repository Name>`（單一 H1）
2. `## Session 記錄`（可用 code block）
3. `## 目的`
4. `## 實驗總覽`（列出子目錄與說明，使用相對路徑）
5. `## 共通前置條件`
6. `## 注意事項`

書寫規則：
- 標題層級不跳級
- 段落精簡
- 使用相對路徑連結子目錄（例如：`./01-xxx/README.md`）

### 4.2 子目錄 README.md（實驗/模組用）
固定段落（順序如下，可重複多個實驗區塊）：
1. `# <實驗名稱>`（單一 H1）
2. `## 範圍說明`
3. `## 語言/版本`（必填）
4. `## 實驗 X.Y：<標題>`
   - `### 目的`
   - `### 前置需求`
   - `### 步驟`
   - `### 成功判斷`
5. `## 失敗排查`（選填）
6. `## 參考連結`（選填）

書寫規則：
- 指令需用 code block
- 避免任何機密資訊
- 若有平台差異需分段（Windows / macOS / Linux）
- 內容以可重現為優先，避免含糊描述
- `## 範圍說明` 必須清楚說明該功能是 Firebase 的哪一類功能（例如：Emulator Suite 是本地模擬服務、App Distribution 是測試版發佈功能）

---

## 5. Build / Test
- 本 repo 以文件與實驗流程為主，**沒有統一 build/test 指令**。
- 若有執行步驟，請依各子目錄 `README.md` 為準。

---

## 6. Coding Style & Naming
- 文件使用 Markdown，標題層級清楚、段落精簡
- 檔名與路徑避免空白與特殊符號
- 行尾格式一律 LF（`\n`）

---

## 7. Git / Commit / PR
- Commit message 採 Conventional Commits：`<type>(optional scope): <description>`
  - 例：`docs: update experiment instructions`
- 若有 PR：建議包含變更摘要、測試方式、注意事項

---

## 8. 安全與限制（重申）
除非使用者明確要求，禁止：
- `git push` / 部署指令 / 刪除檔案或目錄
- 修改 CI/CD 設定
- 輸出或記錄機密資訊（API key / token 等）

---

## 9. 大任務工作流程
- 若需求屬「大任務」，需先提出計畫，取得使用者確認後再改檔。
