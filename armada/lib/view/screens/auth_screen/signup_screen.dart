import 'package:armada/utils/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:armada/view/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  static const String routeName = '/signup';

// till line 19 route code
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        return const SignUp();
      },
    );
  }

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _Numbercontroller = TextEditingController();
  final TextEditingController _Emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _userNamecontroller = TextEditingController();
  final TextEditingController _confirmPasswordcontroller =
      TextEditingController();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              addVerticalSpace(55.0),
              Center(
                child: Text("Create Account.",
                    style: Theme.of(context).textTheme.displayLarge),
              ),
              addVerticalSpace(50.0),
              InputText(
                  context,
                  "Full name",
                  "abebe",
                  false,
                  Icons.person_3_sharp,
                  TextInputType.name,
                  _userNamecontroller),
              addVerticalSpace(15.0),
              // InputText(context, "Phone", "0912345678", false,
              //     Icons.phone_sharp, TextInputType.phone, _Numbercontroller),
              addVerticalSpace(15.0),
              InputText(
                  context,
                  "Email (optional)",
                  "example@gmail.com",
                  false,
                  Icons.email_sharp,
                  TextInputType.emailAddress,
                  _Emailcontroller),
              addVerticalSpace(15.0),
              // InputTextPassword(context, "Password", true, Icons.lock_sharp,
              //     TextInputType.text, _passwordcontroller),
              addVerticalSpace(15.0),
              // InputTextPassword(
              //     context,
              //     "Confirm Password",
              //     true,
              //     Icons.lock_sharp,
              //     TextInputType.text,
              //     _confirmPasswordcontroller),
              addVerticalSpace(15.0),
              accountSelector(context),
              addVerticalSpace(10.0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      value: value,
                      onChanged: (bool? value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                  ),
                  Text(
                    "I agree to the term and condition",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              addVerticalSpace(20.0),
              Button(context, "Register", '/verify',
                  Theme.of(context).primaryColor, 150, 55),
              addVerticalSpace(24.0),
              Text(
                "Already have an account.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              addVerticalSpace(1.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
