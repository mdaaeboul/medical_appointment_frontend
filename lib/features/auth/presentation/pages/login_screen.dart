import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  static const double _screenPadding = 24;
  static const double _contentSpacing = 16;
  static const double _fieldRadius = 12;

  void onRequestOtp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_text('auth.login.title')),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(_screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _text('auth.login.heading'),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: _contentSpacing),
              TextField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: _text('auth.login.phone.label'),
                  hintText: _text('auth.login.phone.hint'),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(_fieldRadius),
                    ),
                  ),
                ),
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
    );
  }

  String _text(String localizationKey) {
    return localizationKey;
  }
}
