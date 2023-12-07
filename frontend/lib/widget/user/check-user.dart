import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/controller/user_controller.dart';
import 'package:frontend/widget/user/change-password.dart';

class CheckUserScreen extends StatefulWidget {
  const CheckUserScreen({super.key});

  @override
  State<CheckUserScreen> createState() => _CheckUserScreenState();
}

class _CheckUserScreenState extends State<CheckUserScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xff212435),
            size: 24,
          ),
        ),
      ),
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 30),
                    child: Text(
                      "Checar usuário",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: cpfController,
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
                      hintText: "CPF",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff9f9d9d),
                      ),
                      filled: true,
                      fillColor: Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: MaterialButton(
                      onPressed: () async {
                        String cpf = cpfController.text;
                        var user = await getUserByCpf(cpf);

                        if(user != null){
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen(user: user)
                            ),
                          );
                        }
                        else {
                          _showDialog();
                          cpfController.text = "";
                        }
                      },
                      color: Color(0xFF53A1F5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Checar",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Usuário não existem na base de dados. Por favor digite um CPF válido."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o AlertDialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
