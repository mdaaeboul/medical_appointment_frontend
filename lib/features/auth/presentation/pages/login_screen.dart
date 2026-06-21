import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onRequestOtp});

  /// Called when the user submits the form.
  ///
  /// Receives the trimmed phone number entered by the user.
  /// Wire this to [RequestOtpUseCase] at the composition root.
  final Future<void> Function(String phoneNumber) onRequestOtp;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const double _screenPadding = 24;
  static const double _contentSpacing = 16;
  static const double _fieldRadius = 12;
  static const int _minPhoneLength = 7;
  static final RegExp _digitsOnlyPattern = RegExp(r'^[0-9]+$');

  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleRequestOtp() async {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    await widget.onRequestOtp(_phoneController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_text('auth.login.title'))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(_screenPadding),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _text('auth.login.heading'),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: _contentSpacing),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: _validatePhone,
                    decoration: InputDecoration(
                      labelText: _text('auth.login.phone.label'),
                      hintText: _text('auth.login.phone.hint'),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(_fieldRadius),
                        ),
                      ),
                    ),
                    onFieldSubmitted: (_) => _handleRequestOtp(),
                  ),
                  const SizedBox(height: _contentSpacing),
                  FilledButton(
                    onPressed: _handleRequestOtp,
                    child: Text(_text('auth.login.requestOtp')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // TODO(l10n): Replace with generated AppLocalizations once gen-l10n / .arb
  // files are set up. See https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
  String _text(String localizationKey) {
    return localizationKey;
  }

  String? _validatePhone(String? value) {
    final String phone = value ?? '';

    if (phone.trim().isEmpty) {
      return _text('auth.login.phone.validation.required');
    }

    if (!_digitsOnlyPattern.hasMatch(phone)) {
      return _text('auth.login.phone.validation.invalid');
    }

    if (phone.length < _minPhoneLength) {
      return _text('auth.login.phone.validation.invalid');
    }

    return null;
  }
}
