import 'package:flutter/material.dart';
import 'theme.dart';

class AcademyPage extends StatelessWidget {
  const AcademyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Array capturing your curriculum distribution
    final List<Map<String, String>> courses = [
      {"title": "Prophetic School of Ministry", "duration": "12 Weeks", "modules": "6 Modules"},
      {"title": "School of Spiritual Warfare", "duration": "8 Weeks", "modules": "4 Modules"},
      {"title": "Kingdom Economics & Wealth", "duration": "6 Weeks", "modules": "3 Modules"},
      {"title": "Apostolic Leadership Training", "duration": "10 Weeks", "modules": "5 Modules"},
    ];

    return Scaffold(
      backgroundColor: GozomTheme.darkBg,
      appBar: AppBar(
        title: const Text("GOZOM ACADEMY", style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 14)),
        backgroundColor: GozomTheme.deepBlue,
        iconTheme: const IconThemeData(color: GozomTheme.primaryGold),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Container(
            margin: const EdgeInsets.bottom(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: GozomTheme.cardBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course["title"]!, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, color: GozomTheme.primaryGold, size: 14),
                    const SizedBox(width: 4),
                    Text(course["duration"]!, style: const TextStyle(color: GozomTheme.textMuted, fontSize: 12)),
                    const SizedBox(width: 16),
                    Icon(Icons.layers, color: GozomTheme.primaryGold, size: 14),
                    const SizedBox(width: 4),
                    Text(course["modules"]!, style: const TextStyle(color: GozomTheme.textMuted, fontSize: 12)),
                  ],
                ),
                const Divider(color: Colors.white10, height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: GozomTheme.primaryGold,
                    side: const BorderSide(color: GozomTheme.primaryGold),
                    minimumSize: const Size(double.infinity, 36),
                  ),
                  onPressed: () {},
                  child: const Text("View Curriculum & Enroll", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
