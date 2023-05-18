class SettingsState {
  String language;
  bool darkMode;
  bool userLoggedIn;
  List<String> userInfo;

  SettingsState(
    {required this.language, 
    required this.darkMode, 
    required this.userLoggedIn, 
    required this.userInfo});
}