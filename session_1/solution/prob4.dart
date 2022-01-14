import 'dart:io';
import 'dart:collection';
library courses;

String? courseName;
String? courseCode;
HashMap openElec = new HashMap<String, List>();
HashMap branchElec = new HashMap<String, List>();

void compute() {
  // int user;
  print("Enter the type of user 1.Admin 2.Student");
  int? user = int.parse(stdin.readLineSync()!);
  if (user == 1) {
    //Admin
    print("Enter the course type 1.Open elective 2.Branch elective");
    int? courseType = int.parse(stdin.readLineSync()!);
    print("Enter the year and branch");
    String? year = stdin.readLineSync();
    String? branch = stdin.readLineSync();
    String? yearBranch = year+branch;
    print("Enter the course name and code");
    courseName = stdin.readLineSync();
    courseCode = stdin.readLineSync();
    // int courseType;
    if (courseType == 1) {
      openElec[yearBranch].add(courseName);
    }
    if (courseType == 2) {
      branchElec[yearBranch].add(courseName);
    } else {
      print("Wrong entry");
    }
  }
  if (user == 2) {//Student
    print("Enter the year and branch");
    String? year = stdin.readLineSync();
    String? branch = stdin.readLineSync();
    String? yearBranch = year+branch;
    print(openElec(yearBranch));
    print(branchElec(yearBranch));
  } 
  else {
    print("Wrong entry");
  }
}

class BranchElective {
  var branch;
  var year;
}

class OpenElective {}

