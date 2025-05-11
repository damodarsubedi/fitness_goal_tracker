import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_goal_tracker/core/constants/colors.dart';
import 'auth_controller.dart';
import 'signup_screen.dart';
import 'package:gym_goal_tracker/shared/widgets/custom_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gym Goal Tracker", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Card with login details
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      const SizedBox(height: 10),
                      const Text("Login Details", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      // Email field
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        validator: (val) => val!.isEmpty ? 'Enter email' : null,
                      ),
                      const SizedBox(height: 16),
                      // Password field
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        obscureText: true,
                        validator: (val) => val!.length < 6 ? 'Min 6 chars' : null,
                      ),
                      const SizedBox(height: 10),
                      if (authState.isLoading)
                        const CircularProgressIndicator()
                      else
                        CustomButton(
                          label: "Login",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(authControllerProvider.notifier)
                                  .login(_emailController.text.trim(), _passwordController.text.trim());
                            }
                          },
                        ),
                      // Forgot password
                      TextButton(
                        onPressed: () {
                          // Handle forgot password
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 13, color: AppColors.secondaryBlue),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()));
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Don't have an account?\n",
                                style: TextStyle(fontSize: 13, color: AppColors.bluishWhite),
                              ),
                              TextSpan(
                                text: "Sign Up",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryBlue,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (_) => const SignupScreen()),
                                        );
                                      },
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Error message
                      if (authState.hasError)
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(authState.error.toString(), style: const TextStyle(color: Colors.red)),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
