import 'package:medical_appointment_frontend/features/auth/domain/repositories/auth_repository.dart';

/// Mock implementation of [AuthRepository].
///
/// Simulates a successful OTP request until the real backend is available.
///
/// TODO(backend): Replace this class with `ApiAuthRepository` once the API
/// contract is finalised. `ApiAuthRepository` will implement [AuthRepository]
/// in the same way, so no changes to the domain or presentation layers will
/// be required.
class MockAuthRepository implements AuthRepository {
  const MockAuthRepository();

  @override
  Future<void> requestOtp(String phoneNumber) async {
    // TODO(backend): Replace with real API call, e.g.:
    //   await _apiClient.post('/auth/otp', body: {'phone': phoneNumber});
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }
}