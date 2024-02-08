// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

/// A user of the application.
class CourseAudio {
  final String title;
  final String duration;
  const CourseAudio({
    required this.title,
    required this.duration,
  });

  CourseAudio copyWith({
    String? title,
    String? duration,
  }) {
    return CourseAudio(
      title: title ?? this.title,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'duration': duration,
    };
  }

  factory CourseAudio.fromMap(Map<String, dynamic> map) {
    return CourseAudio(
      title: map['title'] ?? '',
      duration: map['duration'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseAudio.fromJson(String source) =>
      CourseAudio.fromMap(json.decode(source));

  @override
  String toString() => 'CourseAudio(title: $title, duration: $duration)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseAudio &&
        other.title == title &&
        other.duration == duration;
  }

  @override
  int get hashCode => title.hashCode ^ duration.hashCode;
}
