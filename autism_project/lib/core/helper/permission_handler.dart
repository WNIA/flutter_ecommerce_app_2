/*requesting for permission to read the device location
* @WNIA*/
import 'package:permission_handler/permission_handler.dart';

Future<void> requestLocationPermission() async {
  var permission = await Permission.location.request();
  print(permission);
}