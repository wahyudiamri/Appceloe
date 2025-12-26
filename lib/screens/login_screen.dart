import 'package:flutter/material.dart';
import 'package:appceloe/utils/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Use a Stack or Column to lay out the background image/header if needed
        // For now, following the clean white look with bottom wave
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30), // Top spacing
              // University Building Image Header
              // Image.asset('assets/building.png'),
               Container(
                height: 250,
                alignment: Alignment.center,
                 // Placeholder for the building image and logo overlay
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                     Container(
                       height: 200,
                       width: double.infinity,
                       color: Colors.grey[300], // Placeholder color
                        child: const Center(child: Text("University Building Image")),
                     ),
                    Transform.translate(
                      offset: const Offset(0, 30),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: CeloeTheme.primaryColor,
                        child: const Icon(Icons.school, size: 40, color: Colors.white), // Logo placeholder
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email 365',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Bantuan ?',
                    style: TextStyle(color: CeloeTheme.primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Bottom wave decoration placeholder
              Container(
                 height: 100,
                 decoration: const BoxDecoration(
                   color: CeloeTheme.primaryColor,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(100),
                     topRight: Radius.circular(100),
                   )
                 ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
