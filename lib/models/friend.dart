import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Friend {
  final String imageUrl;
  final String name;
  final String phoneNumber;
  final String id;
  bool isInvited;

  Friend(this.id, {
    required this.imageUrl,
    required this.name,
    required this.phoneNumber,
    this.isInvited = false,
  });
}
