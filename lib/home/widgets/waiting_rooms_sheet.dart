import 'package:chewata/home/models/room.dart';
import 'package:chewata/home/screens/index.dart';
import 'package:flutter/material.dart';

class WaitingRoomsSheet extends StatelessWidget {
  const WaitingRoomsSheet({Key? key, required this.rooms}) : super(key: key);
  final List<Room> rooms;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.only(top: 20),
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
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
