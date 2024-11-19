import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hume_dating_app/screens/invite_friends.dart';
import 'package:hume_dating_app/widgets/text_field.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var isChecked = false;
  var password1 = '';
  var password2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          "Create New Password",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_sharp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 73.67),
              Center(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  semanticsLabel: 'Logo',
                  height: 250,
                  width: 329,
                ),
              ),
              const SizedBox(height: 73.67),
              const Text(
                "Create Your New Password",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                password: (password) {
                  password1 = password;
                },
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                password: (password) {
                  password2 = password;
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      side: const BorderSide(
                        color: Color(0xFF9610FF),
                      ),
                      activeColor: const Color(0xFF9610FF),
                      value: isChecked,
                      onChanged: (value) {
                        setState(
                          () {
                            isChecked = value!;
                          },
                        );
                      },
                    ),
                    const Text(
                      "Remember me",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 63.67),
              Container(
                width: double.maxFinite,
                height: 58,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF9610FF).withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 24,
                      offset: const Offset(4, 8),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9610FF),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (password1.length < 6 || password1.trim().isEmpty) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Please enter valid passwords in both feilds"),
                        ),
                      );
                    } else if (password1.length < 6 ||
                        password1.trim().isEmpty) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Please enter valid passwords in both feilds"),
                        ),
                      );
                    } else if (password1 == password2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const InviteFriendsScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Please enter valid passwords in both feilds"),
                        ),
                      );
                    }
                  },
                  child: const Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
