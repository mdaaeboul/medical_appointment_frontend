import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const double _screenPadding = 24;
  static const double _contentSpacing = 16;
  static const double _fieldRadius = 12;
  static const int _minPhoneLength = 7;

  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void onRequestOtp() {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    // TODO: Connect backend OTP request when the API contract is available.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_text('auth.login.title')),
      ),
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
                    onFieldSubmitted: (_) => onRequestOtp(),
                  ),
                  const SizedBox(height: _contentSpacing),
                  FilledButton(
                    onPressed: onRequestOtp,
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

  String _text(String localizationKey) {
    return localizationKey;
  }

  String? _validatePhone(String? value) {
    final String phone = value?.trim() ?? '';

    if (phone.isEmpty) {
      return _text('auth.login.phone.validation.required');
    }

    if (phone.length < _minPhoneLength) {
      return _text('auth.login.phone.validation.invalid');
    }

    return null;
  }
}
