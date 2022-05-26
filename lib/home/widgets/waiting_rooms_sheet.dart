import 'package:chewata/home/models/room.dart';
import 'package:chewata/home/screens/index.dart';
import 'package:flutter/material.dart';

class WaitingRoomsSheet extends StatelessWidget {
  const WaitingRoomsSheet({Key? key, required this.rooms}) : super(key: key);
  final List<Room> rooms;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 3,
            color: Colors.black,
            margin: const EdgeInsets.all(8),
          ),
          ...rooms
              .map((Room room) => ListTile(
                    title: Text(room.name),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => WaitingRoomScreen(room: room),
                        ),
                      );
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }
}
