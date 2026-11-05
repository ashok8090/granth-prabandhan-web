class Granth {
  final String id;
  final String title;
  final String titleHi;
  final String author;
  final String description;
  final String category;
  final int chapters;
  final String coverColor;

  const Granth({
    required this.id,
    required this.title,
    required this.titleHi,
    required this.author,
    required this.description,
    required this.category,
    required this.chapters,
    this.coverColor = '#5C1A1B',
  });
}

class Topic {
  final String id;
  final String name;
  final String nameHi;
  final String description;
  final List<String> granthIds;
  final List<String> subTopics;

  const Topic({
    required this.id,
    required this.name,
    required this.nameHi,
    required this.description,
    required this.granthIds,
    this.subTopics = const [],
  });
}
