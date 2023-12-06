import 'package:flutter/material.dart';
import 'package:frontend/controller/income_controller.dart';

import '../../models/income.dart';
import 'add-income.dart';
import 'list-income.dart';

class ListDetailedIncomeScreen extends StatefulWidget {
  final Income income;
  ListDetailedIncomeScreen({Key? key, required this.income}) : super(key: key);

  @override
  State<ListDetailedIncomeScreen> createState() => _ListDetailedIncomeScreenState();
}

class _ListDetailedIncomeScreenState extends State<ListDetailedIncomeScreen> {

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
    final productName = widget.income.name;
    final productDate = widget.income.date;
    final productAmount = widget.income.amount;
    final productDescription = widget.income.description;
    final productPeriodicityNumber = widget.income.periodicityNumber;

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
          "Detalhe da Renda",
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
                  builder: (context) => ListIncomeScreen()
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
                    buildText("Valor da Renda", FontWeight.w700, 14),
                    buildText(productAmount.toString(), FontWeight.w400, 12),
                    buildDivider(),

                    buildText("Data da Renda", FontWeight.w700, 14),
                    buildText(productDate.toString(), FontWeight.w400, 12),
                    buildDivider(),

                    buildText("Descrição da renda", FontWeight.w700, 14),
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
                          MaterialPageRoute(builder: (context) => AddIncomeScreen(income: widget.income)),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () async {
                        int incomeId = widget.income.id?.toInt() ?? 0;
                        await deleteIncome(incomeId);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListIncomeScreen()),
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
