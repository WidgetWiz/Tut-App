import 'package:dartz/dartz.dart';
import 'package:wellos/data/network/requests.dart';
import '../../data/network/failure.dart';
import '../model/models.dart';

abstract class Repository {
  Future<Either<Failure, Auth>> login(LoginRequest loginRequest);
}
