class Endpoints {
  static String login = 'api/user/login';
  static String logout = 'api/user/logout';

  static String getUsers = "api/user/";
  static String deleteUser = "api/user/";

  static String getWallets = "api/wallet";
  static String getTransactions = "api/transaction";


  static String makeValidation = 'api/transaction/make-demand';
  static String makeValidationById = 'api/transaction/make-demand/';
  static String make1xbetTransaction = 'api/wallet/make-1xbet-operation';
  static String getMyWallet = 'api/wallet/by-user';
  static String transaction = 'api/transaction/my';
}