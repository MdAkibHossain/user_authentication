import '/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthMode { Login, Register }

class AuthUsers extends StatefulWidget {
  const AuthUsers({Key? key}) : super(key: key);
  static const routeMane = '/authUser';

  @override
  _AuthUsersState createState() => _AuthUsersState();
}

class _AuthUsersState extends State<AuthUsers> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Register;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  String fullname = '';
  String email = '';
  String phonenumber = '';
  String password = '';
  Future<void> _save() async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();
      if (_authMode == AuthMode.Register) {
        await Provider.of<Auth>(context, listen: false)
            .register(email, password, fullname, phonenumber);
      }

      await Provider.of<Auth>(context, listen: false).login(email, password);
    } catch (error) {
      ///
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: w,
                  height: h * .28,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 102, 0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Logo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  right: 25,
                  bottom: 40,
                  child: Text(
                    _authMode == AuthMode.Login ? 'Login' : 'Register',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    if (_authMode == AuthMode.Register)
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Fullname',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onSaved: (value) {
                          fullname = value!;
                        },
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                    if (_authMode == AuthMode.Register)
                      const SizedBox(
                        height: 20,
                      ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onSaved: (value) {
                        email = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (_authMode == AuthMode.Register)
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onSaved: (value) {
                          phonenumber = value!;
                        },
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                    if (_authMode == AuthMode.Register)
                      const SizedBox(
                        height: 20,
                      ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onSaved: (value) {
                        password = value!;
                      },
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (_authMode == AuthMode.Login)
                          FlatButton(
                            onPressed: () {},
                            child: const Text('Forget Password ?'),
                          ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 30,
                  width: w * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 102, 0),
                  ),
                  child: FlatButton(
                    onPressed: _save,
                    child: Text(
                        _authMode == AuthMode.Login ? 'Login' : 'Register',
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_authMode == AuthMode.Login
                        ? 'Don\'t have an account ?'
                        : 'Already a member?'),
                    FlatButton(
                      child: Text(
                          _authMode == AuthMode.Login ? 'Register' : 'Login',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 102, 0),
                          )),
                      onPressed: _switchAuthMode,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
