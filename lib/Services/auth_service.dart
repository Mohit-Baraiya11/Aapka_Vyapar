import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio dio = Dio();
  Future<String> register(String name, String email, String password) async {
    try {
      final response = await dio.post(
        'https://aapka-vyapar.onrender.com/user/register',
        data: {
          'username': name,
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      print('STATUS: ${response.statusCode}');
      print('DATA: ${response.data}');

      if (response.statusCode == 200) {
        return "success";
      } else {
        return response.data['message'] ?? 'Registration failed';
      }
    } catch (e) {
      if (e is DioError) {
        print("DioError: ${e.response?.data}");
        return 'Error: ${e.response?.data ?? e.message}';
      }
      return 'Error: ${e.toString()}';
    }
  }
  Future<String> login(String email, String password) async {
    try {
      final response = await dio.post(
        'https://aapka-vyapar.onrender.com/user/login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      print('STATUS: ${response.statusCode}');
      print('DATA: ${response.data}');

      if (response.statusCode == 200 && response.data['message'] == 'Login successful') {
        final accessToken = response.data['Accesstoken'];
        final refreshToken = response.data['Refreshtoken'];

        // Save tokens locally
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', accessToken);
        await prefs.setString('refreshToken', refreshToken);

        return "success";
      } else {
        return response.data['message'] ?? 'Login failed';
      }
    } catch (e) {
      if (e is DioError) {
        return 'Error: ${e.response?.data['message'] ?? e.message}';
      }
      return 'Error: ${e.toString()}';
    }
  }
  Future<String> sendOtpToEmail(String email) async {
    const String url = 'https://aapka-vyapar.onrender.com/user/sendOtp';

    try {
      Response response = await dio.post(
        url,
        data: {'email': email},
         options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['success'] == true) {
          return "success"; // ✅ This will be used in UI
        } else {
          return data['message'] ?? "OTP sending failed.";
        }
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Exception: $e";
    }
  }
  Future<String> verifyOtp(String email, int otp) async {
    const String url = 'https://aapka-vyapar.onrender.com/user/verifyOTP';

    print("=== VERIFY OTP ===");
    print("URL: $url");
    print("Email sent: ${email.trim()}");
    print("OTP sent: $otp.");

    try {
      Response response = await dio.post(
        url,
        data: {
          'email': email.trim(),
          'otp': otp,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      print("Response status code: ${response.statusCode}");
      print("Response headers: ${response.headers}");
      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        print("✅ OTP verified successfully.");
        return "success";
      } else {
        print("❌ OTP verification failed with status: ${response.statusCode}");
        return "Failed to verify OTP: ${response.data}";
      }
    } catch (e) {
      if (e is DioError) {
        print("❗ DioError occurred:");
        print("Status code: ${e.response?.statusCode}");
        print("Response data: ${e.response?.data}");
        print("Response headers: ${e.response?.headers}");
        print("Request data: ${e.requestOptions.data}");
        return "Error verifying OTP: ${e.response?.data}";
      } else {
        print("❗ Unexpected error: $e");
        return "Unexpected error: $e";
      }
    }
  }
  Future<String> resetPassword(String email, String newPassword) async {
    const String url = 'https://aapka-vyapar.onrender.com/user/resetPassword';

    try {
      Response response = await dio.post(
        url,
        data: {
          'email': email,
          'newPassword': newPassword,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      print('STATUS: ${response.statusCode}');
      print('DATA: ${response.data}');

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['success'] == true) {
          return "success";
        } else {
          return data['message'] ?? "OTP sending failed.";
        }
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Exception: $e";
    }
  }
}