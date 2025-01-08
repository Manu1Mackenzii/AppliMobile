class User {
  String id;
  String username;
  String email;
  String profilePhoto;
  String birthDate;
  String role;
  String favoriteSport;
  String location;
  String bio;


  User({
    required this.id,
    required this.username,
    required this.email,
    required this.profilePhoto,
    required this.birthDate,
    required this.role,
    required this.favoriteSport,
    required this.location,
    required this.bio,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profilePhoto: json['profile_photo'],
      birthDate: json['birth_date'] ?? '',
      role: json['role'],
      favoriteSport: json['favorite_sport'],
      location: json['location'],
      bio: json['bio']
    );
  }
}
