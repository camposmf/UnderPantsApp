import 'package:flutter/material.dart';
import 'package:frontend/controller/expense_controller.dart';

import '../../models/expense.dart';
import 'add-expense.dart';
import 'list-detailed-expense.dart';

class ListExpenseScreen extends StatefulWidget {
  const ListExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ListExpenseScreen> createState() => _ListExpenseScreenState();
}

class _ListExpenseScreenState extends State<ListExpenseScreen> {
  final List<Expense> _expenses = <Expense>[];
  List<Expense> _expensesDisplay = <Expense>[];

  @override
  void initState() {
    super.initState();
    fetchExpenses().then((value) =>
    {
      setState(() {
        _expenses.addAll(value);
        _expensesDisplay = _expenses;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF4193F3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Controle de Despesas",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 24,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF4193F3),
        child: Icon(
          Icons.add,
          color: Color(0xffffffff),
          size: 24,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddExpenseScreen()
            ),
          );
        },
      ),
      body: ListView.builder(
        itemCount: _expensesDisplay.length,
        itemBuilder: (context, index) {
          final expense = _expensesDisplay[index];
          return Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ListDetailedExpenseScreen(expense: expense),
                ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          expense.name,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            expense.description ?? '',
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "R\$: ${expense.amount}",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
