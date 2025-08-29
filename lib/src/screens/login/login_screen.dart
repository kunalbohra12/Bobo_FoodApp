import 'package:demo_app/src/screens/forgot/forgot_screen.dart';
import 'package:demo_app/src/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
// import 'package:demo_app/utils/validators.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController passwd = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50, // Give it enough height
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Centered image
                    Center(
                      child: Image.asset(
                        'lib/src/assets/text_logo.png',
                        height: 24,
                        width: 70,
                      ),
                    ),
                    // Left back button + text
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context,
                        ); // Goes back to the previous screen
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'lib/src/assets/back_arrow.png',
                                height: 12,
                                width: 7,
                              ),
                              SizedBox(width: 8),
                              Text('Back'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  'Log in to your account',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),

              TextField(
                controller: email,
                cursorColor: Color(0xff54A312),
                decoration: InputDecoration(
                  hintText: 'email Address',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE8EBE6), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff54A312), width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE8EBE6), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Optional fallback
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE8EBE6), width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              SizedBox(height: 33),
              
              TextField(
                controller: passwd,
                obscureText: _isPasswordVisible,
                cursorColor: Color(0xff54A312),
                decoration: InputDecoration(
                  hintText: 'password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE8EBE6), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff54A312), width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE8EBE6), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE8EBE6), width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_sharp
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Add logic to toggle password visibility
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ForgotScreen()),
                      );
                },
                style: const ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(
                    Colors.transparent,
                  ), // Removes the overlay color on press
                  splashFactory:
                      NoSplash.splashFactory, // Removes the ripple effect
                ),
                child: Text(
                  'forgot Password',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff408308),
                  ),
                ),
              ),
              // SizedBox(height:20)
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom:keyboardHeight,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  backgroundColor: const Color(0xff54A312),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff60655C),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff3A3533),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
