import 'package:flutter/material.dart';
import 'theme.dart';

class GozomHomePage extends StatelessWidget {
  const GozomHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GOZOM INTERNATIONAL",
          style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildVisionCard(),
          const SizedBox(height: 20),
          _buildSectionTitle("MINISTRY PORTALS"),
          _buildMenuGrid(context),
        ],
      ),
    );
  }

  Widget _buildVisionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: GozomTheme.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: GozomTheme.primaryGold.withOpacity(0.3)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("OUR VISION", style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            "Raising a burning generation walking in fire, absolute excellence, royalty, and revival.",
            style: TextStyle(color: Colors.white, fontSize: 15, height: 1.4),
          ),
          SizedBox(height: 12),
          Text("— Apostle Oluwaseun Israel", style: TextStyle(color: GozomTheme.primaryGold, fontSize: 12, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      style: TextStyle(color: GozomTheme.textMuted, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 12),
      child: Text(title),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"title": "Academy", "icon": Icons.school},
      {"title": "Bookstore", "icon": Icons.menu_book},
      {"title": "Rhema Portal", "icon": Icons.bolt},
      {"title": "Partnership", "icon": Icons.volunteer_activism},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.3,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: GozomTheme.cardBg, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(items[index]["icon"], color: GozomTheme.primaryGold, size: 28),
              const SizedBox(height: 8),
              Text(items[index]["title"], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        );
      },
    );
  }
}
