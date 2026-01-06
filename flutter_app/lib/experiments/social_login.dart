import 'package:flutter/material.dart';
import 'social_login_google.dart';

class SocialLoginExperiment extends StatelessWidget {
  const SocialLoginExperiment({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('社群登入'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Google'),
              Tab(text: 'Facebook'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GoogleSignInExperiment(),
            Center(child: Text('Facebook 登入（待補）')),
          ],
        ),
      ),
    );
  }
}
