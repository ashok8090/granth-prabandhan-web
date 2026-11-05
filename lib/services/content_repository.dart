import '../models/content.dart';

class ContentRepository {
  static final List<Granth> granths = [
    const Granth(
      id: 'gita',
      title: 'Bhagavad Gita',
      titleHi: 'भगवद्गीता',
      author: 'महर्षि वेदव्यास',
      description: 'श्रीकृष्ण और अर्जुन का संवाद। धर्म, कर्म और मोक्ष का शास्त्र।',
      category: 'उपनिषद / स्मृति',
      chapters: 18,
      coverColor: '#5C1A1B',
    ),
    const Granth(
      id: 'ramayana',
      title: 'Valmiki Ramayana',
      titleHi: 'वाल्मीकि रामायण',
      author: 'महर्षि वाल्मीकि',
      description: 'श्रीराम की कथा। आदर्श पुरुष, धर्म और मर्यादा का महाकाव्य।',
      category: 'इतिहास',
      chapters: 7,
      coverColor: '#C47A2C',
    ),
    const Granth(
      id: 'mahabharata',
      title: 'Mahabharata',
      titleHi: 'महाभारत',
      author: 'महर्षि वेदव्यास',
      description: 'कुरुक्षेत्र युद्ध और धर्म की जटिलता का महाकाव्य।',
      category: 'इतिहास',
      chapters: 18,
      coverColor: '#1A120E',
    ),
    const Granth(
      id: 'upanishad',
      title: 'Principal Upanishads',
      titleHi: 'प्रमुख उपनिषद',
      author: 'ऋषिगण',
      description: 'ब्रह्मज्ञान, आत्मा और मोक्ष पर आधारित दार्शनिक ग्रंथ।',
      category: 'श्रुति',
      chapters: 10,
      coverColor: '#B0893E',
    ),
    const Granth(
      id: 'vedas',
      title: 'Rigveda',
      titleHi: 'ऋग्वेद',
      author: 'ऋषिगण',
      description: 'सबसे प्राचीन वेद। मंत्र, स्तुति और ज्ञान।',
      category: 'श्रुति',
      chapters: 10,
      coverColor: '#5C1A1B',
    ),
  ];

  static final List<Topic> topics = [
    const Topic(
      id: 'dharma',
      name: 'Dharma',
      nameHi: 'धर्म',
      description: 'कर्तव्य, न्याय और सदाचार।',
      granthIds: ['gita', 'ramayana', 'mahabharata'],
      subTopics: ['राजधर्म', 'आश्रम धर्म', 'वर्ण धर्म'],
    ),
    const Topic(
      id: 'karma',
      name: 'Karma',
      nameHi: 'कर्म',
      description: 'कर्म योग और फल।',
      granthIds: ['gita'],
      subTopics: ['निष्काम कर्म', 'कर्म बंधन'],
    ),
    const Topic(
      id: 'bhakti',
      name: 'Bhakti',
      nameHi: 'भक्ति',
      description: 'ईश्वर के प्रति प्रेम और समर्पण।',
      granthIds: ['gita', 'ramayana'],
      subTopics: ['नवधा भक्ति', 'प्रेम भक्ति'],
    ),
    const Topic(
      id: 'jnana',
      name: 'Jnana',
      nameHi: 'ज्ञान',
      description: 'आत्मज्ञान और ब्रह्मज्ञान।',
      granthIds: ['upanishad', 'gita'],
      subTopics: ['अद्वैत', 'सांख्य'],
    ),
  ];

  static Granth? getGranthById(String id) {
    try {
      return granths.firstWhere((g) => g.id == id);
    } catch (_) {
      return null;
    }
  }

  static List<Granth> getGranthsByTopic(String topicId) {
    final topic = topics.firstWhere((t) => t.id == topicId, orElse: () => topics.first);
    return granths.where((g) => topic.granthIds.contains(g.id)).toList();
  }
}
