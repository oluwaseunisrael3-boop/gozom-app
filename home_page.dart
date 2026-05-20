import 'package:flutter/material.dart';
import 'theme.dart';
import 'about_apostle.dart';
import 'bookstore_page.dart';

class GozomHomePage extends StatelessWidget {
  const GozomHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GozomTheme.darkBg,
      appBar: AppBar(
        title: const Text(
          "GOZOM INTERNATIONAL",
          style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 1),
        ),
        backgroundColor: GozomTheme.deepBlue,
        elevation: 0,
        centerTitle: false,
        actions: [
          // Quick profile shortcut icon to see the Apostle's bio
          IconButton(
            icon: const Icon(Icons.account_circle, color: GozomTheme.primaryGold, size: 28),
            tooltip: "Meet Apostle Oluwaseun Israel",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutApostlePage()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildVisionCard(context),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Text(
              "MINISTRY ENCOUNTER PORTALS",
              style: TextStyle(color: GozomTheme.textMuted, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 11),
            ),
          ),
          const SizedBox(height: 12),
          _buildMenuGrid(context),
        ],
      ),
    );
  }

  Widget _buildVisionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: GozomTheme.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: GozomTheme.primaryGold.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.local_fire_department, color: GozomTheme.primaryGold, size: 18),
              const SizedBox(width: 6),
              const Text("THE MANDATE", style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1)),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "Raising a burning generation walking in fire, absolute excellence, royalty, and revival.",
            style: TextStyle(color: Colors.white, fontSize: 15, height: 1.5, fontWeight: FontWeight.w500),
          ),
          const Divider(color: Colors.white10, height: 24),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutApostlePage()),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Meet Apostle Oluwaseun Israel", style: TextStyle(color: GozomTheme.primaryGold, fontSize: 13, fontWeight: FontWeight.w600)),
                Icon(Icons.arrow_forward_ios, color: GozomTheme.primaryGold, size: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        "title": "Bookstore", 
        "icon": Icons.menu_book, 
        "page": const BookstorePage()
      },
      {
        "title": "Academy", 
        "icon": Icons.school, 
        "page": null 
      },
      {
        "title": "Rhema Portal", 
        "icon": Icons.bolt, 
        "page": null
      },
      {
        "title": "Partnership", 
        "icon": Icons.volunteer_activism, 
        "page": null
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.25,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () {
            if (item["page"] != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item["page"]),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${item["title"]} portal module structure is locked in codebase safely."),
                  backgroundColor: GozomTheme.deepBlue,
                ),
              );
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: GozomTheme.cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.03)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item["icon"], color: GozomTheme.primaryGold, size: 32),
                const SizedBox(height: 10),
                Text(
                  item["title"],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
