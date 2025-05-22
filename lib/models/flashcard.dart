class Flashcard {
  final String id;
  final String question;
  final String answer;
  final bool isFavorite;
  final List<String> options;
  final int correctOptionIndex;
  final String context;

  const Flashcard({
    required this.id,
    required this.question,
    required this.answer,
    this.isFavorite = false,
    required this.options,
    required this.correctOptionIndex,
    this.context = '',
  });

  Flashcard copyWith({
    String? id,
    String? question,
    String? answer,
    bool? isFavorite,
    List<String>? options,
    int? correctOptionIndex,
    String? context,
  }) {
    return Flashcard(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      isFavorite: isFavorite ?? this.isFavorite,
      options: options ?? this.options,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      context: context ?? this.context,
    );
  }
} 