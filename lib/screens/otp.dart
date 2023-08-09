import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/auth_provider.dart';
import 'home.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp';
  final String verificationId;

  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/otp.jpeg',
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(height: 50,),
                  Text(
                    'Verification',
                    style: TextStyle(
                      fontFamily: 'Brand Bold',
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter the OTP sent to your Phone number',
                    style: TextStyle(color: Colors.black54, fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 20),
                  Pinput(
                    length: 6,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.purple.shade200,
                        ),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onCompleted: (value) {
                      setState(() {
                        otpCode = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    onPressed: () {
                      if (otpCode != null) {
                        verifyOtp(context, otpCode!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Enter 6 Digit code'),
                          ),
                        );
                      }
                    },
                    child: Text('Verify'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: Text("Didn't received any code?")),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          if (otpCode == null) {
                            verifyOtp(context, otpCode!);
                          }
                        },
                        child: Text('Resend')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        getUserName();
      },
    );
  }

  void resendOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        getUserName();
      },
    );
  }
  void getUserName() {
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        contentPadding: EdgeInsets.all(8),
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text('Enter your name'),
            ),
            controller: nameController,
          ),
          TextButton(
            onPressed: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('userName', nameController.text);
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}
