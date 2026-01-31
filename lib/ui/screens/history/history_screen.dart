import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FFF6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF3FFF6),
        title: const Text(
          "Classification History",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "View all your past fruit classifications",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),

            _historyItem(
              image: "assets/images/apple_image.jpg",
              name: "Apple",
              grade: "First Grade",
              gradeColor: Colors.green,
              date: "Dec 10, 2025",
              time: "2:45 PM",
            ),

            _historyItem(
              image: "assets/images/orange_image.jpg",
              name: "Orange",
              grade: "First Grade",
              gradeColor: Colors.green,
              date: "Dec 10, 2025",
              time: "1:30 PM",
            ),

            _historyItem(
              image: "assets/images/banana_image.jpg",
              name: "Banana",
              grade: "Second Grade",
              gradeColor: Colors.orange,
              date: "Dec 9, 2025",
              time: "4:15 PM",
            ),
          ],
        ),
      ),
    );
  }

  Widget _historyItem({
    required String image,
    required String name,
    required String grade,
    required Color gradeColor,
    required String date,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, width: 55, height: 55, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: gradeColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    grade,
                    style: TextStyle(
                        color: gradeColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(date, style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 4),
              Text(time,
                  style:
                  const TextStyle(fontSize: 11, color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }
}
