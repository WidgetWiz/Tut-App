import 'package:wellos/domain/model/models.dart';
import '../../app/constants.dart';
import '../responses/responses.dart';
import 'package:wellos/app/extensions.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? Constants.empty,
        this?.name.orEmpty() ?? Constants.empty,
        this?.numberOfNotifications.orZero() ?? Constants.zero);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.phone.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.link.orEmpty() ?? Constants.empty);
  }
}

extension AuthResponseMapper on AuthResponse? {
  Auth toDomain() {
    return Auth(this?.customer.toDomain(), this?.contacts.toDomain());
  }
}
