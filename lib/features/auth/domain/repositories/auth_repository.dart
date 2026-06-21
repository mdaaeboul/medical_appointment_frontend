abstract interface class AuthRepository {
  Future<void> requestOtp(String phoneNumber);
}