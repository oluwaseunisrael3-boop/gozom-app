import 'package:flutter/material.dart';
import 'theme.dart';

class RhemaPage extends StatefulWidget {
  const RhemaPage({Key? key}) : super(key: key);

  @override
  _RhemaPageState createState() => _RhemaPageState();
}

class _RhemaPageState extends State<RhemaPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GozomTheme.darkBg,
      appBar: AppBar(
        title: const Text("RHEMA & EVENTS PORTAL", style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 14)),
        backgroundColor: GozomTheme.deepBlue,
        iconTheme: const IconThemeData(color: GozomTheme.primaryGold),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: GozomTheme.primaryGold,
          labelColor: GozomTheme.primaryGold,
          unselectedLabelColor: GozomTheme.textMuted,
          tabs: const [
            Tab(text: "Declarations"),
            Tab(text: "Upcoming Programs"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDeclarationsTab(),
          _buildEventsTab(),
        ],
      ),
    );
  }

  Widget _buildDeclarationsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [GozomTheme.deepBlue, GozomTheme.cardBg],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: GozomTheme.primaryGold.withOpacity(0.2)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("DAILY PROPHETIC FIRE", style: TextStyle(color: GozomTheme.primaryGold, fontWeight: FontWeight.bold, fontSize: 11)),
              SizedBox(height: 14),
              Text(
                "“By the apostolic mandate governing this commission, I decree that every foundational chain holding back your speed is shattered today! Receive strange fire for unexplainable acceleration!”",
                style: TextStyle(color: Colors.white, fontSize: 16, height: 1.5, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEventsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: GozomTheme.cardBg, borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("GLOBAL PROPHETIC CONVERGENCE 2026", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text("June 24 - 26, 2026 | Lagos, Nigeria", style: TextStyle(color: GozomTheme.primaryGold, fontSize: 12)),
              const Divider(color: Colors.white10, height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: GozomTheme.primaryGold, foregroundColor: GozomTheme.darkBg, minimumSize: const Size(double.infinity, 38)),
                onPressed: () {},
                child: const Text("Register to Attend", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
