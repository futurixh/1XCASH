class Transaction {
  final String? id, status, type;
  final int? amount;
  final Object? wallet, bet;

  Transaction({this.id, this.status, this.type, this.amount, this.wallet, this.bet});
}

List demoTransaction = [
  Transaction(
    id: "1",
    status: "finished",
    type: "credit",
    amount: 1000,
    wallet: {"id": "1", "user": {"lastname": "Test", "firstname": "Test"}},
  ),
  Transaction(
    id: "2",
    status: "pending",
    type: "debit",
    amount: 15000,
    wallet: {"id": "2", "user": {"lastname": "Test", "firstname": "Test"}},
  ),
  Transaction(
    id: "3",
    status: "finished",
    type: "credit",
    amount: 50,
    wallet: {"id": "1", "user": {"lastname": "Test", "firstname": "Test"}},
    bet: {"id": "4895", "type": "withdrawal"},
  ),
  Transaction(
    id: "4",
    status: "pending",
    type: "debit",
    amount: 98562,
    wallet: {"id": "2", "user": {"lastname": "Test", "firstname": "Test"}},
    bet: {"id": "4593", "type": "deposit"},
  )
];