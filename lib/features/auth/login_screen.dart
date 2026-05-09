import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../router/routes.dart';
import '../../widgets/app_background.dart';
import '../../widgets/labeled_text_field.dart';
import 'auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pwd = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _email.dispose();
    _pwd.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _busy = true);
    final ok = await context
        .read<AuthProvider>()
        .login(_email.text.trim(), _pwd.text);
    if (mounted) setState(() => _busy = false);
    if (ok && mounted) context.go(Routes.welcome);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => context.go(Routes.splash),
                    icon: const Icon(Icons.chevron_left, size: 32),
                  ),
                  Text(t.login,
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(height: 60),
                  LabeledTextField(
                    label: t.email,
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) =>
                        (v ?? '').contains('@') ? null : t.errorInvalidEmail,
                  ),
                  LabeledTextField(
                    label: t.password,
                    controller: _pwd,
                    obscure: true,
                    validator: (v) => (v ?? '').length >= 6
                        ? null
                        : t.errorPasswordShort,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: _busy ? null : _submit,
                        child: _busy
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(t.login),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.go(Routes.forgot),
                    child: Text(t.forgotPassword),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
