import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _isAuthenticating = false;

  var _enteredEmail = '';
  var _enteredUsername = '';
  var _enteredPassword = '';

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }
    _form.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        final userCredential = await _firebase
            .signInWithEmailAndPassword(
              email: _enteredEmail,
              password: _enteredPassword,
            );
      } else {
        final userCredential = await _firebase
            .createUserWithEmailAndPassword(
              email: _enteredEmail,
              password: _enteredPassword,
            );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
              'username': _enteredUsername,
              'email': _enteredEmail,
              'imageUrl':
                  'https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-1170x780.jpg',
            });
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message ?? 'Authentication Failed!',
          ),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: Image.asset(
                  'assets/images/chat.png',
                  scale: 2,
                ),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsetsGeometry.all(
                      16,
                    ),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration:
                                const InputDecoration(
                                  label: Text(
                                    "Email Address",
                                  ),
                                ),
                            keyboardType:
                                TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization:
                                TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter a valid email addreess';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredEmail = value!;
                            },
                          ),
                          if (!_isLogin)
                            TextFormField(
                              decoration:
                                  const InputDecoration(
                                    label: Text("Username"),
                                  ),
                              textCapitalization:
                                  TextCapitalization.words,
                              autocorrect: false,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().length <
                                        4) {
                                  return 'Please enter atleast 4 characters.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredUsername = value!;
                              },
                            ),
                          TextFormField(
                            decoration:
                                const InputDecoration(
                                  label: Text("Password"),
                                ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().length < 6) {
                                return 'Password must be 6 characters long.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                          const SizedBox(height: 12),
                          if (_isAuthenticating)
                            const CircularProgressIndicator(),
                          if (!_isAuthenticating)
                            ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                              ),
                              child: Text(
                                _isLogin
                                    ? "Login"
                                    : "Sign Up",
                              ),
                            ),
                          if (!_isAuthenticating)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                _isLogin
                                    ? "Create an Account"
                                    : 'Already have an account? Login',
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
