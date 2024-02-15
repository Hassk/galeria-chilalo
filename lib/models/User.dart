import 'package:appucv2/models/Collocation.dart';

class User {
  final String name;
  final String profilePicture;
  final String username;
  final int followers;
  final int following;
  final List<Collocation> collocation;

  User(
      {this.name = "",
      this.profilePicture = "",
      this.username = "",
      required this.followers,
      required this.following,
      required this.collocation});
}
