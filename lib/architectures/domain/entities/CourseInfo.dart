// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:course_flutter/architectures/domain/entities/CourseAudio.dart';
import 'package:course_flutter/architectures/domain/entities/CourseTag.dart';

/// A user of the application.
class CourseInfo {
  final String authorPict;
  final String authorName;
  final String authorTitle;
  final String courseName;
  final String courseImage;
  final String courseDuration;
  final String courseCategory;
  final String courseDescription;
  final List<CourseTag> tags;
  final List<CourseAudio> playlist;
  const CourseInfo({
    required this.authorPict,
    required this.authorName,
    required this.authorTitle,
    required this.courseName,
    required this.courseImage,
    required this.courseDuration,
    required this.courseCategory,
    required this.courseDescription,
    required this.tags,
    required this.playlist,
  });

  CourseInfo copyWith({
    String? authorPict,
    String? authorName,
    String? authorTitle,
    String? courseName,
    String? courseImage,
    String? courseDuration,
    String? courseCategory,
    String? courseDescription,
    List<CourseTag>? tags,
    List<CourseAudio>? playlist,
  }) {
    return CourseInfo(
      authorPict: authorPict ?? this.authorPict,
      authorName: authorName ?? this.authorName,
      authorTitle: authorTitle ?? this.authorTitle,
      courseName: courseName ?? this.courseName,
      courseImage: courseImage ?? this.courseImage,
      courseDuration: courseDuration ?? this.courseDuration,
      courseCategory: courseCategory ?? this.courseCategory,
      courseDescription: courseDescription ?? this.courseDescription,
      tags: tags ?? this.tags,
      playlist: playlist ?? this.playlist,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authorPict': authorPict,
      'authorName': authorName,
      'authorTitle': authorTitle,
      'courseName': courseName,
      'courseImage': courseImage,
      'courseDuration': courseDuration,
      'courseCategory': courseCategory,
      'courseDescription': courseDescription,
      'tags': tags.map((x) => x.toMap()).toList(),
      'playlist': playlist.map((x) => x.toMap()).toList(),
    };
  }

  factory CourseInfo.fromMap(Map<String, dynamic> map) {
    return CourseInfo(
      authorPict: map['authorPict'] ?? '',
      authorName: map['authorName'] ?? '',
      authorTitle: map['authorTitle'] ?? '',
      courseName: map['courseName'] ?? '',
      courseImage: map['courseImage'] ?? '',
      courseDuration: map['courseDuration'] ?? '',
      courseCategory: map['courseCategory'] ?? '',
      courseDescription: map['courseDescription'] ?? '',
      tags: List<CourseTag>.from(map['tags']?.map((x) => CourseTag.fromMap(x))),
      playlist: List<CourseAudio>.from(
          map['playlist']?.map((x) => CourseAudio.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseInfo.fromJson(String source) =>
      CourseInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseInfo(authorPict: $authorPict, authorName: $authorName, authorTitle: $authorTitle, courseName: $courseName, courseImage: $courseImage, courseDuration: $courseDuration, courseCategory: $courseCategory, courseDescription: $courseDescription, tags: $tags, playlist: $playlist)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseInfo &&
        other.authorPict == authorPict &&
        other.authorName == authorName &&
        other.authorTitle == authorTitle &&
        other.courseName == courseName &&
        other.courseImage == courseImage &&
        other.courseDuration == courseDuration &&
        other.courseCategory == courseCategory &&
        other.courseDescription == courseDescription &&
        listEquals(other.tags, tags) &&
        listEquals(other.playlist, playlist);
  }

  @override
  int get hashCode {
    return authorPict.hashCode ^
        authorName.hashCode ^
        authorTitle.hashCode ^
        courseName.hashCode ^
        courseImage.hashCode ^
        courseDuration.hashCode ^
        courseCategory.hashCode ^
        courseDescription.hashCode ^
        tags.hashCode ^
        playlist.hashCode;
  }
}
