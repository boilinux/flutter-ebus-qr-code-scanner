import 'package:flutter/foundation.dart';

import '../model/credentials.dart';

class Auth with ChangeNotifier {
  String? _token;

  set token(String? token) {
    _token = CredentialInfo().token;
  }

  String? get token {
    return CredentialInfo().token;
  }
}
