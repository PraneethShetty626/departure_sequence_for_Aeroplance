import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override

  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}



class MyCustomFormState extends State<MyCustomForm> {

      FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref("/newdata");
  

  final _formKey = GlobalKey<FormState>();

    String? callsign;
    String? eobt;
    String? priority;
    String? runway;
    int? stand;
    int? timetoreachrunway;
  @override

  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
  
    

    return Scaffold(
      body: SingleChildScrollView(

        child: Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 19.0),
                  child: Column(
                    children: [
                   const   Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 19.0),
                        child:Icon(Icons.flight),
                      ),
                     const Text('Add new Flight'),
                      cont(
                        TextFormField(
                          decoration:const InputDecoration(
                              hintText: "Flight Name"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                          },
                          onSaved: (val){
                            callsign=val;
                          },
                        ),
                      ),
                      cont(
                         TextFormField(
                          keyboardType: TextInputType.number,
                          decoration:const InputDecoration(
                              hintText: "Stand"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                          },
                          onSaved: (val){
                            stand=int.parse(val!);
                          },
                        ),
                      ),
                      cont(
                         TextFormField(
                          decoration:const InputDecoration(
                              hintText: "EOBT"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            } 
                          },
                          onSaved: (val){
                            eobt=val;
                          },
                        ),
                      ),
                      cont(
                         TextFormField(
                          keyboardType: TextInputType.number,
                          decoration:const InputDecoration(
                              hintText: "RunWay"),
                          maxLines: 4,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                          },
                          onSaved: (val){
                            runway=val;
                          },
                        ),
                      ),
                      cont(
                         TextFormField(
                         
                          decoration:const InputDecoration(
                              hintText: "Priority"),
                          maxLines: 4,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                          },
                          onSaved: (val){
                            priority=val;
                          },
                        ),
                      ),
                      cont(
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration:const InputDecoration(
                              hintText: "Time to reach Runway"),
                          maxLines: 4,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                          },
                          onSaved: (val){
                            timetoreachrunway=int.parse(val!);
                          },
  
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                           
                            if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                ref.set(
                                  {
                                    "newData":{
                                      "callsign":callsign,
                                      "eobt":eobt,
                                      "priority":priority,
                                      "runway":runway,
                                      "stand":stand,
                                      "time to reach Runway":timetoreachrunway
                                    }
                                  }
                                // ignore: avoid_print
                                ).then((value) => print("Done")).onError((error, stackTrace) => print(error));
                                Navigator.of(context).pop();

                            } 
                          },
                          child:const Text('Add'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container cont(Widget widget){
  return Container(
    alignment: Alignment.center,
    width: 300,
    height: 50,
    margin:const EdgeInsets.all(8),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
	    color:Color.fromARGB(235, 121, 209, 53),
	  
	    borderRadius: BorderRadius.circular(10),
	),
 
	child :widget,
);
}
  

bool isNumeric(String s) {
  try {
    return double.parse(s) != null;
  } catch (e) {
    return false;
  }
}
}