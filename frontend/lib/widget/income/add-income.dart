import 'package:flutter/material.dart';
import 'package:frontend/controller/income_controller.dart';

import 'list-income.dart';
import 'list-detailed-income.dart';
import '../../models/income.dart';

class AddIncomeScreen extends StatefulWidget {
  final Income? income;
  const AddIncomeScreen({Key? key, this.income}) : super(key: key);
  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  double paddingBottom = 20;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController periodicityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.income == null) {
      nameController.text = "";
      amountController.text = "";
      descriptionController.text = "";
      periodicityController.text = "";
    } else {
      nameController.text = widget.income?.name ?? "";
      descriptionController.text = widget.income?.description ?? "";
      amountController.text = widget.income?.amount.toString() ?? "";
      periodicityController.text =
          widget.income?.periodicityNumber.toString() ?? "";
      selectedDate = DateTime.parse(widget.income?.date ?? "");
    }

    // Check if selectedDate is null, and set it to the current date
    selectedDate ??= DateTime.now();

    int daysUntilNow =
        DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;

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
          widget.income == null ? "Adicionar Renda" : "Alterar Renda",
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "Nome",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, paddingBottom),
                child: TextField(
                  controller: nameController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0x00000000), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0x00000000), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0x00000000), width: 1),
                    ),
                    hintText: "e.g. Netflix",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    filled: true,
                    fillColor: Color(0xfff2f2f4),
                    isDense: false,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  "Descrição",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, paddingBottom),
                child: TextField(
                  controller: descriptionController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0x00000000), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0x00000000), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0x00000000), width: 1),
                    ),
                    hintText: "e.g. Plano Prêmio",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    filled: true,
                    fillColor: Color(0xfff2f2f4),
                    isDense: false,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  "Data de Renda",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: selectedDate!,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (date != null) {
                        setState(() {
                          selectedDate = date;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4193F3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _formatDate(selectedDate!),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  "Valor da Renda",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                child: TextField(
                  controller: amountController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0x00000000), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0x00000000), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Color(0x00000000), width: 1),
                    ),
                    hintText: "e.g. R\$: 0.00",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    filled: true,
                    fillColor: Color(0xfff2f2f4),
                    isDense: false,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  "Número de periodicidade",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: periodicityController,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                            BorderSide(color: Color(0x00000000), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                            BorderSide(color: Color(0x00000000), width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                            BorderSide(color: Color(0x00000000), width: 1),
                          ),
                          //hintText: "e.g. 346",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          filled: true,
                          fillColor: Color(0xfff2f2f4),
                          isDense: false,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Dias até hoje: $daysUntilNow",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, paddingBottom, 0, 0),
                child: MaterialButton(
                  onPressed: () async {
                    String name = nameController.text;
                    String description = descriptionController.text;
                    double amount = double.parse(amountController.text);
                    int periodicityNumber =
                    int.parse(periodicityController.text);

                    Income objIncome = Income(
                      name,
                      _formatDate(selectedDate!),
                      amount,
                      description,
                      periodicityNumber,
                    );

                    try {
                      // Create new income
                      if (widget.income == null) {
                        await createIncome(objIncome);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListIncomeScreen()),
                        );
                      }
                      // Update income
                      else {
                        int incomeId = widget.income?.id ?? 0;
                        await editIncome(incomeId, objIncome);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ListDetailedIncomeScreen(income: objIncome)),
                        );
                      }
                    } catch (e) {
                      print('Erro durante o Income: $e');
                    }
                  },
                  color: Color(0xFF4193F3),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    widget.income == null ? "Salvar" : "Alterar",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color(0xffffffff),
                  height: 45,
                  minWidth: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
