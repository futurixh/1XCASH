

import 'package:flutter_web_seo/models/user.model.dart';

import 'base.model.dart';

class Wallet extends BaseModel {
  String? sId;
  int? solde;
  User? user;
  String? createdAt;
  String? updatedAt;

  Wallet({
    this.sId,
    this.solde,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  Wallet.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    solde = json['solde'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['solde'] = solde;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}