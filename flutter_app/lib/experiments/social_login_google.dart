import 'package:flutter/material.dart';

class GoogleSignInExperiment extends StatelessWidget {
  const GoogleSignInExperiment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '實驗 03：Google 帳號登入',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text('請依 03-auth-google-signin/README.md 完成設定。'),
          SizedBox(height: 8),
          Text('TODO: 加入 Google Sign-In 實作'),
        ],
      ),
    );
  }
}
