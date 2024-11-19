import 'package:flutter/material.dart';
import 'package:hume_dating_app/data/add_friend.dart';
import 'package:hume_dating_app/models/friend.dart';
import 'package:hume_dating_app/widgets/add_friends.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  final List<Friend> peopleList = dummyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Invite Friends",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: peopleList.length,
          itemBuilder: (context, index) => AddFriends(
            friend: peopleList[index],
          ),
        ),
      ),
    );
  }
}
