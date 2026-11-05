import 'package:flutter/material.dart';
import '../services/content_repository.dart';
import '../services/navigation_service.dart';

class GranthsScreen extends StatelessWidget {
  const GranthsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ग्रंथ'),
        backgroundColor: const Color(0xFF5C1A1B),
        foregroundColor: const Color(0xFFF6F1E7),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: ContentRepository.granths.length,
        itemBuilder: (context, i) {
          final g = ContentRepository.granths[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(int.parse(g.coverColor.replaceFirst('#', '0xFF'))),
                child: Text(g.titleHi[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              title: Text(g.titleHi, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text('${g.author} • ${g.chapters} अध्याय'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => NavigationService.openGranth(g.id),
            ),
          );
        },
      ),
    );
  }
}
