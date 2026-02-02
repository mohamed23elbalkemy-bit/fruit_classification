import 'dart:io';
import 'package:flutter/material.dart';

import 'data/history_storage.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

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
        actions: [
          if (HistoryStorage.history.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  HistoryStorage.clear();
                });
              },
            ),
        ],
      ),

      body: HistoryStorage.history.isEmpty
          ? const Center(
        child: Text(
          "No history yet",
          style: TextStyle(color: Colors.black54),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: HistoryStorage.history.length,
        itemBuilder: (context, index) {
          final item = HistoryStorage.history[index];

          return Dismissible(
            key: ValueKey(item.dateTime.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.delete, color: Colors.red),
            ),
            onDismissed: (_) {
              setState(() {
                HistoryStorage.removeAt(index);
              });
            },
            child: _historyItem(
              image: item.imagePath,
              name: item.name,
              grade: item.grade,
              gradeColor:
              item.grade == "First Grade" ? Colors.green : Colors.orange,
              date:
              "${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year}",
              time:
              "${item.dateTime.hour}:${item.dateTime.minute.toString().padLeft(2, '0')}",
            ),
          );
        },
      ),
    );
  }

  /// 👇👇👇 لازم تكون هنا 👇👇👇
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
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


