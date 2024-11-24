import 'package:dartz/dartz.dart';
import 'package:wellos/data/network/failure.dart';
import 'package:wellos/data/network/requests.dart';
import 'package:wellos/domain/model/models.dart';
import 'package:wellos/domain/repository/repository.dart';
import 'package:wellos/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Auth> {
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Auth>> execute(LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
