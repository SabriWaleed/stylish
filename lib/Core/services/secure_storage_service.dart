import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService() : _storage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
    //بمل رايت علشان كدا انا بحفظ التوكنز ال جاتلي وبستخدمها في حاله بعد ما امل لوج ان علشان احفظ التوكنز او في الانترسيبتورز لما جي اعمل رفرش للتوكنز
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  } // بستخدمها لما اجي ابعت ريكوست او  اجي امل اي كوول فاببعت دايما التوكنز

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  } // بستخدمها علشان اجيب الريفرش توكن وابعته للباك اند علشان  احدث التوكنز ال عندي

  Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  } // بستخدمها لما اجي اعمل لوج اوت
}
