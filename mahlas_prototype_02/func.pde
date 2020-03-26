void addOpenTask() {
}

void createTaskList(){
taskList.add(new Task(10,"Find a name for the artist"));
taskList.add(new Task(20,"IDEA : Find an idea for the artwork"));
taskList.add(new Task(30,"Ask for approval from the curaters"));
taskList.add(new Task(40,"If curators did not approve GOTO 20"));
taskList.add(new Task(50,"Produce the artwork"));
taskList.add(new Task(60,"Find a name for the artwork "));
taskList.add(new Task(70,"Write description for the artwork"));
taskList.add(new Task(80,"Documentate the artwork"));
taskList.add(new Task(90,"Send the documentation to curators"));
taskList.add(new Task(100,"Send the artwork to a suitable location for the curators"));
}

void task_tag() {
  
}

void task_setConsensus() {
}

boolean task_executeConsensus() {
  return true;
}

Creator getRandomCreator() {
  //This function should return creators based on desired tags and dream rules.
  return creators.get(int(random(creators.size())));
}

Creator findCreatorByID(int id) {
  Creator c = creators.get(0);

  for (int i=0; i<creators.size(); i++)
    if (creators.get(i).id==id)
      c = creators.get(i);

  return c;
}
