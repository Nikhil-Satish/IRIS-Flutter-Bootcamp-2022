import 'dart:io';
import 'dart:collection';
library courses;

String? courseName;
String? courseCode;
// String? name = stdin.readLineSync();
// int? n = int.parse(stdin.readLineSync()!);
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
    // print(branchElec(yearBranch));
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

void main() {
  fibonacci(6);
  semiprime(51);
  List<int> arr = [1, 2, 3, 4, 3];
  print(sumArray(arr));
}

void fibonacci(int n) {
  int first = 0;
  int second = 1;
  if (n == 0) {
    return;
  }
  if (n == 1) {
    print(first);
    return;
  }
  print(first);
  print(second);
  if (n == 2) {
    return;
  }
  for (int i = 2; i < n; i++) {
    int num = first + second;
    print(num);
    first = second;
    second = num;
  }
}

void semiprime(int n) {
  int divisor = 1;
  var dividend = 1;
  for (int i = 2; i < n; i++) {
    if (n % i == 0) {
      divisor = i;
      double spare = n / divisor;
      dividend = spare.toInt();
      // dividend = dividend.floor();
      if (checkPrime(dividend) && checkPrime(divisor)) {
        print(
            "The number is semi-prime. It is a product of ${divisor} and ${dividend} ");
        return;
      }
    }
  }
  print("The number is not semiprime");
}

bool checkPrime(int n) {
  if (n == 1) return false;
  for (int i = 2; i <= n - 1; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

bool sumArray(List<int> arr) {
  int sum = 0;
  for (var i in arr) {
    sum += i;
  }
  // print(sum);
  return checkPrime(sum);
}
