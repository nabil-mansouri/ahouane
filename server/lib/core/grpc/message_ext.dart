
import 'package:ahouane_common/core/core.dart';
import 'package:ahouane_common/utils/utils.dart';

final _superUserKey = StringUtils.cryptoRandomString();
final _superUserValue = StringUtils.cryptoRandomString();

extension MessageReaderExtSuperUser on MessageHeader {
  bool isSuperUser() {
    return attributes[_superUserKey] == _superUserValue;
  }

  void setSuperUser() {
    attributes[_superUserKey] = _superUserValue;
  }
}