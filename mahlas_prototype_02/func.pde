void addOpenTask() {
}



Task task_tag(Task t) {
  Task target = new Task(t);
  return target;
}

Task task_writeDesc(Task source) {
  Task target = new Task(1, "", 0);
  return target;
}


Task task_setConsensus(Task source) {
  Task target = new Task(1, "", 0);
  return target;
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