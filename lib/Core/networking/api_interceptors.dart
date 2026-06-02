import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ecommerce_project/Core/networking/api_endpoints.dart';
import 'package:ecommerce_project/Core/services/getit_service.dart';
import 'package:ecommerce_project/Core/services/secure_storage_service.dart';
import 'package:ecommerce_project/Core/services/shared_preferences_service.dart';

// الملف ده هتاخده كوبي بيست في اي مشروع
class ApiInterceptors extends Interceptor {
  final Dio dio;
  static Completer<
    bool
  >? // ده هو الكنترولر بتاع الريكوست ال ببعته للباك اند وبيهندل العمليات ال بتحصل في نفس الوقت ال هي الايسنكرونس
  _refreshCompleter; // فايدته انه بيعمل الكيوو ال ه لو  جالي  اكتر من  ريكوست في  نفس  الوقت بحطهم في كيوو واخلي واحد يتنفذ ويجيب  الاكسس والريفرش الجداد وبعدين انفذ بقت  ال في الكيوو

  ApiInterceptors(this.dio);
  // فيه اضافه حلوه هتوفر بيرفورمانس  وهي اين قبل ما اعمل الاون ريكوست هبدأ اعمل تشيكعلى النت متتوصل ولالا علشان اوفر البيرفورمانس والباكدج اسمها كونكتيفتي بلس تقريبا
  @override
  void onRequest(
    RequestOptions
    options, // بيخليني ابعت حاجات في الهيدر مع الريكوست والريوست اوبشنز دي اوبجكت جوا ديو بيكون فيها كل الديتيلز بتاعه الاوبجكت الحالي
    RequestInterceptorHandler handler,
  ) async {
    final secureStorage = getit<SecureStorageService>();
    final accessToken = await secureStorage.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] =
          'Bearer $accessToken'; //جمب الاوتوريزيشن دي ممكن ابعت كمان اللغه لو الابلكيشن عندي يدعم اكتر من لغه الحاجات البسيطه دي هي  ال ممكن تتغير من بروجكت لبروجكت
    }
    super.onRequest(options, handler);
  } //كدا انا بقوله ان مع ككل  ريككوست هيتمل ابعتله الاسس توكن  بتاعي فاده هيعفيني من اني مع كل ريكوست هفضل ابعت التوكن وهكذا

  //الميثود او ايرور دي غالبا ثابته في اي ابلكيشن فيه عمليه لوج ان ومش هتغير فيها حاجه خالص
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    //debugPrint('Error Status Code: ${err.response?.statusCode}');

    if (err.response?.statusCode == 401) {
      //debugPrint('Access token expired -> starting refresh flow');
      // if (_refreshCompleter != null) {
      //   debugPrint('Waiting for existing refresh request...');
      // }

      if (_refreshCompleter != null) {
        // التشيك  ده  معناه ان الكومبليتر مش بنال فاكدا فيه ريكوست بجيب الريفرش والاكسس فابقيت  الريكوستات تسنى متتنفذش
        final success = await _refreshCompleter!
            .future; // دي  ترجعلي تروو او فولس اناه لو بتروو فاكدا خلاص الاكسس والريفرش اتحدثوا واتخذنوا في السيكيور استوردج

        //debugPrint('Existing refresh completed: $success');

        if (success) {
          final secureStorage = getit<SecureStorageService>();
          final accessToken = await secureStorage
              .getAccessToken(); // بجيب الاكسس توكن

          //debugPrint('Retrying original request...');

          err.requestOptions.headers['Authorization'] =
              'Bearer $accessToken'; // بحطه في الهيدر

          try {
            final response = await dio.fetch(
              err.requestOptions, // الريوست اوبشنز ده هو ال بيدي لفيتش كل المعلوةمات عن الريككوست ال كان بيتنفذ يعني مثلا هتعمل جيت ولا بوست ولا ديليت ولا اي ان كان
            ); // ابدأ اعمل تنفيذ للريسبونس ده تاني وميثود فيتش دي بتشوف نفس  الريكوست ال فات وتقوم جايه منفذاه تاني بكل حاجته من غير ما اتدخل

            //debugPrint('Retried request success');

            return handler.resolve(
              response,
            ); // معناها ان العمليه دي نجحت ومعتش فيه ايرور
          } catch (e) {
            //debugPrint('Retried request failed: $e');
            return handler.next(err); // معناه ان حصل ايرور في الفيتش
          }
        } else {
          //debugPrint('Refresh failed');
          return handler.next(
            err,
          ); // معناه ان شرط الساكسس فشل فامفيش ريس كونديشن
        }
      } //كل ال كان فوق ده انا بهندل سيناريو الريس كونديشن ///////////////////////////////////////////////////////////////////////
      // ده في حاله لو هو فشل  يعني كدا الريفرش توككن  صلاحييته انتهت
      _refreshCompleter =
          Completer<
            bool
          >(); // هعمل كوبليتر جديد علشان لو حصل ريس كونديشن حطه فييه واطلع على الكود ال فوق

      final secureStorage = getit<SecureStorageService>();
      final refreshToken = await secureStorage.getRefreshToken();

      //debugPrint('Refresh Token: $refreshToken');

      if (refreshToken == null) {
        //debugPrint('No refresh token found');

        _refreshCompleter!.complete(false);
        _refreshCompleter = null;
        await _performLogout(); // لو الريفرش توكن بنال ارجع بيا علي اللوج اوت

        return handler.next(err);
      }
      // لو الريفرش توكن مش بنال بقا
      try {
        //debugPrint('Calling refresh endpoint...');

        final refreshDio = Dio(
          BaseOptions(baseUrl: ApiEndpoints.baseUrl),
        ); // بعمل دايوو جديده  غير الجلوبال ال عندي علي  مستويي الابلكيشن علشان مخشش في حاله الانفيينتي لوب ال هو يفضل يعمل ريفرش كل شويه

        final response = await refreshDio.post(
          ApiEndpoints.refreshToken,
          data: {'refreshToken': refreshToken},
        ); // ببعت  لل اند بوينت الريفرش توكن  بتاعي  علشان  يجيبلي اكسس وريفرش جداد بقا

        //debugPrint('Refresh response: ${response.data}');

        final newAccessToken = response.data['access_token'] as String?;

        final newRefreshToken = response.data['refresh_token'] as String?;

        await secureStorage.saveTokens(
          accessToken: newAccessToken!,
          refreshToken: newRefreshToken!,
        ); //  بعملهم سييف بقا علشان يتحطوا  مكان القديم

        //debugPrint('New tokens saved successfully');
        // كدا بقوله ان  الريفرش كومبليتر بقت بتروو فاتقدر تنفذ الباقيين ال في الكيوو
        _refreshCompleter!.complete(
          true,
        ); // السطر ده خلاص هيشغل ككل ال في الكيوو
        _refreshCompleter = null; // ارجعه بنال بقا بعد ما الكيووو خلصت

        err.requestOptions.headers['Authorization'] =
            'Bearer $newAccessToken'; // الريكوست اوشنز دي بتعبر عن الريكوست  القديم بنفس كل حاجه

        //debugPrint('Retrying original request after refresh');

        final retryResponse = await dio.fetch(err.requestOptions);

        //debugPrint('Final request success');

        return handler.resolve(retryResponse);
      } catch (e) {
        //debugPrint('Refresh process failed: $e');
        // دي  في حاله ان الريفرش توكن  فشل هو كمان
        _refreshCompleter!.complete(false);
        _refreshCompleter = null;
        await _performLogout(); // رجعني بقا لوج اوت علشان اعمل لوج  ان تاني

        return handler.next(err);
      }
    }

    return super.onError(err, handler);
  }

  Future<void> _performLogout() async {
    await getit<SecureStorageService>()
        .clearTokens(); // بمسح كل التوكنز القديمه
    await getit<SharedPreferencesService>()
        .clearAuthData(); // بمسح كا حاجه في الشيرد برفرنسس
    AuthEventBus.instance.addEvent(
      AuthEvent.logout,
    ); // دي كدا زي استريم بتعمل ليسن اول ما ابعتلها لوج اوت
  }
}

enum AuthEvent {
  logout,
} // علشان المستمع اول مايشوف حاجه ب اسم لو اوت يعمل لوج اوت علطول

// عملنا اجزاء في المييين علشان خاطر جزء الاستريم ده
class AuthEventBus {
  AuthEventBus._();
  static final AuthEventBus instance = AuthEventBus._();

  final _controller =
      StreamController<
        AuthEvent
      >.broadcast(); // دي بوور كاست علشان اعملها لكذا مكان

  Stream<AuthEvent> get stream => _controller.stream;

  void addEvent(AuthEvent event) {
    if (!_controller.isClosed) {
      _controller.add(event);
    }
  }

  void dispose() => _controller.close();
}
