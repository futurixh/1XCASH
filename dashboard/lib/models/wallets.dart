class Wallet {
  final String? id;
  final int? solde;
  final Object? user;

  Wallet({this.id, this.solde, this.user});
}

List demoWallets = [
  Wallet(
    id: "1",
    solde: 879633,
    user: {"lastname": "Test", "firstname": "Test"}
  ),
  Wallet(
      id: "2",
      solde: 79636,
      user: {"lastname": "Test", "firstname": "Test"}
  ),
  Wallet(
      id: "3",
      solde: 35426,
      user: {"lastname": "Test", "firstname": "Test"}
  ),
  Wallet(
      id: "4",
      solde: 789,
      user: {"lastname": "Test", "firstname": "Test"}
  ),
  Wallet(
      id: "5",
      solde: 32145,
      user: {"lastname": "Test", "firstname": "Test"}
  ),
  Wallet(
      id: "6",
      solde: 89321,
      user: {"lastname": "Test", "firstname": "Test"}
  ),
];