import '../db/collections/user.dart' as db_user;

// model for dummyjson api
class User {
  // apiId returned from dummyjson
  String? apiId;
  String? firstName;
  String? lastName;

  // username and password to get api token
  String? userName;
  String? password;

  // jwtToken from dummyjson API
  String? jwtToken;

  User({
    this.apiId,
    this.firstName,
    this.lastName,
    this.userName,
    this.password,
    this.jwtToken,
  });

  // from auth/login or users/add call
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['username'],
      jwtToken: json['token'],
      apiId: json['id'].toString(),
    );
  }

  // mapping from db
  factory User.fromIsar(db_user.User isarUser) {
    return User(
      firstName: isarUser.firstName,
      lastName: isarUser.lastName,
      apiId: isarUser.userId,
      jwtToken: isarUser.jwtToken,
    );
  }

  // mapping to json for login action to get jwtToken
  Map<String, dynamic> toLoginJson() {
    return {
      'username': userName,
      'password': password,
      // USE THIS TO GET THE DUMMY DATA TOKEN FROM DUMMYJSON
      // 'username': 'kminchelle',
      // 'password': '0lelplR',
    };
  }

  // mapping for users/add api call
  Map<String, dynamic> toAddJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
