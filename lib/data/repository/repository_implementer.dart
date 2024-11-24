import 'package:dartz/dartz.dart';
import 'package:wellos/data/data_source/remote_data_source.dart';
import 'package:wellos/data/mapper/mapper.dart';
import 'package:wellos/data/network/error_handler.dart';
import 'package:wellos/data/network/failure.dart';
import 'package:wellos/data/network/network_info.dart';
import 'package:wellos/data/network/requests.dart';
import 'package:wellos/domain/model/models.dart';
import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Auth>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      //its connected
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          //success, return data, either right
          return Right(response.toDomain());
        } else {
          //failure
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.Default));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //return connection error
      return Left(
          //Failure(ResponseCode.NO_INTERNET, ResponseMessage.NO_INTERNET));
          DataSource.NO_INTERNET.getFailure());
    }
  }
}
