import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/app/navigation/navig.dart';
import 'package:unaago/core/common/widgets.dart';
import 'package:unaago/core/loacalization/app_localizations.dart';
import 'package:unaago/core/models/user_model.dart';
import 'package:unaago/features/auth/logic/auth_cubit.dart';
import 'package:unaago/features/auth/logic/auth_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  UserRole _selectedRole = UserRole.renter;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _companyController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _companyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.register)),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Navig()),
              (route) => false,
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                AppTextField(label: l10n.name, controller: _nameController),
                const SizedBox(height: 20),
                AppTextField(label: l10n.email, controller: _emailController),
                const SizedBox(height: 20),
                AppTextField(label: l10n.password, isPassword: true, controller: _passwordController),
                const SizedBox(height: 20),
                Text(l10n.selectRole,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                DropdownButton<UserRole>(
                  value: _selectedRole,
                  isExpanded: true,
                  items: UserRole.values.map((role) {
                    String roleName;
                    switch (role) {
                      case UserRole.renter:
                        roleName = l10n.roleRenter;
                        break;
                      case UserRole.owner:
                        roleName = l10n.roleOwner;
                        break;
                      case UserRole.company:
                        roleName = l10n.roleCompany;
                        break;
                    }
                    return DropdownMenuItem(
                      value: role,
                      child: Text(roleName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => _selectedRole = value);
                  },
                ),
                if (_selectedRole == UserRole.company) ...[
                  const SizedBox(height: 20),
                  AppTextField(label: l10n.roleCompany, controller: _companyController), // Using roleCompany as temporary label
                ],
                const SizedBox(height: 30),
                AppButton(
                  text: l10n.register,
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    final user = UserModel(
                      id: DateTime.now().toString(),
                      email: _emailController.text,
                      name: _nameController.text,
                      role: _selectedRole,
                      companyName: _selectedRole == UserRole.company ? _companyController.text : null,
                    );
                    context.read<AuthCubit>().register(user, _passwordController.text);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
