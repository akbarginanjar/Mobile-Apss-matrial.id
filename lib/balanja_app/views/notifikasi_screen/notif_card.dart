import 'package:flutter/material.dart';

class NotifCard extends StatelessWidget {
  const NotifCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.grey[300]!, width: 1)),
        child: ListTile(
          title: Text('Ada Notifikasi masuk',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(color: Colors.black)),
          subtitle: Text('2 Hari lalu',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.apply(color: Colors.grey[500])),
          leading: Icon(
            Icons.notifications_active_rounded,
            color: Colors.grey[500],
            size: 29,
          ),
        ));
  }
}
