import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/user_info.dart';

abstract class ProfileDomainRepo {

 Future<Either<FailureError,UserInfo>>getProfileData({required String id});
}