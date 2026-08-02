import 'package:flutter/material.dart';
import 'package:todo_list/pages/todo_list.dart';

class ListUi extends StatefulWidget {
  const ListUi({super.key});

  @override
  State<ListUi> createState() => _ListUiState();
}

class _ListUiState extends State<ListUi> {
  final myController = TextEditingController();

  List<TodoList> theList =[];

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo",style: TextStyle(
          color: Color(0xff000000),
        ),),
        backgroundColor: Color(0xffe0c088),
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight(300),
        ),
      ),
      body: Scaffold(
        backgroundColor: Color(0xffd9b370),
        body: ListView.builder(
          itemCount: theList.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: Checkbox(value: theList[index].doneList, onChanged: (bool? value){
                setState(() {
                  theList[index].doneList = value!;
                });
              }),
              title:Text(theList[index].itemList),
              trailing: IconButton(onPressed: (){
                setState(() {
                  theList.removeAt(index);
                });
              }, icon: Icon(Icons.delete_rounded)),
            );
          } 
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text("Add Your Task"),
                content: TextField( 
                  controller: myController,
                  decoration: InputDecoration(
                    border: ShapedInputBorder(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20))),
                    hintText: "Your Task",
                    fillColor: Color(0xffd9b370),
                    filled: true,
                  ),
                ),
                backgroundColor: Color(0xffe0c088),
                actions: [
                  Center(child: ElevatedButton(onPressed: (){
                    String typedTask = myController.text;
                    setState(() {
                      theList.add(TodoList(itemList: typedTask));
                      myController.clear();
                    });
                  }, 
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color(0xff2a9c85)),
                    foregroundColor: WidgetStatePropertyAll(Colors.black)
                  ),
                  child: Text("ADD"),
                  ))
                ],
              );
            });
          },
          backgroundColor: Color(0xff2a9c85),
          child: const Icon(Icons.add,color: Color(0xfff2ebca))
          ),
      ),
    );
  }

}