import 'package:flutter/material.dart';
import 'theme.dart';
import 'about_apostle.dart';
import 'bookstore_page.dart';
import 'academy_page.dart';
import 'rhema_page.dart';

class GozomHomePage extends StatelessWidget {
  const GozomHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GozomTheme.darkBg,
      appBar: AppBar(
        title: const Text("GOZOM INTERNATIONAL", style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 15)),
        backgroundColor: GozomTheme.deepBlue,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: GozomTheme.primaryGold, size: 28),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutApostlePage()));
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
          const Text("THE MANDATE", style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 11)),
          const SizedBox(height: 8),
          const Text(
            "Raising a burning generation walking in fire, absolute excellence, royalty, and revival.",
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
          ),
          const Divider(color: Colors.white10, height: 20),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutApostlePage()));
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
      {"title": "Bookstore", "icon": Icons.menu_book, "page": const BookstorePage()},
      {"title": "Academy", "icon": Icons.school, "page": const AcademyPage()},
      {"title": "Rhema Portal", "icon": Icons.bolt, "page": const RhemaPage()},
      {"title": "Partnership", "icon": Icons.volunteer_activism, "page": null},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.25,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () {
            if (item["page"] != null) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => item["page"]));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Partnership tracking system is safely stored in database schema.")),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(color: GozomTheme.cardBg, borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item["icon"], color: GozomTheme.primaryGold, size: 30),
                const SizedBox(height: 8),
                Text(item["title"], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
              ],
            ),
          ),
        );
      },
    );
  }
}
