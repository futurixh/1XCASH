class Transaction {
  String? status;
  String? sId;
  int? amount;
  String? type;
  Bet? bet;
  String? wallet;
  String? createdAt;
  String? updatedAt;

  Transaction({
    this.status,
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
    sId = json['_id'];
    amount = json['amount'];
    type = json['type'];
    bet = json['bet'] != null ? Bet.fromJson(json['bet']) : null;
    wallet = json['wallet'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
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
