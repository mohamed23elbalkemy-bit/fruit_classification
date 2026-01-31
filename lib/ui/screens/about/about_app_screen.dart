import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FFF6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "About App",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// APP ICON
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.apple,
                color: Colors.white,
                size: 50,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "Fruit Classifier",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "AI-Powered Quality Detection",
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 25),

            /// DESCRIPTION CARD
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Our advanced AI technology helps you classify fruits and assess their quality with high accuracy. Simply scan any fruit to get instant results and maintain a complete history of your classifications.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Version 1.0.0\n© 2025 Fruit Classifier Inc.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45),
            ),

            const Spacer(),

            /// CONTACT BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.email_outlined),
                label: const Text("Contact Us"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
