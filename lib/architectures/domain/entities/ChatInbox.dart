// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

/// A user of the application.
class ChatInbox {
  final String userPict;
  final String userName;
  final String chatText;
  final int chatUnread;
  final DateTime chatDate;
  final bool isOnline;
  const ChatInbox({
    required this.userPict,
    required this.userName,
    required this.chatText,
    required this.chatUnread,
    required this.chatDate,
    required this.isOnline,
  });

  ChatInbox copyWith({
    String? userPict,
    String? userName,
    String? chatText,
    int? chatUnread,
    DateTime? chatDate,
    bool? isOnline,
  }) {
    return ChatInbox(
      userPict: userPict ?? this.userPict,
      userName: userName ?? this.userName,
      chatText: chatText ?? this.chatText,
      chatUnread: chatUnread ?? this.chatUnread,
      chatDate: chatDate ?? this.chatDate,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userPict': userPict,
      'userName': userName,
      'chatText': chatText,
      'chatUnread': chatUnread,
      'chatDate': chatDate.millisecondsSinceEpoch,
      'isOnline': isOnline,
    };
  }

  factory ChatInbox.fromMap(Map<String, dynamic> map) {
    return ChatInbox(
      userPict: map['userPict'] ?? '',
      userName: map['userName'] ?? '',
      chatText: map['chatText'] ?? '',
      chatUnread: map['chatUnread']?.toInt() ?? 0,
      chatDate: DateTime.fromMillisecondsSinceEpoch(map['chatDate']),
      isOnline: map['isOnline'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatInbox.fromJson(String source) =>
      ChatInbox.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatInbox(userPict: $userPict, userName: $userName, chatText: $chatText, chatUnread: $chatUnread, chatDate: $chatDate, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatInbox &&
        other.userPict == userPict &&
        other.userName == userName &&
        other.chatText == chatText &&
        other.chatUnread == chatUnread &&
        other.chatDate == chatDate &&
        other.isOnline == isOnline;
  }

  @override
  int get hashCode {
    return userPict.hashCode ^
        userName.hashCode ^
        chatText.hashCode ^
        chatUnread.hashCode ^
        chatDate.hashCode ^
        isOnline.hashCode;
  }
}
