import 'package:flutter/material.dart';
import 'expense/list-expense.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffff5630),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "UndesPants Group",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
        leading: Icon(
          Icons.list,
          color: Color(0xffffffff),
          size: 24,
        ),
        actions: [
          Icon(Icons.dashboard, color: Color(0xffffffff), size: 24),
        ],
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  height: 170,
                  decoration: BoxDecoration(
                    color: Color(0x00ffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ListExpenseScreen())
                      );
                    },
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                          padding: EdgeInsets.all(12),
                          width: 150,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Color(0x00ffffff),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12.0),
                            border:
                            Border.all(color: Color(0x4d9e9e9e), width: 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                              ),
                              ImageIcon(
                                NetworkImage(
                                    "https://cdn4.iconfinder.com/data/icons/xicons/25/xicons_about_book-128.png"),
                                size: 80,
                                color: Color(0xffd46d24),
                              ),
                              Text(
                                "Controle de Despesas",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                          padding: EdgeInsets.all(12),
                          width: 150,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Color(0x00ffffff),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12.0),
                            border:
                            Border.all(color: Color(0x4d9e9e9e), width: 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 16,
                                    width: 16,
                                  ),
                                ],
                              ),
                              ImageIcon(
                                NetworkImage(
                                    "https://cdn4.iconfinder.com/data/icons/xicons/25/xicons_about_book-128.png"),
                                size: 80,
                                color: Color(0xff3a57e8),
                              ),
                              Text(
                                "Controle de Renda",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                          padding: EdgeInsets.all(12),
                          width: 150,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Color(0x00ffffff),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12.0),
                            border:
                            Border.all(color: Color(0x4d9e9e9e), width: 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 16,
                                    width: 16,
                                  ),
                                ],
                              ),
                              ImageIcon(
                                NetworkImage(
                                    "https://cdn4.iconfinder.com/data/icons/xicons/25/xicons_about_book-128.png"),
                                size: 80,
                                color: Color(0xffe4c00d),
                              ),
                              Text(
                                "Metas e Ganhos",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                          padding: EdgeInsets.all(12),
                          width: 150,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Color(0x00ffffff),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12.0),
                            border:
                            Border.all(color: Color(0x4d9e9e9e), width: 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                              ),
                              ImageIcon(
                                NetworkImage(
                                    "https://cdn4.iconfinder.com/data/icons/xicons/25/xicons_about_book-128.png"),
                                size: 80,
                                color: Color(0xffd46d24),
                              ),
                              Text(
                                "Histórico Financeiro",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                GridView(
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
