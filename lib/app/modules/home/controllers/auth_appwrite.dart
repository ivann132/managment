import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

import '../../../constant/constants.dart';
import '../../../routes/app_pages.dart';

class AuthAPI {
  Client client = Client();
  late Account account;

  AuthAPI() {
    init();
  }

  init() {
    client
        .setEndpoint(APPWRITE_URL)
        .setProject(APPWRITE_PROJECT_ID)
        .setSelfSigned(status: true);
    account = Account(client);
  }

// Register
  Future<String> createUser(String name, String Email, String Password) async {
    try {
      await account.create(
          userId: ID.unique(), email: Email, password: Password, name: name);
      return "success";
    } on AppwriteException catch (e) {
      return e.message.toString();
    }
  }

// Login
  Future loginUser(String email, String password) async {
    try {
      await account.createEmailSession(email: email, password: password);
      return true;
    } on AppwriteException {
      return false;
    }
  }

// Logout
  Future logoutUser() async {
    await account.deleteSession(sessionId: 'current');
    Get.offAllNamed(Routes.LOGIN);
  }

// Check Session
  Future checkSession() async {
    try {
      await account.getSession(sessionId: 'current');
      return true;
    } catch (e) {
      return false;
    }
  }
}
