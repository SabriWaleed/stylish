abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData =
        false, // علشان نعرف الريكوست جيسون ولا فورم داتا والفورم داتا زي الصور والملفات وهكذا
  });

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  });

  Future<dynamic> patch(
    // تعديل جزء من البيانات
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  });

  Future<dynamic> delete(String path, {bool isFormData = false});
}
