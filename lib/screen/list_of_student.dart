import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:student_information_firebase/screen/update_student.dart';
import 'package:student_information_firebase/service/student_service.dart';
//mport '../model/student.dart';
import 'package:student_information_firebase/model/Student.dart';
import 'package:url_launcher/url_launcher.dart';
import 'interface_page.dart';
class ListOfStudents extends StatefulWidget {
  const ListOfStudents({super.key});

  @override
  State<ListOfStudents> createState() => _ListOfStudentsState();
}

class _ListOfStudentsState extends State<ListOfStudents> {

  //used for sqf lite database//late DatabaseHelper dbHelper;

  //List<Student> students=[];
  //@override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //dbHelper=DatabaseHelper.instance;
  //
  //   loadAllData();
  // }

  // Future loadAllData()async{
  //  // var data = await dbHelper.getAllData();
  //   setState(() {
  //     //students = data.map((element)=>Student.fromMap(element)).toList();
  //   });
  // }

  // Future deleteData(String id)async{
  //   int result = await dbHelper.deleteData(id);
  //   if(result!=0)
  //   {
  //     Fluttertoast.showToast(msg: "Student Information deleted successfully");
  //     loadAllData();
  //   }
  //   else
  //     Fluttertoast.showToast(msg: "Failed to delete Student Information");
  // }

  //reference of student service dbhelper
  final StudentService studentService = StudentService();

  Future<void> makePhoneCall(String phoneNumber)async{
    Uri uri = Uri(scheme: 'tel',path: phoneNumber);
    if(await canLaunchUrl(uri))
    {
      await launchUrl(uri);
    }
    else
      throw 'Could not launch $phoneNumber';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(child: Text("Student List",style: TextStyle(color: Colors.white),)),
        leading: IconButton(
            onPressed: (){
              Get.offAll(InterfacePage());
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: StreamBuilder<List<Student>>(
        stream: studentService.getStudents(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasError)
            {
              return Center(child: Text("Eror, ${snapshot.error}"),);
            }
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }

          // firebase data store in student throught snapshot.data
          final students = snapshot.data!;

        return ListView.builder(
          //students.isEmpty
          //           ? Center(child: Text("No Student List Availabe"))
          //           :
            itemCount: students.length,
            itemBuilder: (context,index){
              //note intialize
              //Student student = students[index];
              final student = students[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black54,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateStudent(student: student,)));
                    //goto update page
                  },
                  title: Text(student.nickName!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  subtitle: Text(student.id!),
                  leading: Icon(Icons.account_circle_outlined,size: 40,),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){
                        makePhoneCall(student.phnNumber);
                        print(!student.phnNumber);
                      },
                          icon: Icon(Icons.call,size: 40,)),
                      IconButton(
                          onPressed: (){
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.question,
                              headerAnimationLoop: false,
                              animType: AnimType.bottomSlide,
                              title: 'Delete',
                              desc: 'Want To Delete this Student Information',
                              buttonsTextStyle: TextStyle(color: Colors.red[300]),
                              btnOkText: 'YES',
                              btnOkOnPress: (){
                                //for sflite database
                                // deleteData(student.id!);
                                //Get.back();

                                studentService.deleteStudent(student.id!);
                              },
                              btnCancelText: 'NO',
                              btnCancelOnPress: (){},



                            ).show();
                          },
                          icon: Icon(Icons.delete,size: 40,)),
                    ],
                  ),
                ),
              );
            });},
      ),
    );
  }
}