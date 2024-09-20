import 'package:flutter/material.dart';
import 'package:vector_ai/core/config/assets/app_images.dart';
import 'package:vector_ai/core/config/theme/app_colors.dart';
import 'package:vector_ai/presentation/main_page/chat.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AppImages.introBG))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "It's okay to not be okay. It's okay to ask for help.",
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 20,
                    fontFamily: 'Sedan'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const ChatPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(70),
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text(
                        "Lesgoooo",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Sedan',
                            fontSize: 28),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
