import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String? streetAddress;
  final String? city;
  final int? areaCode;
  final String? citizenship;
  final String email;
  final String password;

  UserModel(
      {required this.email,
      this.streetAddress,
      this.city,
      this.areaCode,
      this.citizenship,
      required this.password,
      this.id,
      required this.fullName});

  toJson() {
    return {
      "FullName": fullName,
      "StreetAddress": streetAddress,
      "City": city,
      "Citizenship": citizenship,
      "AreaCode": areaCode,
      "email": email,
      "password": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data['email'],
      password: data['password'],
      fullName: data['FullName'],
      streetAddress: data['StreetAddress'],
      city: data['City'],
      citizenship: data['Citizenship'],
      areaCode: data['AreaCode'],
    );
  }
}
