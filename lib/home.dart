import 'dart:convert';
import 'package:crimdetect/addData.dart';
import 'package:crimdetect/data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref("/").child("ML Data");

    
  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        
        appBar: AppBar(
          title:const Text("FlightInTime"),
          backgroundColor: Color.fromARGB(255, 235, 177, 78),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return MyCustomForm();
              }));
            }, child: Text("ADD new CheckIn"),style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 255, 179, 0)),)
          ],
          ),
        body: Stack(

          children: [
            Opacity(opacity: 0.98,child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.network("https://images.unsplash.com/photo-1542296332-2e4473faf563?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3lkbmV5JTIwYWlycG9ydHxlbnwwfHwwfHw%3D&w=1000&q=80",fit: BoxFit.cover,)),),
            StreamBuilder(stream: ref.onValue,builder: (context,AsyncSnapshot<DatabaseEvent?> snapshot){
            if(snapshot.connectionState==ConnectionState.active && snapshot.hasData){
              var data=snapshot.data!.snapshot.value;
              if ((data != null)) {


                // Map<Object?, Object?>? val =
                //   snapshot.data!.snapshot.value as Map<Object?, Object?>;
                // print(val);
                // List<Data> datalist=retData(val);
                // return ListView.builder(itemBuilder: ((context, index) {
                //   Data d=datalist[index];
              

                ///////
                ///
                List<Data> datalist=[];
                
                
                
                try{
                 List<dynamic> val =
                                  snapshot.data!.snapshot.value as List<dynamic>;
                                // print(val);
                  datalist=retData(val);
                  
                  }
                  catch (e){
                    print(e);
                  }
                return ListView.builder(itemBuilder: ((context, index) {
                  Data d=datalist[index];
                ///
                ///
                ///////
        
        
        
                  
        return ListTile(
          title : Column(
        
            children: [
              Container(
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 50,
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  
                  width: 50,
                  height: 50,
                  child: Text((index+1).toString()),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(
                          width: 5,
                          color: Color.fromARGB(235, 121, 209, 53),
                          style: BorderStyle.solid
                      )
                  ),
                ),
              ),
              
              Container(
                
                width: MediaQuery.of(context).size.width-90,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    cont2(Text("TSAT : ${d.tsat}")),
        
                    cont2(Text("Runway : ${d.runway}")),
        
                  ],
                ),
              )
            ],
          )
              ),
              Container(
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width : 50,
                  alignment: Alignment.center,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Color.fromARGB(255, 206, 240, 121),
                          width: 10,
                          height : 200 
                        ),
                      ],
                    ),
                  ),
                ),
               
                Expanded(
                  child: Container(
                    margin:const EdgeInsets.symmetric(vertical :10),
                    padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                           
                             cont(Text("Call Sign : ${d.callsign}")),
                            cont(Text("Priority : ${d.priority}")),
                            cont(Text("EOBT : ${d.eobt}")),
                            cont(Text("Time : ${d.time}")),
                            cont(Text("Stand : ${d.stand}")),
                            
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
              )
            ],
          ),
        );
               
                }),itemCount: datalist.length,);
              
            }
             else{
            return const Center(child: CircularProgressIndicator(),);
          }
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
            
          }
          }
          
          ),
          ]
        ),
      );
  }


  // List<Data> retData(Map<Object?, Object?>? data,){
  //   List<Data> newData=[];
  //     data!.forEach((key, value) { 
  //           List<dynamic>? val = 
  //               value as List<dynamic>;
  //           for (var element in val) { 
  

  //             newData.add(
  //                Data(element["callsign"].toString(), element["eobt"].toString(), element["priority"].toString(), int.parse(element["runway"]), element["stand"], element["time to reach Runway"], element["tsat"].toString())
  //             );
              
  //           }


  //     });
  //     // newData.sort(((a, b) =>a.tsat.compareTo(b.tsat)));
  //   return newData;
  // }



  ////
  ///
  ///
    List<Data> retData(List<dynamic> data,){
    List<Data> newData=[];
    data.forEach((element) { 
            newData.add(
                 Data(element["callsign"].toString(), element["eobt"].toString(), element["priority"].toString(), (element["runway"]).toString(), element["stand"].toString(), element["time to reach Runway"].toString(), element["tsat"].toString())
              );
    });
      
      newData.sort(((a, b) =>a.tsat.compareTo(b.tsat)));
    return newData;
  }

Container cont(Widget widget){
  return Container(
    alignment: Alignment.center,
    width: 250,
    height: 50,
    margin:const EdgeInsets.all(8),
    decoration: BoxDecoration(
	    color:Color.fromARGB(255, 206, 240, 121),
	  
	    borderRadius: BorderRadius.circular(10),
	),
 
	child :widget,
);
}

Container cont2(Widget widget){
  return Container(
    alignment: Alignment.center,
    width: 250,
    height: 50,
    margin:const EdgeInsets.all(8),
    decoration: BoxDecoration(
	    color:Color.fromARGB(235, 121, 209, 53),
	  
	    borderRadius: BorderRadius.circular(10),
	),
 
	child :widget,
);
}

}