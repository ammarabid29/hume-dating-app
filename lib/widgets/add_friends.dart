import 'package:flutter/material.dart';
import 'package:hume_dating_app/models/friend.dart';

class AddFriends extends StatefulWidget {
  const AddFriends({super.key, required this.friend});
  final Friend friend;

  @override
  State<AddFriends> createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        minVerticalPadding: 24,
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 30,
          child: ClipOval(
            child: Image.network(
              widget.friend.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          widget.friend.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          widget.friend.phoneNumber,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        trailing: SizedBox(
          width: widget.friend.isInvited ? 100 : 90,
          child: ElevatedButton(
            style: widget.friend.isInvited
                ? ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF9610FF),
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      inherit: false,
                    ),
                    side: const BorderSide(
                      color: Color(0xFF9610FF),
                      width: 2,
                    ),
                  )
                : ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9610FF),
                    foregroundColor: Colors.white,
                  ),
            onPressed: () {
              setState(() {
                widget.friend.isInvited = true;
              });
            },
            child: widget.friend.isInvited
                ? const Text("Invited")
                : const Text('Invite'),
          ),
        ),
      ),
    );
  }
}