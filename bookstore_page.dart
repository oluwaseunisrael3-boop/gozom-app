import 'package:flutter/material.dart';
import 'theme.dart';

class BookstorePage extends StatelessWidget {
  const BookstorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Array map capturing your exact book library collection
    final List<Map<String, String>> books = [
      {
        "title": "Where is the Church?",
        "subtitle": "A Prophetic Alarm",
        "description": "An urgent, revelatory message awakening the body of Christ to its true position and power in these end times.",
        "image": "assets/books/where_is_the_church.png"
      },
      {
        "title": "Kissed by Judas, Built by God",
        "subtitle": "How to Survive and Heal After Betrayal",
        "description": "A powerful manual for emotional and spiritual recovery, turning deep wounds into foundational stepping stones for destiny.",
        "image": "assets/books/kissed_by_judas.png"
      },
      {
        "title": "Understanding the Prophetic",
        "subtitle": "Activating Your Spiritual Sight",
        "description": "A deep dive into navigating the prophetic realm with scriptural accuracy, precision, and alignment with the Holy Spirit.",
        "image": "assets/books/understanding_the_prophetic.png"
      },
      {
        "title": "Secrets That Destroy",
        "subtitle": "Unveiling Hidden Truth to Overcome Chains",
        "description": "Exposing the roots of deception and strongholds to bring absolute liberation and victory to the believer.",
        "image": "assets/books/secrets_that_destroy.png"
      },
      {
        "title": "Discharged and Acquitted",
        "subtitle": "The Legal Triumph of Grace",
        "description": "Understanding your courtroom victories in the spirit realm through the finished work of the cross.",
        "image": "assets/books/discharged_and_acquitted.png"
      },
      {
        "title": "Clothed with Dominion",
        "subtitle": "Understanding Power and Authority",
        "description": "Stepping into the practical reality of kingdom governance, operating with uncompromised spiritual rank.",
        "image": "assets/books/clothed_with_dominion.png"
      },
      {
        "title": "The Power of Financial Wisdom",
        "subtitle": "Revealing Secrets to Kingdom Wealth",
        "description": "Unlocking the heavenly laws of economics and stewardship to fund the global end-time harvest.",
        "image": "assets/books/financial_wisdom.png"
      },
      {
        "title": "Young and Burning",
        "subtitle": "The Fire of Youth Devotion",
        "description": "A dynamic charge to a generation of young saints to live entirely set apart, carrying raw spiritual fire.",
        "image": "assets/books/young_and_burning.png"
      },
      {
        "title": "Breaking Free From Addiction",
        "subtitle": "Shattering the Chains",
        "description": "A supernatural guide delivering actionable truth and power to break every cycle of bondage permanently.",
        "image": "assets/books/breaking_free.png"
      }
    ];

    return Scaffold(
      backgroundColor: GozomTheme.darkBg,
      appBar: AppBar(
        title: const Text(
          "APOSTOLIC RESOURCE CENTER",
          style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1),
        ),
        backgroundColor: GozomTheme.deepBlue,
        iconTheme: const IconThemeData(color: GozomTheme.primaryGold),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Container(
            margin: const EdgeInsets.bottom(20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: GozomTheme.cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: GozomTheme.primaryGold.withOpacity(0.1)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Book Cover Artwork Frame
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    color: GozomTheme.deepBlue,
                    borderRadius: BorderRadius.circular(8),
                    // Note: This maps to your uploaded visual covers when built on PC
                    border: Border.all(color: Colors.white10),
                  ),
                  child: const Center(
                    child: Icon(Icons.book, color: GozomTheme.primaryGold, size: 36),
                  ),
                ),
                const SizedBox(width: 16),
                // Book Metadata & Ordering Actions
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book["title"]!,
                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book["subtitle"]!,
                        style: const TextStyle(color: GozomTheme.primaryGold, fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        book["description"]!,
                        style: const TextStyle(color: GozomTheme.textMuted, fontSize: 12, height: 1.4),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GozomTheme.primaryGold,
                          foregroundColor: GozomTheme.darkBg,
                          minimumSize: const Size(double.infinity, 36),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          // Will trigger digital download path or checkout gateway
                        },
                        child: const Text("Get Manuscript / Book", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
