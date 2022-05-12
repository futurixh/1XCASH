class Endpoints {
  static String login = 'api/user/login';
  static String logout = 'api/user/logout';

  static String getUsers = "api/user/";
  static String getUser = "api/user/";
  static String deleteUser = "api/user/";
  static String verifyUser = "api/user/verify/";
  static String createUser = "api/user/create";
  static String editUser = "api/user/";

  static String getWallets = "api/wallet/";
  static String getWallet = "api/wallet/";
  static String editWallet = "api/wallet/";
  static String deleteWallet = "api/wallet/";
  static String getMyWallet = "api/wallet/by-user";
  static String makeOperation = "api/wallet/make-operation/";
  static String makeBetOperation = "api/wallet/make-1xbet-operation";

  static String getTransactions = "api/transaction";
  static String getTransaction = "api/transaction/";
  static String editTransaction = "api/transaction/";
  static String deleteTransaction = "api/transaction/";
  static String getMyTransactions = "api/transaction/my";
  static String makeDemand = 'api/transaction/make-demand';
  static String validateTransaction = 'api/transaction/validate/';

  static String getDepositCode = 'api/code/deposit';
  static String getWithdrawalCode = 'api/code/withdrawal';


  static String makeValidationById = 'api/transaction/make-demand/';
  static String make1xbetTransaction = 'api/wallet/make-1xbet-operation';
  static String transaction = 'api/transaction/my';
}