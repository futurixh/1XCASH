import 'package:x1xcash/app/core/models/base.model.dart';

class Code extends BaseModel {
  int? id;
  String? amount;
  String? code;
  String? merchant;
  String? validity;
  String? status;

  Code({
    this.id,
    this.amount,
    this.code,
    this.merchant,
    this.validity,
    this.status,
  });

  Code.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    code = json['code'];
    merchant = json['merchant'];
    validity = json['validity'];
    status = json['status'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['code'] = code;
    data['merchant'] = merchant;
    data['validity'] = validity;
    data['status'] = status;
    return data;
  }
}
