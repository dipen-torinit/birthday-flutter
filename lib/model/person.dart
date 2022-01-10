import 'dart:convert';

class Person {
  String date;
  String email;
  String image;
  String name;
  String phone;

  Person({
    required this.date,
    required this.email,
    required this.image,
    required this.name,
    required this.phone,
  });

  Person copyWith({
    String? date,
    String? email,
    String? image,
    String? name,
    String? phone,
  }) {
    return Person(
      date: date ?? this.date,
      email: email ?? this.email,
      image: image ?? this.image,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'email': email,
      'image': image,
      'name': name,
      'phone': phone,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      date: map['date'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Person(date: $date, email: $email, image: $image, name: $name, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.date == date &&
        other.email == email &&
        other.image == image &&
        other.name == name &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        email.hashCode ^
        image.hashCode ^
        name.hashCode ^
        phone.hashCode;
  }
}
