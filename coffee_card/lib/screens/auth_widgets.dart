import 'package:flutter/material.dart';

/// A customized text field designed for authentication inputs.
/// 
/// This widget handles its own decoration styling to ensure consistency 
/// across the app. It does not manage focus or validation internally.
/// 
/// ```dart
/// MyTextField(
///   controller: emailController,
///   hintText: 'Email',
///   obscureText: false,
/// )
/// ```
/// 
/// **Parameters**
/// * [controller]: The TextEditingController to manage the text input.
/// * [hintText]: The text displayed when the field is empty.
/// * [obscureText]: Whether to hide the text (useful for passwords).
/// 
/// **Returns**
/// * A Padding-wrapped TextFormField.
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown[700]!),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}

/// A primary action button with a rounded aesthetic.
/// 
/// Triggers an asynchronous or synchronous callback when tapped. It provides 
/// visual feedback via the GestureDetector.
/// 
/// ```dart
/// MyButton(
///   onTap: () => print('Pressed'),
///   text: 'Log In',
/// )
/// ```
/// 
/// **Parameters**
/// * [onTap]: The function to execute when the button is pressed.
/// * [text]: The label displayed inside the button.
/// 
/// **Returns**
/// * A styled Container wrapped in a GestureDetector.
class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.brown[700],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A navigation link widget used at the bottom of auth screens.
/// 
/// Displays a prompt (e.g., "Not a member?") alongside a clickable action 
/// text (e.g., "Register now").
/// 
/// ```dart
/// AuthOptionLink(
///   prompt: "Already have an account?",
///   actionText: "Login now",
///   onTap: () => goToLogin(),
/// )
/// ```
/// 
/// **Parameters**
/// * [prompt]: The static leading text.
/// * [actionText]: The blue, bolded text that triggers the [onTap].
/// * [onTap]: Navigation or toggle logic.
/// 
/// **Returns**
/// * A Row containing Text and GestureDetector widgets.
class AuthOptionLink extends StatelessWidget {
  final String prompt;
  final String actionText;
  final Function()? onTap;

  const AuthOptionLink({
    super.key,
    required this.prompt,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          prompt,
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}