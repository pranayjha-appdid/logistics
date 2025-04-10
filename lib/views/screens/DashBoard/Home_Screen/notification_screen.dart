import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Widget _notificationWidget(
      {required String title,
      required String subtitle,
      required DateTime time}) {
    String formattedTime = DateFormat('h:mm a').format(time);

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.notifications,
                size: 50,
                color: Color(0xff09596F),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(formattedTime),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
              color: Colors.black),
          centerTitle: true,
          title: Text("Notifications"),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _notificationWidget(
                    title: "Lorem is simply dummy text of the printing",
                    subtitle:
                        "Lorem  industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    time: DateTime.now()),
                _notificationWidget(
                    title: "Lorem Ipsum is simply dummy text of the printing",
                    subtitle:
                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    time: DateTime.now()),
              ],
            ),
          ),
        ));
  }
}
