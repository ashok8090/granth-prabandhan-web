import 'package:flutter/material.dart';
import '../services/content_repository.dart';
import '../services/navigation_service.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('टॉपिक्स'),
        backgroundColor: const Color(0xFF5C1A1B),
        foregroundColor: const Color(0xFFF6F1E7),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: ContentRepository.topics.length,
        itemBuilder: (context, i) {
          final t = ContentRepository.topics[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ExpansionTile(
              title: Text(t.nameHi, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(t.description),
              children: [
                ...t.subTopics.map((sub) => ListTile(
                      title: Text(sub),
                      dense: true,
                      leading: const Icon(Icons.subdirectory_arrow_right, size: 18),
                    )),
                ListTile(
                  title: const Text('संबंधित ग्रंथ देखें'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () => NavigationService.openTopic(t.id),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
