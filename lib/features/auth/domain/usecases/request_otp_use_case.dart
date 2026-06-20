import 'package:medical_appointment_frontend/features/auth/domain/repositories/auth_repository.dart';

class RequestOtpUseCase {
  const RequestOtpUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call(String phoneNumber) => _repository.requestOtp(phoneNumber);
}