import 'package:flutter/material.dart';
import 'package:frontend/widget/home.dart';
import 'package:frontend/widget/income/add-income.dart';
import 'package:frontend/widget/user/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bolso Inteligente",
      //home: SplashScreen(),
      home: HomeScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Adicione a lógica de espera de 5 segundos aqui antes de navegar para a tela de login
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AddIncomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bolso Inteligente",
              style: TextStyle(
                fontSize: 32,
                color: Color(0xFF53A1F5),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Das despesas aos investimentos",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF53A1F5),
              ),
            ),
            SizedBox(height: 20),
            Image.asset('assets/img_main.png', height: 150, width: 150),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
