import 'package:flutter/material.dart';
import '../services/content_repository.dart';
import '../services/navigation_service.dart';

class GranthDetailScreen extends StatelessWidget {
  final String granthId;
  const GranthDetailScreen({super.key, required this.granthId});

  @override
  Widget build(BuildContext context) {
    final g = ContentRepository.getGranthById(granthId);
    if (g == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('ग्रंथ')),
        body: const Center(child: Text('ग्रंथ नहीं मिला')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(g.titleHi),
        backgroundColor: const Color(0xFF5C1A1B),
        foregroundColor: const Color(0xFFF6F1E7),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(int.parse(g.coverColor.replaceFirst('#', '0xFF'))),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Text(
                g.titleHi,
                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Text(g.title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 8),
            Text('लेखक: ${g.author}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text('श्रेणी: ${g.category}', style: const TextStyle(fontSize: 15)),
            Text('${g.chapters} अध्याय', style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 16),
            const Text('विवरण', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(g.description, style: const TextStyle(fontSize: 16, height: 1.5)),
            const SizedBox(height: 24),
            const Text('अध्याय', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            ...List.generate(g.chapters > 8 ? 8 : g.chapters, (i) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 14,
                  backgroundColor: const Color(0xFFC47A2C),
                  child: Text('${i + 1}', style: const TextStyle(color: Colors.white, fontSize: 12)),
                ),
                title: Text('अध्याय ${i + 1}'),
                trailing: const Icon(Icons.play_circle_outline),
                onTap: () {
                  // Future: open chapter content / PDF
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class TopicDetailScreen extends StatelessWidget {
  final String topicId;
  const TopicDetailScreen({super.key, required this.topicId});

  @override
  Widget build(BuildContext context) {
    final topic = ContentRepository.topics.firstWhere(
      (t) => t.id == topicId,
      orElse: () => ContentRepository.topics.first,
    );
    final related = ContentRepository.getGranthsByTopic(topicId);

    return Scaffold(
      appBar: AppBar(
        title: Text(topic.nameHi),
        backgroundColor: const Color(0xFF5C1A1B),
        foregroundColor: const Color(0xFFF6F1E7),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(topic.description, style: const TextStyle(fontSize: 16, height: 1.4)),
          const SizedBox(height: 20),
          if (topic.subTopics.isNotEmpty) ...[
            const Text('उप-टॉपिक', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: topic.subTopics
                  .map((s) => Chip(label: Text(s), backgroundColor: const Color(0xFFF6F1E7)))
                  .toList(),
            ),
            const SizedBox(height: 20),
          ],
          const Text('संबंधित ग्रंथ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ...related.map((g) => Card(
                child: ListTile(
                  title: Text(g.titleHi, style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(g.author),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => NavigationService.openGranth(g.id),
                ),
              )),
        ],
      ),
    );
  }
}
