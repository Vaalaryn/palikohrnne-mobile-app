class Constante {
  static String baseApiUrl = "brice-bitot.fr";
  static String regexMail =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
  static String regexUsername = r"^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$";
  static String regexPassword =
      r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!#$%&?@])[0-9a-zA-Z!#$%&?@]{8,}$";
  static String defaultLang = 'fr';
}