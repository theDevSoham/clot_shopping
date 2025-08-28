import 'package:clot_shopping/password_input.dart';
import 'package:clot_shopping/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PasswordInput(),
                        ),
                      );
                    },
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
                          ),
                        );
                      },
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
                  onPress: () {},
                ),
                const SizedBox(height: 16), // decreased gap
                _buildSocialButton(
                  context,
                  icon: Icons.facebook,
                  label: "Sign in with Facebook",
                  onPress: () {},
                ),
                const SizedBox(height: 16), // decreased gap
                _buildSocialButton(
                  context,
                  icon: FontAwesomeIcons.google,
                  label: "Sign in with Facebook",
                  onPress: () {},
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
    required Function onPress,
  }) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 56, // larger button height
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
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
