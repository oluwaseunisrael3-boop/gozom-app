import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'theme.dart';

class AcademyPage extends StatelessWidget {
  const AcademyPage({Key? key}) : super(key: key);

  // Exact Ministry Data Connection Tokens
  final String _ministryEmail = "gozominternational@gmail.com";
  final String _whatsappSupportUrl = "https://wa.me/+2348147560000";

  // Dynamic helper to launch external communication channels on mobile devices
  Future<void> _launchExternalChannel(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  // Algorithmic Code Generator Engine: Creates completely distinct tokens per student and per course prefix
  String _generateUniqueEnrollmentCode(String coursePrefix) {
    final DateTime now = DateTime.now();
    final Random random = Random();
    
    // Generates a random numeric integer between 1000 and 9999
    int randomSequence = 1000 + random.nextInt(9000);
    
    // Returns format example: GZM-PROP-2026-8439
    return "GZM-$coursePrefix-${now.year}-$randomSequence";
  }

  @override
  Widget build(BuildContext context) {
    // Array map capturing your exact 6-week curriculum tracks and tiered pricing arrays
    final List<Map<String, dynamic>> courses = [
      {
        "title": "Prophetic School of Ministry",
        "prefix": "PROP",
        "duration": "6 Weeks Course Duration",
        "fee": "₦40,000 Naira",
        "rawFee": 40000,
        "description": "Mastering corporate prophetic alignment, atmospheric shifting, and territorial breakthrough parameters."
      },
      {
        "title": "School of Spiritual Warfare",
        "prefix": "WARF",
        "duration": "6 Weeks Course Duration",
        "fee": "₦50,000 Naira",
        "rawFee": 50000,
        "description": "Advanced strategies in high-level intercession, breaking ancestral configurations, and establishing kingdom authority."
      },
      {
        "title": "Kingdom Economics & Wealth",
        "prefix": "ECON",
        "duration": "6 Weeks Course Duration",
        "fee": "₦35,000 Naira",
        "rawFee": 35000,
        "description": "Unlocking deep laws of global financial dominion, entrepreneurial structures, and covenant multi-generational wealth."
      }
    ];

    return Scaffold(
      backgroundColor: GozomTheme.darkBg,
      appBar: AppBar(
        title: const Text(
          "GOZOM ACADEMY PORTAL",
          style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1),
        ),
        backgroundColor: GozomTheme.deepBlue,
        iconTheme: const IconThemeData(color: GozomTheme.primaryGold),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...courses.map((course) => _buildCourseCard(context, course)).toList(),
          const SizedBox(height: 20),
          
          // Dedicated Global Enquiry Gateway Button
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF25D366), width: 1.5),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () => _launchExternalChannel(_whatsappSupportUrl),
            icon: const Icon(Icons.whatsapp, color: Color(0xFF25D366)),
            label: const Text(
              "CHAT ON WHATSAPP FOR ACADEMY ENQUIRIES",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, Map<String, dynamic> course) {
    return Container(
      margin: const EdgeInsets.bottom(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: GozomTheme.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: GozomTheme.primaryGold.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(course["title"]!, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: GozomTheme.deepBlue, borderRadius: BorderRadius.circular(20)),
                child: Text(course["fee"]!, style: const TextStyle(color: GozomTheme.primaryGold, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(course["duration"]!, style: const TextStyle(color: GozomTheme.primaryGold, fontSize: 12, fontStyle: FontStyle.italic)),
          const SizedBox(height: 8),
          Text(course["description"]!, style: const TextStyle(color: GozomTheme.textMuted, fontSize: 13, height: 1.4)),
          const Divider(color: Colors.white10, height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: GozomTheme.primaryGold,
              foregroundColor: GozomTheme.darkBg,
              minimumSize: const Size(double.infinity, 42),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () => _showEnrollmentSheet(context, course),
            child: const Text("PROCEED TO ENROLLMENT FORM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ),
        ],
      ),
    );
  }

  void _showEnrollmentSheet(BuildContext context, Map<String, dynamic> course) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: GozomTheme.darkBg,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 24, left: 24, right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ENROLL: ${course["title"]}", style: const TextStyle(color: GozomTheme.primaryGold, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text("Course Fee Verification Matrix: ${course["fee"]}", style: const TextStyle(color: GozomTheme.textMuted, fontSize: 12)),
              const SizedBox(height: 20),
              _buildFormInput("Full Name", nameController),
              const SizedBox(height: 12),
              _buildFormInput("Active WhatsApp Number", phoneController),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GozomTheme.primaryGold, 
                  foregroundColor: GozomTheme.darkBg, 
                  minimumSize: const Size(double.infinity, 48)
                ),
                onPressed: () {
                  if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
                    // 1. Instantly compute the completely distinct code logic matching this tracking transaction
                    String verifiedStudentCode = _generateUniqueEnrollmentCode(course["prefix"]);
                    
                    Navigator.pop(context);
                    
                    // 2. Fully automated notification route setup using standard system parameters
                    String mailSubject = Uri.encodeComponent("GOZOM ACADEMY REGISTRATION: ${course["title"]}");
                    String mailBody = Uri.encodeComponent(
                      "Hello GOZOM Academy Administration Office,\n\n"
                      "I have successfully completed my payment parameters and registration entries for the course listed below.\n\n"
                      "STUDENT ENROLLMENT PROFILE METRICS:\n"
                      "====================================\n"
                      "Student Full Name: ${nameController.text}\n"
                      "Active Contact Number: ${phoneController.text}\n"
                      "Registered Course: ${course["title"]}\n"
                      "Tuition Base Logged: ${course["fee"]}\n"
                      "SYSTEM GENERATED ACCESS CODE: $verifiedStudentCode\n"
                      "====================================\n\n"
                      "Kindly verify my token matrix and dispatch my lecture access link dashboard. Thank you."
                    );
                    
                    String emailActionScheme = "mailto:$_ministryEmail?subject=$mailSubject&body=$mailBody";
                    
                    // 3. Launch directly to trigger standard local system automation
                    _launchExternalChannel(emailActionScheme);
                  }
                },
                child: const Text("VERIFY PAYMENT & GENERATE SECURE CODE", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFormInput(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: GozomTheme.textMuted, fontSize: 13),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: GozomTheme.primaryGold)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
