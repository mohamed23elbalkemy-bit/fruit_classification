import 'dart:io';
import 'package:flutter/material.dart';

import 'data/history_storage.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FFF6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF3FFF6),
        title: const Text(
          "Classification History",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: HistoryStorage.history.length,
        itemBuilder: (context, index) {
          final item = HistoryStorage.history[index];

          return _historyItem(
            image: item.imagePath,
            name: item.name,
            grade: item.grade,
            gradeColor:
            item.grade == "First Grade" ? Colors.green : Colors.orange,
            date:
            "${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year}",
            time:
            "${item.dateTime.hour}:${item.dateTime.minute.toString().padLeft(2, '0')}",
          );
        },
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
            child: Image.file(
              File(image),
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
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
              Text(
                time,
                style:
                const TextStyle(fontSize: 11, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
