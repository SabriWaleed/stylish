import 'package:dartz/dartz.dart'; // مكتبه بستخدمها علشان اتعامل مع الفانكشنز وفيها فيتشر الايزر والليفت والرايت علشان اتعامل مع حالات النجاح والفشل بدل التراي والكاتش التقليدي
import 'package:ecommerce_project/Core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> register({
    // ايزر دي عندها اتنين بارمتر ليفت ورايت لو الليفت هيروح على ملف الفيلير ال عاملينه ولو رايت كدا ساكسس وهيرجع ماب من السترنج والداينمك زي الاسم والايميل والتوكن
    required String name,
    required String email,
    required String password,
    required String avatarURL,
  });

  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });
}
