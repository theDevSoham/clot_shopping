import 'package:clot_shopping/password_reset.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text("Forgot Password", style: theme.textTheme.headlineLarge),
            const SizedBox(height: 10),
            Text(
              "Enter your email address to receive a password reset link.",
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),

            // Email Input
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'eg: john.doe@example.com',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: theme.secondaryHeaderColor,
              ),
            ),
            const SizedBox(height: 16.0),

            // Send Reset Link Button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // Handle reset password logic
                  final email = _emailController.text.trim();
                  if (email.isNotEmpty) {
                    // Send reset link
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PasswordResetScreen(),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: Text(
                  "Send Reset Link",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            // Back to Sign In
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context); // back to sign in
                },
                child: Text(
                  "Go Back",
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
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
