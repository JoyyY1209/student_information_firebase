import 'package:firebase_database/firebase_database.dart';
import 'package:student_information_firebase/model/Student.dart';

class StudentService{

  //connect to firebase database
  final DatabaseReference dbReference = FirebaseDatabase.instance.ref('students');

  //getting all student data from firebase database
  Stream<List<Student>> getStudents(){
    return dbReference.onValue.map((event){
      final data = event.snapshot.value as Map<dynamic,dynamic>? ?? {};
      return data.entries.map((entry)=>Student.fromJson(Map<String,dynamic>.from(entry.value))).toList();
    });
  }

  //if student exist in database
  Future<bool> doesStudentExist(String id)async{
    final snapshot = await dbReference.child(id).get();
    return snapshot.exists;
  }

  //for adding new student to database
  Future addStudent(Student student)async{
    //final newStudentRef = dbReference.push();
    //student.id=newStudentRef.key;   // getting default primary key from firebase database
    //await newStudentRef.set(student.toJson());
    if(await doesStudentExist(student.id!))
      {
        print("Error: A student with this ID already exists!");
        return;
      }

    await dbReference.child(student.id!).set(student.toJson());
  }


  //update student
  Future updateStudent(Student student)async{
    if(student.id != null)
      {
        await dbReference.child(student.id!).set(student.toJson());
      }
  }

  //delete student
  Future deleteStudent(String id)async{
    await dbReference.child(id).remove();
  }
}