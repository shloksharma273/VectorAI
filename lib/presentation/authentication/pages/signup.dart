import 'package:flutter/material.dart';

import '../../../core/config/assets/app_images.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit. ,
                image: AssetImage(AppImages.authBG),
              ),
            ),
          )
        ],
      ),
    );
  }
}
