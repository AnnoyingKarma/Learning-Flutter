import 'dart:convert';

import 'package:expense_tracker/models/expense_class.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final expenseController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  DateTime? selectedDate = DateTime.now();
  List<ExpenseClass> expenseList =[];


  Future<void> _saveExpenses() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> packedList = expenseList.map((item) => item.toMap()).toList();
    String jsonText = jsonEncode(packedList);
    await prefs.setString('saved_expenses', jsonText);
  }

  Future<void> _loadExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonText = prefs.getString('saved_expenses');
    if (jsonText != null) {
      List<dynamic> unpackedList = jsonDecode(jsonText);
      List<ExpenseClass> loadedExpenses = unpackedList.map((json) => ExpenseClass.fromMap(json)).toList();
      setState(() {
        expenseList = loadedExpenses;
      });
    }
  }

    
  @override
  void initState() {
    // TODO: implement initState
    dateController.text = "${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}";
    super.initState();
    _loadExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense Tracking",style: TextStyle(color: Color(0xff000000),fontSize: 30),),backgroundColor: Color(0xff91AE6E),),
      body: Container(
        color: Color(0xff689D4B),
        child: ListView.builder(
          itemCount: expenseList.length,
          itemBuilder: (BuildContext context, int index){
          return Card(
            color: Color(0xffF2F2F2),
            child: Column(
              children: [
                Text(expenseList[index].expenseName,style: TextStyle(fontSize: 20),),
                Text(expenseList[index].expenseAmount,style: TextStyle(fontSize: 16,color: Color(0xffD96868)),),
                Text(expenseList[index].expenseDate),
              ],
            )
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height / 2,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Name of Expense',
                          ),
                          controller: expenseController,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Add your Amount',
                          ),
                          controller: amountController,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          readOnly: true,
                          onTap: () async {
                            selectedDate = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(3000));
                            setState(() {
                              if(selectedDate != null){
                                dateController.text = "${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}";
                              }
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(), 
                          ),
                          controller: dateController,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(foregroundColor : WidgetStatePropertyAll(Color(0xffD96868))),
                      onPressed: () {
                        setState(() {
                          expenseList.add(ExpenseClass(expenseName: expenseController.text, expenseAmount: amountController.text, expenseDate: dateController.text));
                          expenseController.text = "";
                          amountController.text = "";
                          _saveExpenses();
                        });
                      },
                      child: Icon(Icons.add_task,size: 30,),
                    ),
                  ],
                ),
              );
            },
            
          );
        },
        foregroundColor: Color(0xffD96868),
        backgroundColor: Color(0xffF2F2F2),
        child: const Icon(Icons.attach_money_rounded),
      ),
    );
  }
}