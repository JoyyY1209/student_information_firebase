import 'package:flutter/material.dart';


import 'add_student.dart';
import 'list_of_student.dart';

class InterfacePage extends StatelessWidget {
  const InterfacePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(child: Text("Student Information",style: TextStyle(color: Colors.white),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ListOfStudents()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.list_outlined,size: 50,color: Colors.white,),
                        Text("View All Students",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudent()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_outlined,size: 50,color: Colors.white,),
                        Text("Add Student",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //SizedBox(height: 15,),


          ],
        ),
      ),
    );
  }
}