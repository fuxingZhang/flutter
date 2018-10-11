class Person { 
  String name; 
   
  Person(this.name); 
  String greet(who) => 'I am $name!'; 
} 

class Student extends Person {   
  Student(String name):super(name); 
  String greet(who) => 'Student: hi $who! \n I am $name!'; 
} 

class Teacher extends Person { 
  Teacher(String name):super(name); 
  String greet(who) => 'Teacher: hi $who! \n I am $name!'; 
} 

void main() { 
   Person p1 = new Student('Wang'); 
   Person p2 = new Teacher('Lee'); 
    
   print(p1.greet('Chen')); 
   print(p2.greet('Chen')); 
}