class RegisterErrors {
  static String show(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return "The provided email is already in use by an existing user";

      case 'too-many-requests':
        return 'Too many requests. Try again later';

      default:
        return "An error has occurred";
    }
  }
}
