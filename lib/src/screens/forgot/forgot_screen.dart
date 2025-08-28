import 'package:flutter/material.dart';
import 'dart:async';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final int otpLength = 4;

  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  Timer? _timer;
  int _seconds = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _startCountdown() {
    print('Starting countdown'); // Add this
    setState(() {
      _seconds = 30;
      _canResend = false;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print('Timer tick: $_seconds'); // Add this
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
          _canResend = true;
          print('Timer finished'); // Add this
        }
      });
    });
  }

  void _onResendTap() {
    if (_canResend) {
      _timer?.cancel(); // Cancel existing timer first
      _startCountdown();
      // Add your resend logic here
      print('Resend pressed');
    }
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
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
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'lib/src/assets/text_logo.png',
                        height: 24,
                        width: 70,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
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
                  ],
                ),
              ),
              Text(
                'Forgot your Password',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Enter the verification code sent to your email sample@example.com',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff60655C),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(otpLength, (index) {
                  return Container(
                    margin: EdgeInsets.only(
                      right: index == otpLength - 1 ? 0 : 16,
                    ),
                    width: 77,
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xff363A33), // Set your desired text color
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE8EBE6),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff54A312),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE8EBE6),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        // Optional fallback
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE8EBE6),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < otpLength - 1) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_focusNodes[index + 1]);
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_focusNodes[index - 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 16,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center, // aligns vertically
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn’t received the code?',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Color(0xff60655C),
                    ),
                  ),
                  if (!_canResend)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        _formatTime(_seconds),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color(0xff60655C),
                        ),
                      ),
                    ),
                  GestureDetector(
                     onTap: _canResend ? _onResendTap : null,  // Disable tap when not allowed
                    child: Container(
                      padding: const EdgeInsets.only(
                        bottom: 2,left: 4
                      ), // gap between text and underline
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _canResend
                                ? Colors.blue
                                : Color(0xffB6B8B6), // underline color
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: _canResend
                              ? Color(0xff363A33)
                              : Color(0xffB6B8B6), // text color
                          decoration:
                              TextDecoration.none, // remove default underline
                        ),
                      ),
                    ),
                  ),
                ],
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  backgroundColor: const Color(0xff54A312),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
