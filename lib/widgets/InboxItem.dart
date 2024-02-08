import 'package:course_flutter/architectures/domain/entities/ChatInbox.dart';
import 'package:course_flutter/theme/colors/Warna.dart';
import 'package:course_flutter/theme/styles/text/poppins_style_text.dart';
import 'package:course_flutter/widgets/ChatPicture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class InboxItem extends StatelessWidget {
  final ChatInbox chatInbox;
  const InboxItem(this.chatInbox, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ChatPicture(
                userPict: chatInbox.userPict,
                isOnline: chatInbox.isOnline,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                      width: 0.8,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chatInbox.userName,
                            style: PoppinsSemiBold16,
                          ),
                          Text(
                            chatInbox.chatText,
                            style: PoppinsRegular14.copyWith(
                              color: Warna.greyHome,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            toTanggal(chatInbox.chatDate, "dd/MM/yy"),
                            style: PoppinsRegular14.copyWith(
                              color: Warna.greyHome,
                            ),
                          ),
                        ),
                        if (chatInbox.chatUnread > 0)
                          Container(
                            width: 30.0,
                            height: 30.0,
                            child: Center(
                                child: Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            decoration: BoxDecoration(
                              color: Warna.biru,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  String toTanggal(DateTime theDate, String formatTujuan) {
    final outputFormat = DateFormat(formatTujuan);
    final outputDate = outputFormat.format(theDate);
    return outputDate;
  }
}
