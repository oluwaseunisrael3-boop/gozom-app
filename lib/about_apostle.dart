import 'package:flutter/material.dart';
import 'theme.dart';

class AboutApostlePage extends StatelessWidget {
  const AboutApostlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GozomTheme.darkBg,
      appBar: AppBar(
        title: const Text(
          "THE MAN OF GOD",
          style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.5),
        ),
        backgroundColor: GozomTheme.deepBlue,
        elevation: 0,
        iconTheme: const IconThemeData(color: GozomTheme.primaryGold),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image Frame with Gold Accents
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 380,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: GozomTheme.deepBlue,
                    // Note: When compiling on your PC, replace this placeholder with your actual asset image path
                    image: DecorationImage(
                      image: AssetImage('assets/images/apostle_profile.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                // Gradient overlay to blend profile into background seamlessly
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        GozomTheme.darkBg.withOpacity(0.0),
                        GozomTheme.darkBg.withOpacity(0.8),
                        GozomTheme.darkBg,
                      ],
                    ),
                  ),
                ),
                // Title Floating Badge
                Positioned(
                  bottom: 10,
                  child: Column(
                    children: [
                      const Text(
                        "APOSTLE OLUWASEUN ISRAEL",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Visionary Leader, GOZOM International Ministries",
                        style: TextStyle(
                          color: GozomTheme.primaryGold,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _buildProfilePill("A Prophetic Voice to Nations"),
                  const SizedBox(height: 16),
                  const Text(
                    "Apostle Oluwaseun Israel is a profound minister of the Gospel, known globally for his unyielding dedication to the prophetic mandate. Raised with an urgent divine assignment for this generation, he carries a raw, supernatural fire that ignites souls, shatters yokes, and alters the spiritual destinies of individuals and territories alike.",
                    style: TextStyle(color: GozomTheme.textWhite, fontSize: 15, height: 1.6),
                  ),
                  const SizedBox(height: 24),
                  
                  _buildProfilePill("Unlocking Divine Destiny"),
                  const SizedBox(height: 16),
                  const Text(
                    "He is not just a leader; he operates as a spiritual midwife, gifted with apostolic precision to birth the latent potential and callings locked inside believers. Through his extensive library of revelatory books, masterclass tracks, and raw crusades, saints across the globe are being armed for the end-time harvest.",
                    style: TextStyle(color: GozomTheme.textWhite, fontSize: 15, height: 1.6),
                  ),
                  const SizedBox(height: 24),

                  // Quote Block Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: GozomTheme.cardBg,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: GozomTheme.primaryGold.withOpacity(0.2)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "“",
                          style: TextStyle(color: GozomTheme.primaryGold, fontSize: 40, fontFamily: 'serif', height: 0.7),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "A servant-heart combined with kingly authority, Apostle Israel embodies the fusion of deep, uncompromised prayer and strategic kingdom action, making him a true champion of Christ for our time.",
                            style: TextStyle(
                              color: GozomTheme.textMuted,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: GozomTheme.primaryGold.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: GozomTheme.primaryGold.withOpacity(0.3)),
      ),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: GozomTheme.primaryGold,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
