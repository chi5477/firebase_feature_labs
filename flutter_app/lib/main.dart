import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'experiments/anonymous_link.dart';
import 'experiments/email_password.dart';
import 'experiments/social_login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 預設使用 Auth Emulator（請先啟動 emulator）
  FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Labs',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const ExperimentsHome(),
    );
  }
}

class ExperimentsHome extends StatelessWidget {
  const ExperimentsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Auth Labs'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Email/Password'),
              Tab(text: 'Anonymous Link'),
              Tab(text: 'Social Login'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EmailPasswordExperiment(),
            AnonymousLinkExperiment(),
            SocialLoginExperiment(),
          ],
        ),
      ),
    );
  }
}
