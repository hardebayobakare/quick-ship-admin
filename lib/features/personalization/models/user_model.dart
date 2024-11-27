import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_shop_admin/utils/constants/enums.dart';
import 'package:quick_shop_admin/utils/formatters/formatter.dart';

class UserModel {
  final String? id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String phoneNumber;
  String profilePicture;
  AppRole role;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.firstName = '',
    this.lastName = '',
    this.userName = '',
    required this.email,
    this.phoneNumber = '',
    this.profilePicture = '',
    this.role = AppRole.user,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Role': role.name.toString(),
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt,
    };
  }

  // Helper function to get full name
  String get fullName => '$firstName $lastName';

  // Helper function to format phone number
  String get formattedPhoneNumber => CustomFormatter.formatPhoneNumber(phoneNumber);

  // Static function to split full name into first and last name
  static List<String> nameParts(String fullName) {
    final names = fullName.split(' ');
    return names;
  }

  // Static function to generate a username from the full name
  static String generateUsername(String fullName) {
    List<String> names = nameParts(fullName);
    String firstName = names[0].toLowerCase();
    String lastName = names[1].toLowerCase();

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "quickshop_$camelCaseUsername";
    return usernameWithPrefix;
  }

  // Static function to create an empty user model
  static UserModel empty() {
    return UserModel(
      email: '',
    );
  }

  // factory method to create a UserModel from a Firebase document Snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() != null) {
      final data = snapshot.data()!;
      return UserModel(
        id: snapshot.id,
        firstName: data.containsKey('FirstName') ? data['FirstName'] ?? '' : '',
        lastName: data.containsKey('LastName') ? data['LastName'] ?? '' : '',
        userName: data.containsKey('Username') ? data['Username'] ?? '' : '',
        email: data.containsKey('Email') ? data['Email'] ?? '' : '',
        phoneNumber: data.containsKey('PhoneNumber') ? data['PhoneNumber'] ?? '' : '',
        profilePicture: data.containsKey('ProfilePicture') ? data['ProfilePicture'] ?? '' : '',
        role: data.containsKey('Role') ? (data['Role'] ?? AppRole.user) == AppRole.admin.name.toString() ? AppRole.admin : AppRole.user : AppRole.user,
        createdAt: data.containsKey('CreatedAt') ? data['CreatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
        updatedAt: data.containsKey('UpdatedAt') ? data['UpdatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
      );
    } else {
      return UserModel.empty();
    }
  }
}