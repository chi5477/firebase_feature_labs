import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordExperiment extends StatefulWidget {
  const EmailPasswordExperiment({super.key});

  @override
  State<EmailPasswordExperiment> createState() =>
      _EmailPasswordExperimentState();
}

class _EmailPasswordExperimentState extends State<EmailPasswordExperiment> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  String _status = '';
  String _currentUser = '';

  Future<void> _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text.trim(),
      );
      _updateCurrentUser();
      setState(() => _status = '註冊成功');
    } catch (e) {
      setState(() => _status = '註冊失敗: $e');
    }
  }

  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text.trim(),
      );
      _updateCurrentUser();
      setState(() => _status = '登入成功');
    } catch (e) {
      setState(() => _status = '登入失敗: $e');
    }
  }

  void _updateCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? 'unknown';
    final uid = user?.uid ?? 'unknown';
    setState(() => _currentUser = 'Email: $email\nUID: $uid');
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
            '實驗 01：Email/Password 登入',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          Row(
            children: [
              ElevatedButton(onPressed: _signUp, child: const Text('註冊')),
              const SizedBox(width: 8),
              ElevatedButton(onPressed: _signIn, child: const Text('登入')),
            ],
          ),
          const SizedBox(height: 12),
          Text(_status),
          const SizedBox(height: 8),
          Text(_currentUser),
        ],
      ),
    );
  }
}
