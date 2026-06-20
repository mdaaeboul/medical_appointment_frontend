import 'package:flutter/material.dart';
import 'package:medical_appointment_frontend/features/auth/data/repositories/mock_auth_repository.dart';
import 'package:medical_appointment_frontend/features/auth/domain/usecases/request_otp_use_case.dart';
import 'package:medical_appointment_frontend/features/auth/presentation/pages/login_screen.dart';

void main() {
  final requestOtpUseCase = RequestOtpUseCase(const MockAuthRepository());
  runApp(MyApp(requestOtpUseCase: requestOtpUseCase));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.requestOtpUseCase});

  final RequestOtpUseCase requestOtpUseCase;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Appointment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(
        onRequestOtp: requestOtpUseCase,
      ),
    );
  }

