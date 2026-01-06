# Email/Password 登入（Flutter）

## 範圍說明
- 本文件涵蓋 Firebase Authentication 的 Email/Password 登入流程。
- Email/Password 是 Firebase Authentication 的帳號密碼登入功能。

## 語言/版本
- Flutter (Dart)
- Firebase Auth SDK (FlutterFire)
- Firebase CLI
- FlutterFire CLI

## 實驗 1.1：Email/Password 註冊與登入
### 目的
- 用 Flutter 完成 Email/Password 註冊與登入。
- 驗證登入後的使用者資訊可被讀取。

### 前置需求
- 已在 `flutter_app/` 建立 Flutter 專案並完成 `flutterfire configure`。
- 若使用真實專案：需在 Firebase Console 啟用 Email/Password Sign-in Method。
- 若盡量不開瀏覽器：可使用 Firebase Auth Emulator 進行本機驗證。
 - 若使用 Emulator，請先完成「Emulators 初始化選擇」。

### Emulators 初始化選擇（只做登入/Auth）
1. 只做登入/Auth，採本機 Emulator：
```bash
firebase init emulators
```
2. 依提示選擇專案：
   - `Use an existing project`
   - `Create a new project`
   - `Add Firebase to an existing Google Cloud Platform project`
   - `Don't set up a default project`
3. 進入 Emulators Setup 後，勾選 **Authentication Emulator**（視需求可加 Firestore/Functions）。

### 步驟
1. 安裝依賴：
```bash
cd ../flutter_app
flutter pub add firebase_core firebase_auth
```

2. 初始化 Firebase（`flutter_app/lib/main.dart` 範例）：
```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
```

3. （可選）若使用 Auth Emulator，先在 repo 根目錄啟動：
```bash
cd ..
firebase emulators:start --only auth
```

4. （可選）在 App 連線 Emulator：
```dart
FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
```

5. 在 `flutter_app` 內加入註冊與登入（示意）：
```dart
final auth = FirebaseAuth.instance;

await auth.createUserWithEmailAndPassword(
  email: email,
  password: password,
);

await auth.signInWithEmailAndPassword(
  email: email,
  password: password,
);
```

6. 取得登入後使用者資訊（示意）：
```dart
final user = FirebaseAuth.instance.currentUser;
final email = user?.email;
```

### 成功判斷
- 註冊與登入皆成功。
- `currentUser` 可取得 email 或 uid。
- 若使用 Emulator，Emulator 內能看到新增帳號。

## 失敗排查（選填）
- 若出現 `operation-not-allowed`，確認 Email/Password 已在 Console 啟用。
- 若出現 `invalid-api-key`，檢查 Firebase 設定是否正確。
- 若 Emulator 連線失敗，確認 emulator 是否啟動且埠號正確。

## 參考連結（選填）
- Firebase Auth：<fill-link>
