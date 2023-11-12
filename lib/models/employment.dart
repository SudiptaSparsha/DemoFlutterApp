import 'dart:convert';

class Employment {
  final String title;
  final String keySkill;

  Employment({
    required this.title,
    required this.keySkill,
  });

  Employment copyWith({
    String? title,
    String? keySkill,
  }) =>
      Employment(
        title: title ?? this.title,
        keySkill: keySkill ?? this.keySkill,
      );

  factory Employment.fromRawJson(String str) =>
      Employment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Employment.fromJson(Map<String, dynamic> json) => Employment(
        title: json["title"],
        keySkill: json["key_skill"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "key_skill": keySkill,
      };
}
