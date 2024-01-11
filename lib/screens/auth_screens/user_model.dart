
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? email;
  String? name;


  UserModel({
     this.id,
     this.email,
     this.name,

  });
  factory UserModel.fromMap(DocumentSnapshot map) {
    return UserModel(
      id: map.id,
      email: map['email'],
      name: map['name'],

    );
  }



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,

    };
  }

}