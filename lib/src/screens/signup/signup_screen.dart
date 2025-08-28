import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController passwd = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isChecked = false;
  bool _isValid = false;
  
  String? _emailError;
  String? _passwdError;


 void _validateInput() {
    setState(() {
      if (email.text.trim().isEmpty) {
        _emailError = 'This field is required';
        _isValid = false;
      } else if (passwd.text.trim().isEmpty){
         _passwdError = 'This field is required';
         _isValid = false;
      }else {
        _emailError = null;
        _passwdError = null;
        _isValid = true;
      }
    });
  }

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
                              Text(
                                'Back',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Color(0xff363A33),
                                ),
                              ),
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
                  'Create to your account',
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
                style: TextStyle(color: Color(0xff363A33), fontWeight: FontWeight.w400, fontFamily: 'Poppins',fontSize: 15,),
                cursorColor: Color(0xff54A312),
                cursorErrorColor: Color(0xffE25839),
                decoration: InputDecoration(
                  hintText: 'email Address',
                    focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE25839), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                  errorText: _emailError,
                  errorStyle: TextStyle(
                    color: Color(0xffE25839),
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 33),
              TextField(
                controller: passwd,
                cursorErrorColor: Color(0xffE25839),
                 style: TextStyle(color: Color(0xff363A33), fontWeight: FontWeight.w400, fontFamily: 'Poppins',fontSize: 15,),
                obscureText: _isPasswordVisible,
                cursorColor: Color(0xff54A312),
                decoration: InputDecoration(
                 focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE25839), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                   errorStyle: TextStyle(
                    color: Color(0xffE25839),
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  errorText: _passwdError,
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
              SizedBox(height: 21),
              CheckboxListTile(
                value: _isChecked,
                onChanged: (value) =>
                    setState(() => _isChecked = value ?? false),
                title: Text('I agree to terms & conditions'),
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity.compact,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Color(0xff4D9511),
                checkColor: Colors.white,
                side: BorderSide(color: Colors.grey, width: 2),

                // Remove all interaction effects
                tileColor: Colors.transparent,
                selectedTileColor: Colors.transparent,
                hoverColor: Colors.transparent,
                enableFeedback: false,
                autofocus: false,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: keyboardHeight, left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                   _validateInput();                  
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  backgroundColor: _isValid ? Color(0xff54A312) : Color(0xffE8EBE6),
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
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
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
