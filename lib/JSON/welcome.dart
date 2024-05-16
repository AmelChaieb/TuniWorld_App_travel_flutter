
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    final int? userI;
    final String? fullName;
    final String? email;
    final String userNAme;
    final String password;

    Welcome({
         this.userI,
         this.fullName,
        this.email,
        required this.userNAme,
        required this.password,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        userI: json["userI"],
        fullName: json["fullName"],
        email: json["email"],
        userNAme: json["userNAme"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "userI": userI,
        "fullName": fullName,
        "email": email,
        "userNAme": userNAme,
        "password": password,
    };
}



/* import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
  final int? usrId;
  final String? fullName;
  final String? email;
  final String usrName;
  final String password;

  Users({
    this.usrId,
    this.fullName,
    this.email,
    required this.usrName,
    required this.password,
  });

  //These json value must be same as your column name in database that we have already defined
  //one column didn't match
  factory Users.fromMap(Map<String, dynamic> json) => Users(
    usrId: json["usrId"],
    fullName: json["fullName"],
    email: json["email"],
    usrName: json["usrName"],
    password: json["usrPassword"],
  );

  Map<String, dynamic> toMap() => {
    "usrId": usrId,
    "fullName": fullName,
    "email": email,
    "usrName": usrName,
    "usrPassword": password,
  };
}
 */