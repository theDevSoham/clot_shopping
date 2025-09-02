import 'dart:developer';

import 'package:clot_shopping/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // Email & Password Sign-in
  Future<void> signInWithEmail() async {
    setState(() => isLoading = true);
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      _showSnackBar("Signed in successfully!");
    } on FirebaseAuthException catch (e) {
      _showSnackBar(e.message ?? "Sign in failed");
    } finally {
      setState(() => isLoading = false);
    }
  }

  // Google Sign-in
  Future<void> signInWithGoogle() async {
    setState(() => isLoading = true);
    try {
      final googleSignIn = GoogleSignIn.instance;

      // Initialize once
      await googleSignIn.initialize(
        serverClientId: dotenv.env['GOOGLE_SERVER_CLIENT_ID'],
        clientId: dotenv.env['GOOGLE_CLIENT_ID'],
      );

      // Authenticate (shows UI and handles auth)
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      _showSnackBar("Signed in with Google!");
      log(userCredential.user!.email as String);
    } catch (e) {
      _showSnackBar("Google sign in failed: $e");
      throw Exception("Google sign in failed: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  // Facebook Sign-in
  Future<void> signInWithFacebook() async {
    // setState(() => isLoading = true);
    // try {
    //   final LoginResult result = await FacebookAuth.instance.login();
    //   if (result.status == LoginStatus.success) {
    //     final OAuthCredential credential = FacebookAuthProvider.credential(
    //       result.accessToken!.token,
    //     );
    //     await auth.signInWithCredential(credential);
    //     _showSnackBar("Signed in with Facebook!");
    //   } else {
    //     _showSnackBar("Facebook sign in cancelled");
    //   }
    // } catch (e) {
    //   _showSnackBar("Facebook sign in failed: $e");
    // } finally {
    //   setState(() => isLoading = false);
    // }
  }

  // Apple Sign-in placeholder
  Future<void> signInWithApple() async {
    _showSnackBar("Apple Sign In requires extra setup on iOS");
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign In", style: theme.textTheme.headlineLarge),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
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
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                      onPressed: signInWithEmail,
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
                  const SizedBox(height: 60),
                  // Social Buttons
                  _buildSocialButton(
                    context,
                    icon: Icons.apple,
                    label: "Sign in with Apple",
                    onPress: signInWithApple,
                  ),
                  const SizedBox(height: 16),
                  _buildSocialButton(
                    context,
                    icon: Icons.facebook,
                    label: "Sign in with Facebook",
                    onPress: signInWithFacebook,
                  ),
                  const SizedBox(height: 16),
                  _buildSocialButton(
                    context,
                    icon: FontAwesomeIcons.google,
                    label: "Sign in with Google",
                    onPress: signInWithGoogle,
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
      height: 56,
      child: ElevatedButton(
        onPressed: () => onPress(),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.secondaryHeaderColor,
          foregroundColor: theme.primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: Icon(icon, size: 28)),
            const Spacer(),
            Text(
              label,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
