class ExpenseClass {
  final String expenseName;
  final String expenseAmount;
  final String expenseDate;

  ExpenseClass({
    required this.expenseName,
    required this.expenseAmount,
    required this.expenseDate
  });

  Map<String, dynamic> toMap(){
    return{
      'expenseName': expenseName,
      'expenseAmount': expenseAmount,
      'expenseDate': expenseDate,
    };
  }
  
  factory ExpenseClass.fromMap(Map<String, dynamic> map){
    return ExpenseClass(
      expenseName: map['expenseName'],
      expenseAmount: map['expenseAmount'],
      expenseDate: map['expenseDate'],
    );
  }
}