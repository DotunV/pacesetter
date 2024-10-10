import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
        title: Text('Notifications'),
        centerTitle: true,
        actions: [
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // Section for Earlier Today
          NotificationSection(title: 'Earlier Today', notifications: [
            NotificationItem(
              avatarUrl: 'https://via.placeholder.com/150',
              title: 'Cheaper with ESPEES',
              subtitle: 'Buy products with your Espees...',
              time: '3m',
              isUnread: true,
            ),
            NotificationItem(
              avatarUrl: 'https://via.placeholder.com/150',
              title: 'Love World Events',
              subtitle: 'We’re happy to announce that...',
              time: '2h',
              isUnread: true,
            ),
            NotificationItem(
              avatarUrl: 'https://via.placeholder.com/150',
              title: 'Product Discounts',
              subtitle: '20% Discounts on products available...',
              time: '5h',
              isUnread: true,
            ),
          ]),

          // Section for Recent
          NotificationSection(title: 'Recent', notifications: [
            NotificationItem(
              avatarUrl: 'https://via.placeholder.com/150',
              title: 'Cheaper with ESPEES',
              subtitle: 'Buy products with your Espees...',
              time: '1d',
              isUnread: false,
            ),
            NotificationItem(
              avatarUrl: 'https://via.placeholder.com/150',
              title: 'Love World Events',
              subtitle: 'We’re happy to announce that...',
              time: '4d',
              isUnread: false,
            ),
            NotificationItem(
              avatarUrl: 'https://via.placeholder.com/150',
              title: 'Product Discounts',
              subtitle: '20% Discounts on products available...',
              time: '2w',
              isUnread: false,
            ),
          ]),

          // Section for June
          NotificationSection(title: 'June', notifications: [
            NotificationItem(
              avatarUrl: 'https://via.placeholder.com/150',
              title: 'Cheaper with ESPEES',
              subtitle: 'Buy products with your Espees...',
              time: '1d',
              isUnread: false,
            ),
          ]),
        ],
      ),
    );
  }
}

class NotificationSection extends StatelessWidget {
  final String title;
  final List<NotificationItem> notifications;

  NotificationSection({required this.title, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Column(children: notifications),
      ],
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String avatarUrl;
  final String title;
  final String subtitle;
  final String time;
  final bool isUnread;

  NotificationItem({
    required this.avatarUrl,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
          radius: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time),
            if (isUnread)
              Icon(
                Icons.circle,
                color: Colors.blue,
                size: 10,
              ),
          ],
        ),
      ),
    );
  }
}
