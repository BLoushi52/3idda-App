import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../widgets/my_textfield.dart';
import '../../widgets/square_tile.dart';
import '../providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              Image.asset(
                'assets/3idda-logo-black.png',
                width: 250,
              ),

              const SizedBox(height: 45),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: CupertinoButton.filled(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  onPressed: () async {
                    var success = await context.read<AuthProvider>().login(
                        username: usernameController.text,
                        password: passwordController.text);
                    print(success);
                    if (success) {
                      context.go('/home');
                      print("Login Successful"); // for testing
                    } else
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.error_outline_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              Text("Login Unsuccessful"),
                            ],
                          ),
                        ),
                      );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 55, vertical: 10),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              //* sign in button

              const SizedBox(height: 50),

              //* or continue with

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              //* google + apple sign in buttons

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  CupertinoButton(
                      onPressed: () {},
                      child: SquareTile(imagePath: 'assets/google.png')),

                  // apple button
                  CupertinoButton(
                      onPressed: () {},
                      child: SquareTile(imagePath: 'assets/apple.png'))
                ],
              ),

              const SizedBox(height: 50),

              //* not a member? register now

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member? ',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          context.push('/register');
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Or just ',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          context.replace('/home');
                        },
                        child: const Text(
                          'Start Exploring',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
