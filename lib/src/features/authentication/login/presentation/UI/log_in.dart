import 'package:flutter/material.dart';

import '../../data/repo_impl/repo_impl.dart';


class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.ac_unit),
          onPressed: () async {
            await LogInRepoImpl().launchZohoLogin();
          },
        ),
      ),
    );
  }
}
