

import 'base.model.dart';

class User extends BaseModel {
  String? role;
  bool? verified;
  String? sId;
  String? lastname;
  String? firstname;
  String? email;
  String? telephone;
  String? createdAt;
  String? updatedAt;
  String? token;
  String? ifu;
  String? rccm;
  String? identity;

  User({
    role,
    verified,
    sId,
    lastname,
    firstname,
    email,
    telephone,
    createdAt,
    updatedAt,
    token,
    ifu,
    rccm,
    identity,
  });

  User.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    verified = json['verified'];
    sId = json['_id'];
    lastname = json['lastname'];
    firstname = json['firstname'];
    email = json['email'];
    telephone = json['telephone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    token = json['token'];
    ifu = json['ifu'];
    rccm = json['rccm'];
    identity = json['identity'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['verified'] = verified;
    data['_id'] = sId;
    data['lastname'] = lastname;
    data['firstname'] = firstname;
    data['email'] = email;
    data['telephone'] = telephone;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['token'] = token;
    data['ifu'] = ifu;
    data['rccm'] = rccm;
    data['identity'] = identity;
    return data;
  }
}