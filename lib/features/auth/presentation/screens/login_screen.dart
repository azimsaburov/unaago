import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/common/widgets.dart';
import 'package:unaago/features/auth/logic/auth_cubit.dart';
import 'package:unaago/features/auth/logic/auth_state.dart';
import 'package:unaago/features/auth/presentation/screens/register_screen.dart';
import 'package:unaago/app/navigation/navig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Navig()),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'UnaaGo',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
                const SizedBox(height: 40),
                AppTextField(label: l10n.email, controller: _emailController),
                const SizedBox(height: 20),
                AppTextField(label: l10n.password, isPassword: true, controller: _passwordController),
                const SizedBox(height: 30),
                AppButton(
                  text: l10n.login,
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    context.read<AuthCubit>().login(
                          _emailController.text,
                          _passwordController.text,
                        );
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: Text(l10n.noAccount),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
