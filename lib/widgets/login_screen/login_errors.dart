class LoginErrors {
  static String show(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'User not found';

      case 'too-many-requests':
        return 'Too many requests. Try again later';

      case 'user-disabled':
        return 'User account has been disabled by an administrator';

      case 'wrong-password':
        return 'The password you entered is incorrect';

      default:
        return "An error has occurred";
    }
  }
}
