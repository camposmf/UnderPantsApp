import 'package:flutter/material.dart';

import '../../controller/expense_controller.dart';
import '../../models/expense.dart';
import 'add-expense.dart';
import 'list-expense.dart';

class ListDetailedExpenseScreen extends StatefulWidget {
  final Expense expense;
  const ListDetailedExpenseScreen({Key? key, required this.expense}) : super(key: key);
  @override
  State<ListDetailedExpenseScreen> createState() => _ListDetailedExpenseScreenState();
}

class _ListDetailedExpenseScreenState extends State<ListDetailedExpenseScreen> {
  Widget buildText(String text, FontWeight fontWeight, double fontSize) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Text(
        text,
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: Color(0xff000000),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: Color(0xffd7d7d7),
      height: 16,
      thickness: 0.7,
      indent: 0,
      endIndent: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productName = widget.expense.name;
    final productDate = widget.expense.date;
    final productAmount = widget.expense.amount;
    final productDescription = widget.expense.description;
    final productPeriodicityNumber = widget.expense.periodicityNumber;

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
          "Detalhe da Despesa",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ListExpenseScreen()
              ),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          productName,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color(0xff000000),
                          ),
                        ),
                        SizedBox(height: 64), // Espaçamento ajustado usando SizedBox
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText("Valor da Despesa", FontWeight.w700, 14),
                    buildText(productAmount.toString(), FontWeight.w400, 12),
                    buildDivider(),

                    buildText("Data da Despesa", FontWeight.w700, 14),
                    buildText(productDate.toString(), FontWeight.w400, 12),
                    buildDivider(),

                    buildText("Descrição da Despesa", FontWeight.w700, 14),
                    buildText(productDescription, FontWeight.w400, 12),
                    buildDivider(),
                  ],
                ),
              ),
              Container(
                height: 510,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.orange,
                      onPressed: () {

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddExpenseScreen(expense: widget.expense)),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () async {
                        int expenseId = widget.expense.id?.toInt() ?? 0;
                        await deleteExpense(expenseId);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListExpenseScreen()),
                        );
                      },
                    ),
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