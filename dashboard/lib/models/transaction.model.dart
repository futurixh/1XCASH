
import 'package:flutter_web_seo/models/base.model.dart';
import 'package:flutter_web_seo/models/user.model.dart';
import 'package:flutter_web_seo/models/wallet.model.dart';

class Transaction extends BaseModel {
  String? status;
  bool? approval;
  List<dynamic>? validations;
  String? sId;
  int? amount;
  String? type;
  Bet? bet;
  Wallet? wallet;
  String? createdAt;
  String? updatedAt;

  Transaction({
    this.status,
    this.approval,
    this.validations,
    this.sId,
    this.amount,
    this.type,
    this.bet,
    this.wallet,
    this.createdAt,
    this.updatedAt,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    approval = json['approval'];
    validations = json['validations'];
    sId = json['_id'];
    amount = json['amount'];
    type = json['type'];
    bet = json['bet'] != null ? Bet.fromJson(json['bet']) : null;
    wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['approval'] = approval;
    data['validations'] = validations;
    data['_id'] = sId;
    data['amount'] = amount;
    data['type'] = type;
    if (bet != null) {
      data['bet'] = bet!.toJson();
    }
    data['wallet'] = wallet;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;

    return data;
  }

  get styledType => type == 'credit' ? 'Dépôt' : 'Retrait';
}

class Bet {
  String? id;
  String? type;
  String? clientTelephone;

  Bet({this.id, this.type});

  Bet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    clientTelephone = json['client_telephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['client_telephone'] = clientTelephone;
    return data;
  }
}

class Validation {
  String? id;
  User? user;

  Validation({this.id, this.user});

  Validation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}