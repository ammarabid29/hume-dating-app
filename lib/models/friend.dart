class Friend {
  final String imageUrl;
  final String name;
  final String phoneNumber;
  bool isInvited;

  Friend({
    required this.imageUrl,
    required this.name,
    required this.phoneNumber,
    this.isInvited = false,
  });
}
