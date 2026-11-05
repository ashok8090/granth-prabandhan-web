import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('प्रोफाइल'),
        backgroundColor: const Color(0xFF5C1A1B),
        foregroundColor: const Color(0xFFF6F1E7),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFFC47A2C),
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('साधक', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 24),
          _tile(Icons.bookmark_outline, 'सहेजे गए ग्रंथ'),
          _tile(Icons.history, 'हाल में देखा'),
          _tile(Icons.download_outlined, 'डाउनलोड'),
          _tile(Icons.settings_outlined, 'सेटिंग्स'),
          _tile(Icons.info_outline, 'ऐप के बारे में'),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'Created by Faisal Rafi',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF5C1A1B)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
