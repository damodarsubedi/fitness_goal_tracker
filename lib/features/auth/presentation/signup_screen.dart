import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_controller.dart';
import 'package:gym_goal_tracker/shared/widgets/custom_button.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Card with sign-up details
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      const Text("Sign Up Details", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      // Full Name field
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        validator: (val) => val!.isEmpty ? 'Enter your full name' : null,
                      ),
                      const SizedBox(height: 16),
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
                      const SizedBox(height: 16),
                      // Confirm Password field
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        obscureText: true,
                        validator: (val) => val != _passwordController.text ? 'Passwords do not match' : null,
                      ),
                      const SizedBox(height: 16),
                      // Age field
                      TextFormField(
                        controller: _ageController,
                        decoration: InputDecoration(
                          labelText: "Age",
                          prefixIcon: Icon(Icons.cake),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (val) => val!.isEmpty ? 'Enter your age' : null,
                      ),
                      const SizedBox(height: 24),
                      if (authState.isLoading)
                        const CircularProgressIndicator()
                      else
                        CustomButton(
                          label: "Sign Up",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(authControllerProvider.notifier)
                                  .signup(_emailController.text.trim(), _passwordController.text.trim());
                            }
                          },
                        ),
                      const SizedBox(height: 16),
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
            ),
          ],
        ),
      ),
    );
  }
}
