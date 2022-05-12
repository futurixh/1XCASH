

import 'base.model.dart';

class DepositCode extends BaseModel {
  String? amount;
  String? sId;
  String? validity;
  String? status;
  String? code;
  String? merchant;
  String? createdAt;
  String? updatedAt;

  DepositCode({
    amount,
    sId,
    validity,
    status,
    code,
    merchant,
    createdAt,
    updatedAt,
  });

  DepositCode.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    sId = json['_id'];
    validity = json['validity'];
    status = json['status'];
    code = json['code'];
    merchant = json['merchant'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['_id'] = sId;
    data['validity'] = validity;
    data['status'] = status;
    data['code'] = code;
    data['merchant'] = merchant;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}