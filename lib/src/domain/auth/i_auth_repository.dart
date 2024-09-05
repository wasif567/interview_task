import 'package:interview_task/src/domain/core/models/models/login_model/login_model.dart';
import 'package:interview_task/src/domain/core/models/pm_models/pm_login_model/pm_login_model.dart';


abstract class IAuthRepository {
  Future<LoginModel> login({required PmLoginModel pmLogin});
}
