class Validators {
  /*
   * validators for email and password
   * for both sign in and sign up page
   * TODO: implement in sign up page
   * @WNIA
   */
  String emailValidator(val) {
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(val)
        ? null
        : "Enter valid email";
  }

  String passwordValidator(val) {
    return val.length < 6 ? "Needs 6+ characters" : null;
  }
}
