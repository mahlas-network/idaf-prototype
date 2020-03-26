void addOpenTask() {
}

void transferMoneyToSystem(int id, int value) {
  if (printTransactions) {
    println("");
    println("New Transaction of "+value+" from "+findCreatorByID(id).name+" to System");
    println("Balances before transaction : "+findCreatorByID(id).name+" : "+findCreatorByID(id).balance+" ---- "+"System :"+systemBalance);
  }
  findCreatorByID(id).balance -= value;
  systemBalance += value;
  if (printTransactions) {
    println("Balances after transaction : "+findCreatorByID(id).name+" : "+findCreatorByID(id).balance+" ---- "+"System :"+systemBalance);
  }
}

void transferMoneyToCreator() {
}

void task_tag() {
}


void task_estimateCost() {
}

void task_estimateTime() {
}

void task_findConsensus() {
}

Creator getRandomCreator() {
  //This function should return Creators based on desired tags and dream rules.
  return Creators.get(int(random(Creators.size())));
}

Creator findCreatorByID(int id) {
  Creator c = Creators.get(0);

  for (int i=0; i<Creators.size(); i++)
    if (Creators.get(i).id==id)
      c = Creators.get(i);

  return c;
}
