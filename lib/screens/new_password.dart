import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:hume_dating_app/screens/invite_friends.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();

  @override
  void dispose() {
    _password1Controller.dispose();
    _password2Controller.dispose();
    super.dispose();
  }

  var isShown1 = false;
  var isShown2 = false;

  void showPassword1() {
    setState(() {
      isShown1 = !isShown1;
    });
  }

  void showPassword2() {
    setState(() {
      isShown2 = !isShown2;
    });
  }

  var isChecked = false;

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
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _password1Controller,
                        validator: (value) {
                          return (value == null || value.length < 6)
                              ? 'Enter a valid password'
                              : null;
                        },
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: !isShown1,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFAFAFA),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: IconButton(
                            iconSize: 20,
                            icon: const SvgIcon(
                              icon: SvgIconData('assets/images/Lock.svg'),
                            ),
                            onPressed: () {},
                          ),
                          suffixIcon: IconButton(
                            iconSize: 20,
                            icon: const SvgIcon(
                              icon: SvgIconData('assets/images/Hide.svg'),
                            ),
                            onPressed: showPassword1,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _password2Controller,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Enter a valid password';
                          } else if (value != _password1Controller.text) {
                            return 'Paswords do not match';
                          }
                          return null;
                        },
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: !isShown2,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFAFAFA),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: IconButton(
                            iconSize: 20,
                            icon: const SvgIcon(
                              icon: SvgIconData('assets/images/Lock.svg'),
                            ),
                            onPressed: () {},
                          ),
                          suffixIcon: IconButton(
                            iconSize: 20,
                            icon: const SvgIcon(
                              icon: SvgIconData('assets/images/Hide.svg'),
                            ),
                            onPressed: showPassword2,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  )),
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
                    if (_formKey.currentState!.validate()) {
                      _password1Controller.clear();
                      _password2Controller.clear();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const InviteFriendsScreen(),
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
