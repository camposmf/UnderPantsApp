import 'package:flutter/material.dart';
import 'package:frontend/widget/saving-goal/list-saving-goal.dart';
import 'package:frontend/widget/user/login.dart';
import '../models/user.dart';
import 'expense/list-expense.dart';
import 'financial-history/list-finance.dart';
import 'income/list-income.dart';

class HomeScreen extends StatefulWidget {
  final User? user;
  const HomeScreen({Key? key, this.user}) : super(key: key);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ListIncomeScreen(),
    ListExpenseScreen(),
    ListFinanceScreen(),
    ListSavingGoalScreen(),
    LoginScreen()
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _navigateTo(BuildContext context, int index) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen._widgetOptions[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UndesPants Group"),
        backgroundColor: Color(0xFF53A1F5),
        elevation: 4,
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      body: Center(
        child: Text("UndesPants Group"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(widget.user?.name ?? "undefined"),
                accountEmail: Text(widget.user?.email ?? "undefined"),
                currentAccountPicture: Image.asset('assets/underpants.png'),
                decoration: BoxDecoration(
                  color: Color(0xFF53A1F5),
                )),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _navigateTo(context, 0);
              },
            ),
            ListTile(
              title: const Text('Minhas Rendas'),
              selected: _selectedIndex == 1,
              onTap: () {
                _navigateTo(context, 1);
              },
            ),
            ListTile(
              title: const Text('Minhas Despesas'),
              selected: _selectedIndex == 2,
              onTap: () {
                _navigateTo(context, 2);
              },
            ),

            ListTile(
              title: const Text('Histórico financeiro'),
              selected: _selectedIndex == 3,
              onTap: () {
                _navigateTo(context, 3);
              },
            ),

            ListTile(
              title: Text(
                'Minhas Metas (Em Dev)',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              // title: const Text('Minhas Metas'),
              // selected: _selectedIndex == 1,
              // onTap: _selectedIndex == 1 ? null : () {
              //   _navigateTo(context, 1);
              // },
            ),
            Divider(height: 200),
            ListTile(
              title: const Text('Logout'),
              selected: _selectedIndex == 5,
              onTap: () {
                _navigateTo(context, 5);
              },
            ),
          ],
        ),
      ),
    );
  }
}
