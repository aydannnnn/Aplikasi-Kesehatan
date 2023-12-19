import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:mylab/app/modules/login/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Mock objek SharedPreferences
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('AuthController Logout Test', () {
    late AuthController authController;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      authController = AuthController();
      mockSharedPreferences = MockSharedPreferences();
      Get.put<SharedPreferences>(mockSharedPreferences); // Mock SharedPreferences
    });

    test('Logout should set isLoggedIn to false and navigate to login page', () async {
      // Simulasikan bahwa pengguna telah login
      authController.isLoggedIn.value = true;

      // Panggil fungsi logout
      authController.logout();

      // Verifikasi bahwa isLoggedIn diubah menjadi false
      expect(authController.isLoggedIn.value, false);

      // Verifikasi bahwa fungsi signOut pada FirebaseAuth dipanggil
      // verify(authController._auth.signOut()).called(1);

      // Verifikasi bahwa fungsi offAllNamed dipanggil untuk navigasi ke halaman login
      verify(Get.offAllNamed('/login')).called(1);
    });

    test('Logout should not navigate if user is not logged in', () async {
      // Simulasikan bahwa pengguna tidak login
      authController.isLoggedIn.value = false;

      // Panggil fungsi logout
      authController.logout();

      // Verifikasi bahwa isLoggedIn tetap false
      expect(authController.isLoggedIn.value, false);

      // Verifikasi bahwa fungsi offAllNamed tidak dipanggil
      verifyNever(Get.offAllNamed('/login'));
    });
  });
}
