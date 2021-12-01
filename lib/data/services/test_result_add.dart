class Test {
  Test({required this.title, required this.genre});

  Test.fromJson(Map<String, Object?> json)
      : this(
    title: json['title']! as String,
    genre: json['genre']! as String,
  );

  final String title;
  final String genre;

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'genre': genre,
    };
  }
}