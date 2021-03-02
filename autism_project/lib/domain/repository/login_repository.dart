import 'package:autism_project/core/helper/shared_prefs.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/data/source/remote/login_remote.dart';
import 'package:autism_project/domain/entity/login_response_entity.dart';

abstract class AuthRepository {
  Future<LoginResponseEntity> callLoginRepository(String email, String pass);
  Future<String> getUserToken();
  Future<bool> getUserLoggedIn();
}

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo networkInfo;
  final LoginRemoteDataSource loginRemoteDataSource;
  final SharedPrefs sharedPrefs;

  AuthRepositoryImpl(
      {this.networkInfo, this.loginRemoteDataSource, this.sharedPrefs});

  @override
  Future<LoginResponseEntity> callLoginRepository(
      String email, String pass) async {
    final isConnect = await networkInfo.isConnected;
    return isConnect != null
        ? (isConnect ? _getRemote(email, pass) : _getCache())
        : _getCache();
  }

  Future<LoginResponseEntity> _getRemote(String email, String pass) async {
    final data = await loginRemoteDataSource.callLoginRemote(email, pass);
    sharedPrefs.saveUserJWTSharedPref(data.jwt );
    sharedPrefs.saveUserLoggedInSharedPref(data.success);
    return data;
  }

  Future<LoginResponseEntity> _getCache() async {
    return null;
  }

  Future<String> getUserToken() {
    return sharedPrefs.getUserJWTSharedPref();
  }

  Future<bool> getUserLoggedIn() {
    return sharedPrefs.getUserLoggedInSharedPref();
  }
}
