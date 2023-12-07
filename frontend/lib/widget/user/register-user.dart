import 'dart:convert';

import 'package:flutter/material.dart';

import '../../controller/user_controller.dart';
import '../../models/user.dart';
import 'login.dart';

class CreateUserScreen extends StatefulWidget {
  final User? user;
  const CreateUserScreen({Key? key, this.user}) : super(key: key);

  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bornDateController = TextEditingController();
  final TextEditingController cpfNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    // if (widget.user == null) {
    //   nameController.text = "";
    //   emailController.text = "";
    //   bornDateController.text = "";
    //   cpfNumberController.text = "";
    //   passwordController.text = "";
    // } else {
    //   nameController.text = widget.user?.name ?? "";
    //   emailController.text = widget.user?.email ?? "";
    //   bornDateController.text = widget.user?.bornDate ?? "";
    //   cpfNumberController.text = widget.user?.cpfNumber ?? "";
    //   passwordController.text = widget.user?.password ?? "";
    // }

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    child: Image.asset('assets/img.png'),
                  ),
                  Text(
                    widget.user == null ? "Cria uma nova" : "Alterar uma",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    "conta",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      color: Color(0xff000000),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
                    child: TextFormField(
                      controller: nameController,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Obrigatório';
                        }
                        return null;
                      },
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        // rest of your InputDecoration code
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: cpfNumberController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatório';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Número CPF',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    child: TextFormField(
                      controller: bornDateController,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Obrigatório';
                        }
                        return null;
                      },
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Data de Nascimento',
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatório';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: obscureTextPassword,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Obrigatório';
                        }
                        return null;
                      },
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        // rest of your InputDecoration code
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              obscureTextPassword = !obscureTextPassword;
                            });
                          },
                          child: Icon(
                            obscureTextPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xff9f9d9d),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
                    child: MaterialButton(
                      onPressed: () {
                        _submitForm();
                      },
                      color: Color(0xFF53A1F5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        widget.user == null ? "Cadastrar" : "Alterar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      textColor: Color(0xffffffff),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Já possui uma conta?",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Entrar",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xFF53A1F5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {

    if (_formKey.currentState?.validate() ?? false) {

      String name = nameController.text;
      String bornDate = bornDateController.text;
      String email = emailController.text;
      String password = passwordController.text;
      String cpfNumber = cpfNumberController.text;

      User objUser = User(
          name,
          email,
          password,
          bornDate,
          cpfNumber
      );

      try {
        // Create new user
        if (widget.user == null) {
          await createUser(objUser);
          _showSuccessDialog();
        }
        // Update income
        else {
          int userId = widget.user?.id ?? 0;
          await editUser(userId, objUser);
          _showSuccessDialog();
        }
      } catch (e) {
        print('Erro durante o User: $e');
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Usuário cadastrado com sucesso"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o AlertDialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
