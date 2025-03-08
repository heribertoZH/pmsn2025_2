import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmsn2025_2/database/task_database.dart';
import 'package:pmsn2025_2/utils/global_values.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TaskDatabase? database;
  TextEditingController conTitle = TextEditingController();
  TextEditingController conDescription = TextEditingController();
  TextEditingController conDates = TextEditingController();
  TextEditingController conStatus = TextEditingController();

  @override
  void initState() {
    super.initState();
    database = TaskDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialogBuilder(context);
        },
        child: Icon(Icons.add_task),
      ),
      body: ValueListenableBuilder(
          valueListenable: GlobalValues.udpList,
          builder: (context, value, widget) {
            return FutureBuilder(
                future: database!.SELECT(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    return ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        padding: EdgeInsets.all(10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var obj = snapshot.data![index];
                          return Container(
                            decoration: BoxDecoration(color: Colors.grey),
                            height: 150,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    obj.titleTodo!,
                                  ),
                                  subtitle: Text(obj.dateTodo!),
                                  trailing: Builder(builder: (context) {
                                    if (obj.sttTodo!) {
                                      return Icon(Icons.close);
                                    } else {
                                      return Icon(Icons.check);
                                    }
                                  }),
                                ),
                                Text(obj.dscTodo!),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          conTitle.text = obj.titleTodo!;
                                          conDescription.text = obj.dscTodo!;
                                          conDates.text = obj.dateTodo!;
                                          conStatus.text = obj.sttTodo!.toString();
                                          _dialogBuilder(context, obj.idTodo!);
                                        },
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          database!
                                              .DELETE('todo', obj.idTodo!)
                                              .then((value) {
                                            if (value > 0) {
                                              GlobalValues.udpList.value =!GlobalValues.udpList.value;
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.delete)),
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                });
          }),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, [int idTodo = 0]) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: (idTodo == 0 )? Text('Add Task'): Text('Edit Task'),
            content: SizedBox(
              height: 350,
              width: 280,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Titulo de la tarea'),
                    controller: conTitle,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: 'Descripcion de la tarea'),
                    controller: conDescription,
                    maxLines: 3,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: conDates,
                    decoration: InputDecoration(
                      hintText: "Fecha de la tarea",
                    ),
                    onTap: () async {
                      DateTime? dateTodo = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));

                      if (dateTodo != null) {
                        String formatDate =
                            DateFormat('yyyy-MM-dd').format(dateTodo);
                        setState(() {
                          conDates.text = formatDate;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Status de la tarea'),
                    controller: conStatus,
                  ),
                  Divider(),
                  ElevatedButton(
                      onPressed: () {
                        if (idTodo == 0){
                        database!.INSERT('todo', {
                          "titleTodo": conTitle.text,
                          "dscTodo": conDescription.text,
                          "dateTodo": conDates.text,
                          "sttTodo": false
                        }).then(
                          (value) {
                            if (value > 0) {
                              GlobalValues.udpList.value =
                                  !GlobalValues.udpList.value;
                              ArtSweetAlert.show(
                                  context: context,
                                  artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.success,
                                      title: 'Mensaje desde la app',
                                      text: 'Datos Insertados correctamente'));
                            }
                          },
                        );} else {
                        database!.UPDATE('todo', {
                          "idTodo": idTodo,
                          "titleTodo": conTitle.text,
                          "dscTodo": conDescription.text,
                          "dateTodo": conDates.text,
                          "sttTodo": false
                        }).then(
                          (value) {
                            if (value > 0) {
                              GlobalValues.udpList.value =
                                  !GlobalValues.udpList.value;
                              ArtSweetAlert.show(
                                  context: context,
                                  artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.success,
                                      title: 'Mensaje desde la app',
                                      text: 'Datos Actualizados correctamente'));
                            }
                          },
                        );}
                        conTitle.text = '';
                        conStatus.text = '';
                        conDescription.text = '';
                        conDates.text = '';
                        Navigator.pop(context);
                      },
                      child: Text('Guardar'),),
                ],
              ),
            ),
          );
        },);
  }
}
