import 'package:coffee_card/screens/signup.dart';
import 'package:flutter/material.dart';
import 'auth_widgets.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers to capture user input
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top Part: Logo or Icon
                const Icon(Icons.lock, size: 100, color: Colors.brown),
                const SizedBox(height: 50),

                // Welcome Message
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                const SizedBox(height: 25),

                // Input Fields
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // Login Button
                MyButton(
                  text: "Log In",
                  onTap: () {
                    // Logic for login goes here
                  },
                ),

                const SizedBox(height: 50),

                // Reusable Bottom Link
                AuthOptionLink(
                  prompt: "Don't have an account?",
                  actionText: "Register now",
                  onTap: () {
                    Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
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