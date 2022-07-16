class Task{
  late final String name ;
  late bool isDone;
  Task({required this.name,  this.isDone = false});

  // toggles the doneness of the class
  void toggleDone (){
    isDone =!isDone;
  }
}