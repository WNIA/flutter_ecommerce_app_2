import 'package:autism_project/core/helper/shared_prefs.dart';
import 'package:autism_project/core/services/network_info.dart';
import 'package:autism_project/features/login/data/datasource/remote/login_remote.dart';
import 'package:autism_project/features/login/domain/entity/login_response_entity.dart';

abstract class LoginRepository {
  Future<LoginResponseEntity> callLoginRepository(String email, String pass);
  Future<bool> loginState();
  Future<String> userToken();
  void logOut();
}

class LoginRepositoryImpl extends LoginRepository {
  final NetworkInfo networkInfo;
  final LoginRemoteDataSource loginRemoteDataSource;
  final SharedPrefs sharedPrefs;

  LoginRepositoryImpl(
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
      sharedPrefs.saveUserJWTSharedPref(data.jwt);
      sharedPrefs.saveUserLoggedInSharedPref(data.success);
      print(data.jwt);
      return data;
  }

  Future<LoginResponseEntity> _getCache() async {
      return null;
  }
  Future<bool> loginState() {
    try{
      return sharedPrefs.getUserLoggedInSharedPref();
    }catch(e){
      print(e);
    }
  }
  @override
  Future<String> userToken() {
    try {
      return sharedPrefs.getUserJWTSharedPref();
    }catch(e){
      print(e);
    }
  }
  @override
  void logOut(){
    sharedPrefs.saveUserLoggedInSharedPref(false);
    sharedPrefs.saveUserJWTSharedPref("");
  }
}
