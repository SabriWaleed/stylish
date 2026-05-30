import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  static const String _isLoggedInKey = 'is_logged_in';

  Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool(_isLoggedInKey, value);
  } //  بستخدمها لد  ما  بجب التوكنز واخزنها وبعد  ما اعمل لوج  ان دا  حالتي بقت بلوج ان

  bool isLoggedIn() {
    return _prefs.getBool(_isLoggedInKey) ?? false;
  } // بستخدمها لو انا  مثلا  عايز اعمل تشيك في  السبلاش علشان اشوف لو هو لوج ان وديه على الهوم لن لو مش لو  ان وديه يعمل اوثنتكيشن ولو هو جاي بنااال حط قيمتها بفولس

  Future<void> clearAuthData() async {
    await _prefs.remove(_isLoggedInKey);
  } //دي مش مهمه  اوي ولكن  علشان امسح حالته
}
