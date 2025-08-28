import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'eg:john.doe@example.com',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: theme.secondaryHeaderColor,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      "Sign in",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6.0),
                Row(
                  children: [
                    const Text("Don't have an account?"),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 60),
            // Social Buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSocialButton(
                  context,
                  icon: Icons.apple,
                  label: "Sign in with Apple",
                ),
                const SizedBox(height: 16), // decreased gap
                _buildSocialButton(
                  context,
                  icon: Icons.facebook,
                  label: "Sign in with Facebook",
                ),
                const SizedBox(height: 16), // decreased gap
                _buildSocialButton(
                  context,
                  icon: FontAwesomeIcons.google,
                  label: "Sign in with Facebook",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 56, // larger button height
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.secondaryHeaderColor,
          foregroundColor: theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(icon, size: 28), // larger icon
            ),
            const Spacer(),
            Text(
              label,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18, // bigger font
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(flex: 2), // ensures label stays centered
          ],
        ),
      ),
    );
  }
}
