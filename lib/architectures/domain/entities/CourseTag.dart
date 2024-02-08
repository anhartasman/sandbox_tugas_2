// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

/// A user of the application.
class CourseTag {
  final String name;
  final String color;
  const CourseTag({
    required this.name,
    required this.color,
  });

  CourseTag copyWith({
    String? name,
    String? color,
  }) {
    return CourseTag(
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'color': color,
    };
  }

  factory CourseTag.fromMap(Map<String, dynamic> map) {
    return CourseTag(
      name: map['name'] ?? '',
      color: map['color'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseTag.fromJson(String source) =>
      CourseTag.fromMap(json.decode(source));

  @override
  String toString() => 'CourseTag(name: $name, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseTag && other.name == name && other.color == color;
  }

  @override
  int get hashCode => name.hashCode ^ color.hashCode;
}
