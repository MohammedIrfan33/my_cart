class User {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  const User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  // Deserialize from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }

  // copyWith
  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
