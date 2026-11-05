import 'package:flutter/material.dart';
import '../services/content_repository.dart';
import '../services/navigation_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: const Text('तत्व · Granth', style: TextStyle(fontWeight: FontWeight.w600)),
              backgroundColor: const Color(0xFF5C1A1B),
              foregroundColor: const Color(0xFFF6F1E7),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Text(
                    'स्वागत है',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1A120E)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'हिंदू ग्रंथों का ज्ञान संग्रह',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 24),
                  const Text('प्रमुख ग्रंथ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: ContentRepository.granths.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, i) {
                        final g = ContentRepository.granths[i];
                        return GestureDetector(
                          onTap: () => NavigationService.openGranth(g.id),
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              color: Color(int.parse(g.coverColor.replaceFirst('#', '0xFF'))),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  g.titleHi,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${g.chapters} अध्याय',
                                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('टॉपिक्स', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  ...ContentRepository.topics.map((t) => Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(t.nameHi, style: const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: Text(t.description),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => NavigationService.openTopic(t.id),
                        ),
                      )),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
