import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(ListFinanceScreen());
}

class ListFinanceScreen extends StatefulWidget {
  @override
  _ListFinanceScreenState createState() => _ListFinanceScreenState();
}

class _ListFinanceScreenState extends State<ListFinanceScreen> {
  String selectedChart = 'Despesas por Categoria';
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Histórico Financeiro',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              color: Color(0xffffffff),
            ),
          ),
          centerTitle: true,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),

                SizedBox(height: 16),
                buildDateButtons(),
                SizedBox(height: 16),
                if (selectedChart == 'Despesas por Categoria' ||
                    selectedChart == 'Todos os Gráficos')
                  buildChartCard(
                    title: 'Despesas por Categoria',
                    description: 'Visualize suas despesas por categoria.',
                    chart: buildExpensesByCategoryChart(),
                  ),
                if (selectedChart == 'Receitas e Despesas Mensais' ||
                    selectedChart == 'Todos os Gráficos')
                  buildChartCard(
                    title: 'Receitas e Despesas Mensais',
                    description: 'Acompanhe suas receitas e despesas ao longo do tempo.',
                    chart: buildMonthlyIncomeExpensesChart(),
                  ),
                if (selectedChart == 'Período de Gastos' ||
                    selectedChart == 'Todos os Gráficos')
                  buildChartCard(
                    title: 'Período de Gastos',
                    description: 'Analise seus gastos em um determinado período.',
                    chart: buildSpendingPeriodChart(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChartCard({required String title, required String description, required Widget chart}) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            chart,
          ],
        ),
      ),
    );
  }

  Widget buildExpensesByCategoryChart() {
    return Container(
      height: 300,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: [
            PieChartSectionData(
              color: Colors.red,
              value: 30,
              title: '30%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff),
              ),
            ),
            PieChartSectionData(
              color: Colors.yellow,
              value: 20,
              title: '20%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff),
              ),
            ),
            PieChartSectionData(
              color: Colors.green,
              value: 50,
              title: '50%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMonthlyIncomeExpensesChart() {
    return Container(
      height: 300,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          groupsSpace: 20,
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return '1';
                  case 1:
                    return '2';
                  case 2:
                    return '3';
                  case 3:
                    return '4';
                  default:
                    return '';
                }
              },
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: const Color(0xff37434d),
              width: 1,
            ),
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barsSpace: 12,
              barRods: [
                BarChartRodData(
                  y: 500,
                  colors: [Colors.blue],
                  width: 16,
                  borderRadius: BorderRadius.circular(8),
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barsSpace: 12,
              barRods: [
                BarChartRodData(
                  y: 600,
                  colors: [Colors.blue],
                  width: 16,
                  borderRadius: BorderRadius.circular(8),
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barsSpace: 12,
              barRods: [
                BarChartRodData(
                  y: 800,
                  colors: [Colors.blue],
                  width: 16,
                  borderRadius: BorderRadius.circular(8),
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barsSpace: 12,
              barRods: [
                BarChartRodData(
                  y: 700,
                  colors: [Colors.blue],
                  width: 16,
                  borderRadius: BorderRadius.circular(8),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpendingPeriodChart() {
    return Container(
      height: 300,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return '1';
                  case 1:
                    return '2';
                  case 2:
                    return '3';
                  case 3:
                    return '4';
                  default:
                    return '';
                }
              },
            ),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: const Color(0xff37434d),
              width: 1,
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 400),
                FlSpot(1, 200),
                FlSpot(2, 600),
                FlSpot(3, 300),
              ],
              isCurved: true,
              colors: [Colors.red],
              dotData: FlDotData(
                show: true,
              ),
              belowBarData: BarAreaData(
                show: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDateButtons() {
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedChart,
          onChanged: (String? newValue) {
            setState(() {
              selectedChart = newValue!;
            });
          },
          items: <String>[
            'Despesas por Categoria',
            'Receitas e Despesas Mensais',
            'Período de Gastos',
            'Todos os Gráficos',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                _selectDate(context, true); // true indica que é a data de início
              },
              child: Text('Data de Início'),
            ),
            ElevatedButton(
              onPressed: () {
                _selectDate(context, false); // false indica que é a data final
              },
              child: Text('Data Final'),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              startDate != null ? 'Data de Início: ${_formatDate(startDate!)}' : '',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              endDate != null ? 'Data Final: ${_formatDate(endDate!)}' : '',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        if (isStartDate) {
          startDate = selectedDate;
        } else {
          endDate = selectedDate;
        }
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
