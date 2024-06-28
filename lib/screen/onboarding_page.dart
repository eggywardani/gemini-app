import 'package:flutter/material.dart';
import 'package:gemini_app/screen/home_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
            children: [
              Text(
                'Your AI assistant',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Using this App, you can get answers to your questions',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black45),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset('assets/logo.png'),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800], elevation: 0),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.white,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
