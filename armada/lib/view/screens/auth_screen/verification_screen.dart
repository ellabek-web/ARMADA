import 'dart:async';

import 'package:armada/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../provider/drop_down_provider.dart';
import '../screens.dart';

class Verify extends StatefulWidget {
  static const String routeName = '/verify';
  const Verify({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        return const Verify();
      },
    );
  }

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final _otpController1 = TextEditingController();
  final _otpController2 = TextEditingController();
  final _otpController3 = TextEditingController();
  final _otpController4 = TextEditingController();

  String _userEnteredOTP = '';
  int _remainingSeconds = 60;
  bool _isCountdownActive = false;

  late Timer _countdownTimer;

  @override
  void initState() {
    super.initState();

    // Start the countdown timer
    startCountdown();
  }

  void startCountdown() {
    setState(() {
      _isCountdownActive = true;
    });

    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          stopCountdown();
        }
      });
    });
  }

  void stopCountdown() {
    setState(() {
      _isCountdownActive = false;
    });

    _countdownTimer.cancel();
  }

  void resendOTP() {
    setState(() {
      _remainingSeconds = 60;
    });

    startCountdown();
  }

  @override
  void dispose() {
    super.dispose();

    if (_countdownTimer != null) {
      _countdownTimer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              addVerticalSpace(89),
              Center(
                child: Text("Verify Your Phone.",
                    style: Theme.of(context).textTheme.displayLarge),
              ),
              addVerticalSpace(60),
              Center(
                child: Text(
                    "Enter the verification OTP sent\n       to your phone number.",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              addVerticalSpace(45),
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      verifyInputBox(context, "pin1", _otpController1),
                      verifyInputBox(context, "pin2", _otpController2),
                      verifyInputBox(context, "pin3", _otpController3),
                      verifyInputBox(context, "pin4", _otpController4),
                    ],
                  ),
                ),
              ),
              addVerticalSpace(32),

              Text(
                _isCountdownActive
                    ? 'Resend OTP in $_remainingSeconds seconds'
                    : '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              addVerticalSpace(26),
              if (!_isCountdownActive)
                Text(
                  "Did't recieve the code?",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              addVerticalSpace(1.0),
              if (!_isCountdownActive)
                GestureDetector(
                  onTap: () {
                    resendOTP();
                  },
                  child: Text(
                    "Resend",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              addVerticalSpace(126),
              // Button(context, "Verify", '/VerifyFarm',
              //     Theme.of(context).primaryColor, 150, 55),
              InkWell(
                onTap: () {
                  _userEnteredOTP = _otpController1.text +
                      _otpController2.text +
                      _otpController3.text +
                      _otpController4.text;
                  // print(_userEnteredOTP);
                  validateOTP(_userEnteredOTP);
                  // dispose();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 150,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Center(
                    child: Text(
                      "login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget verifyInputBox(
      BuildContext context, String p, TextEditingController controller) {
    return SizedBox(
      height: 68.0,
      width: 64.0,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (p) {},
        style: Theme.of(context).textTheme.displayLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.green,
              )),
          contentPadding: EdgeInsets.only(bottom: 25),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.green,
              )),
        ),
      ),
    );
  }

  void validateOTP(String enteredOTP) {
    // Call an API endpoint to verify the OTP
    // You can use a third-party service like Twilio for this purpose
    String sentOTP = "";
    if (sentOTP == sentOTP) {
      // If the OTPs match, mark the user as verified
      // setUserVerified(true);

      // Save the user details to the database
      // saveUserDetails(phoneNumber, fullName);
      print("valuselectedAccount");

      // Navigate to the home page
      // Consumer<DropDownProvider>(builder: (context, value, child) {
      //   if (value.selectedAccount == "Farmer") {
      //     print(value.selectedAccount);
      //     return const VerifyFarm();
      //   } else if (value.selectedAccount == "Service Provider") {
      //     print(value.selectedAccount);
      //     return const VerifyServiceProvider();
      //   } else {
      //     return Container();
      //   }
      // });

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),
      // );
      Navigator.pushNamed(context, '/VerifyFarm');
    } else {
      // If the OTPs do not match, show an error message
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                backgroundColor: Theme.of(context).primaryColor,
                content: Text(
                  "Incorrect OTP",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        _otpController1.clear();
                        _otpController2.clear();
                        _otpController3.clear();
                        _otpController4.clear();
                        Navigator.pop(context);
                      },
                      child: Text("OK"))
                ],
              ));
    }
  }
}
