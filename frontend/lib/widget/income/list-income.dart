import '../../models/income.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widget/income/add-income.dart';
import 'package:frontend/controller/income_controller.dart';
import 'package:frontend/widget/income/list-detailed-income.dart';

class ListIncomeScreen extends StatefulWidget {
  const ListIncomeScreen({Key? key}) : super(key: key);

  @override
  State<ListIncomeScreen> createState() => _ListIncomeScreenState();
}

class _ListIncomeScreenState extends State<ListIncomeScreen> {
  final List<Income> _incomes = <Income>[];
  List<Income> _incomesDisplay = <Income>[];

  @override
  void initState() {
    super.initState();
    fetchIncomes().then((value) => {
          setState(() {
            _incomes.addAll(value);
            _incomesDisplay = _incomes;
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
          "Controle de Rendas",
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
            MaterialPageRoute(builder: (context) => AddIncomeScreen()),
          );
        },
      ),
      body: ListView.builder(
        itemCount: _incomesDisplay.length,
        itemBuilder: (context, index) {

          final income = _incomesDisplay[index];
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
                      ListDetailedIncomeScreen(income: income),
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
                          income.name,
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
                            income.description ?? '',
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
                    "R\$: ${income.amount}",
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
