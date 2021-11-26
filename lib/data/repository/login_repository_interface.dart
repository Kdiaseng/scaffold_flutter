import 'package:scaffold_flutter/data/models/forms/credential_form.dart';

abstract class ILoginRepository {
  Future<Map<String, dynamic>> login(CredentialForm credentials);
}
