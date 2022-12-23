import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../widgets/register_button.dart';
import '../providers/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final mobileNumberController = TextEditingController();

  final emailController = TextEditingController();

  final civilIDNumberController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  // sign user in method
  // void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.grey[300],
        // title: Text(
        //   'Register',
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontSize: 25,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 5),

                    // logo
                    // const Icon(
                    //   Icons.lock,
                    //   size: 100,
                    // ),
                    Image.asset(
                      'assets/3idda-logo-black.png',
                      width: 200,
                    ),

                    const SizedBox(height: 15),

                    // welcome back, you've been missed!
                    Text(
                      'Welcome to 3idda!',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Please fill in your details below',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 30),

                    //* HEADER 1 - START

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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Account Details',
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
                    // username textfield
                    SizedBox(height: 4),

                    //* HEADER 1 - END

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          controller: usernameController,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required field";
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(height: 10),

                    // password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey[500])),
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required field";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: Colors.grey[500])),
                        controller: confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required field";
                          }
                          if (passwordController.text != value) {
                            return "Password doesn't match";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    SizedBox(height: 15),
                    //* HEADER 2 - START

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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Personal Details',
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
                    // username textfield
                    SizedBox(height: 4),

                    //* HEADER 2 - END

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'First Name',
                            hintStyle: TextStyle(color: Colors.grey[500])),
                        controller: firstNameController,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required field";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Last Name',
                            hintStyle: TextStyle(color: Colors.grey[500])),
                        controller: lastNameController,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required field";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey[500])),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        validator: (value) {
                          RegExp regex = RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?)*$");
                          if (value == null ||
                              value.isEmpty ||
                              !regex.hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //         enabledBorder: const OutlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.white),
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderSide:
                    //               BorderSide(color: Colors.grey.shade400),
                    //         ),
                    //         fillColor: Colors.grey.shade200,
                    //         filled: true,
                    //         hintText: 'Mobile Number',
                    //         hintStyle: TextStyle(color: Colors.grey[500])),
                    //     controller: mobileNumberController,
                    //     obscureText: false,
                    //     validator: (value) {
                    //       if (value == null || value.isEmpty) {
                    //         return "Required field";
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
                    // const SizedBox(height: 10),

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //         enabledBorder: const OutlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.white),
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderSide:
                    //               BorderSide(color: Colors.grey.shade400),
                    //         ),
                    //         fillColor: Colors.grey.shade200,
                    //         filled: true,
                    //         hintText: 'Civil ID Number',
                    //         hintStyle: TextStyle(color: Colors.grey[500])),
                    //     controller: civilIDNumberController,
                    //     obscureText: false,
                    //     validator: (value) {
                    //       if (value == null || value.isEmpty) {
                    //         return "Required field";
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
                    // const SizedBox(height: 10),

                    // forgot password?
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Text(
                    //         'Forgot Password?',
                    //         style: TextStyle(color: Colors.grey[600]),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    const SizedBox(height: 20),

                    // sign in button
                    RegisterButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          var didRegister =
                              await context.read<AuthProvider>().register(
                                    username: usernameController.text,
                                    password: passwordController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                  );
                          if (didRegister) {
                            context.go('/home');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Registration unsuccessful"),
                              ),
                            );
                          }
                        } else {
                          print("form not valid");
                        }
                      },
                    ),

                    // const SizedBox(height: 50),

                    //*  or continue with

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: Divider(
                    //           thickness: 0.5,
                    //           color: Colors.grey[400],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //         child: Text(
                    //           'Or continue with',
                    //           style: TextStyle(color: Colors.grey[700]),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Divider(
                    //           thickness: 0.5,
                    //           color: Colors.grey[400],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // const SizedBox(height: 50),

                    // //* google + apple sign in buttons
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     // google button
                    //     SquareTile(imagePath: 'assets/google.png'),

                    //     SizedBox(width: 25),

                    //     // apple button
                    //     SquareTile(imagePath: 'assets/apple.png')
                    //   ],
                    // ),

                    // const SizedBox(height: 50),

                    // //* not a member? register now
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'Not a member?',
                    //       style: TextStyle(color: Colors.grey[700]),
                    //     ),
                    //     const SizedBox(width: 4),
                    //     const Text(
                    //       'Register now',
                    //       style: TextStyle(
                    //         color: Colors.blue,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
