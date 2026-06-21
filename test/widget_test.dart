import 'package:flutter_test/flutter_test.dart';
import 'package:medical_appointment_frontend/features/auth/data/repositories/mock_auth_repository.dart';
import 'package:medical_appointment_frontend/features/auth/domain/usecases/request_otp_use_case.dart';
import 'package:medical_appointment_frontend/main.dart';

void main() {
  testWidgets('App renders login screen', (WidgetTester tester) async {
    final requestOtpUseCase = RequestOtpUseCase(const MockAuthRepository());

    await tester.pumpWidget(MyApp(requestOtpUseCase: requestOtpUseCase));

    expect(find.text('auth.login.title'), findsOneWidget);
    expect(find.text('auth.login.requestOtp'), findsOneWidget);
  });
}
