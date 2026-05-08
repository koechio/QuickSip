import 'package:flutter/material.dart';
import 'auth_widgets.dart';

/// A page that allows new users to create an account by providing credentials.
/// 
/// This widget provides a structured interface for entering an email, 
/// password, and password confirmation. It relies on external reusable 
/// components to maintain visual consistency with the Login screen.
/// 
/// This is a stateless widget; it does not persist user data or manage 
/// authentication state directly. It triggers the [onTap] callback of the 
/// primary button to initiate registration logic.
/// 
/// For edge cases, such as the keyboard obscuring input fields, the layout 
/// is wrapped in a [SingleChildScrollView]. It does not perform internal 
/// string validation (e.g., regex for emails); this should be handled 
/// within the button's [onTap] logic or a Form state.
/// 
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(builder: (context) => const RegisterPage()),
/// );
/// ```
/// 
/// **Parameters**
/// * [key]: Standard Flutter widget key.
/// 
/// **Returns**
/// * A [Scaffold] containing the registration form layout.
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers to capture user input
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top Part: Icon
                const Icon(Icons.person_add, size: 100, color: Colors.brown),
                const SizedBox(height: 40),

                // Header Text
                Text(
                  'Create an account to get started!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                const SizedBox(height: 25),

                // Email field
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                // Password field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                // Confirm Password field
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // Sign Up Button
                MyButton(
                  text: "Sign Up",
                  onTap: () {
                    // Add registration logic here:
                    // 1. Check if passwords match
                    // 2. Call auth service
                  },
                ),

                const SizedBox(height: 50),

                // Reusable Bottom Link pointing back to Login
                AuthOptionLink(
                  prompt: "Already have an account?",
                  actionText: "Login now",
                  onTap: () {
                    // Navigate back to Login page
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}