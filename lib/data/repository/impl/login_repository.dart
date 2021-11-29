import 'dart:developer';

import 'package:scaffold_flutter/data/models/forms/credential_form.dart';
import 'package:scaffold_flutter/data/provider/http_client_interface.dart';
import 'package:scaffold_flutter/data/repository/login_repository_interface.dart';
import 'package:scaffold_flutter/utils/environment.dart';

class LoginRepository implements ILoginRepository {
  LoginRepository(this._restClient);

  final IRestClient _restClient;

  @override
  Future<Map<String, dynamic>> login(CredentialForm credentials) async {
    log(credentials.toJson().toString());
    final response = await _restClient.post(
        '${Environment.baseUrl}/login', credentials.toJson());
    return response;
  }
}
