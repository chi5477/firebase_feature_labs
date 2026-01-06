import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnonymousLinkExperiment extends StatefulWidget {
  const AnonymousLinkExperiment({super.key});

  @override
  State<AnonymousLinkExperiment> createState() =>
      _AnonymousLinkExperimentState();
}

class _AnonymousLinkExperimentState extends State<AnonymousLinkExperiment> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  String _status = '';

  Future<void> _signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      final uid = userCredential.user?.uid ?? 'unknown';
      setState(() => _status = '匿名登入成功\nUID: $uid');
    } on FirebaseAuthException catch (e) {
      setState(() => _status = '匿名登入失敗: ${e.code}');
    }
  }

  Future<void> _linkWithEmailPassword() async {
    try {
      final credential = EmailAuthProvider.credential(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text.trim(),
      );
      await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
      final uid = FirebaseAuth.instance.currentUser?.uid ?? 'unknown';
      setState(() => _status = '連結成功\nUID: $uid');
    } on FirebaseAuthException catch (e) {
      setState(() => _status = '連結失敗: ${e.code}');
    }
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '實驗 02：匿名登入與轉正式帳號',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _signInAnonymously,
            child: const Text('匿名登入'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _emailCtrl,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordCtrl,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _linkWithEmailPassword,
            child: const Text('連結為 Email/Password'),
          ),
          const SizedBox(height: 12),
          Text(_status),
        ],
      ),
    );
  }
}
