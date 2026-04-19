import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Add this for formatting

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phone;
  final String profilePicture;
  final String role;
  DateTime? createdAt;
  DateTime? updatedAt;
  String publicId;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phone,
    required this.profilePicture,
    required this.role,
    this.publicId = '',
    this.createdAt,
    this.updatedAt,
  });

  // Helper to get formatted string (e.g., "18 April 2026")
  String get formattedCreatedAt =>
      createdAt != null ? DateFormat('dd MMM yyyy').format(createdAt!) : 'N/A';

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': userName,
      'email': email,
      'phoneNumber': phone,
      'profilePicture': profilePicture,
      'role': role,
      'publicId': publicId,
      // Store as Timestamp in Firestore for better querying
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
    };
  }

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    if (data == null) return UserModel.empty;

    return UserModel(
      id: document.id,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      userName: data['username'] ?? '',
      email: data['email'] ?? '',
      phone: data['phoneNumber'] ?? '',
      profilePicture: data['profilePicture'] ?? '',
      role: data['role'] ?? '',
      publicId: data['publicId'] ?? '',
      // Convert Firestore Timestamp to Dart DateTime
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  static UserModel get empty => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    userName: '',
    email: '',
    phone: '',
    profilePicture: '',
    role: '',
  );
}
