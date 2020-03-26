// https://github.com/mahlas-network/docs/blob/master/parts/idaf/prototype.md

import javax.activation.MimetypesFileTypeMap;

ArrayList<Creator> creators = new ArrayList<Creator>();
ArrayList<Tag> tagList = new ArrayList<Tag>();
ArrayList<Task> taskList = new ArrayList<Task>();
//ArrayList<Object> database = new ArrayList<Object>();
//HashMap<String,DatabaseElement> db = new HashMap<String,DatabaseElement>();
ArrayList<DatabaseElement> database = new ArrayList<DatabaseElement>();
int CurrentTaskNo = 0;

Creator orhan, bager;
void setup() {
  database.add(new DatabaseElement("dream", "dream.txt"));
  addCreators();
  addRandomTagsToCreators();
  createTaskList();
  
  while (CurrentTaskNo < taskList.size()){
  task_tag();
  task_setConsensus();
  if (task_executeConsensus()){
    CurrentTaskNo++;
  }else
  {
    taskList.get(CurrentTaskNo).tags = new IntList();
    taskList.get(CurrentTaskNo).consensus = -1;
  }
  
    
  }
}

void addCreators() {  
  String[] names = {"Alper", "Bager", "Cansu", "Ecem", "Ege", "Orhan", "Özgür", "Yavuzhan"};
  for (int i=0; i<names.length; i++) {
    creators.add(new Creator(names[i]));
  }
  println("Number of Creators : "+creators.size());
}

void addRandomTagsToCreators() {
  int creatorSize = creators.size();

  String[] someTags={"plan", "write", "design", "lojistic", "tag", "draw"};
  print("Tags : ");
  for (int i=0; i<=someTags.length-1; i++) {
    tagList.add(0, new Tag(someTags[i]));
    print(tagList.get(0).id+" : "+tagList.get(0).text+"    ");
  }
  println("");
  int tagSize = tagList.size();

  for (int i=0; i<=creatorSize-1; i++) {
    creators.get(i).tags.append(int(random(tagSize)));
    creators.get(i).tags.append(int(random(tagSize)));
    creators.get(i).tags.append(int(random(tagSize)));
  }

  for (int i=0; i<=creatorSize-1; i++) {
    print(creators.get(i).name+"  :  ");
    for (int j=0; j<=creators.get(i).tags.size()-1; j++) {
      print(tagList.get(creators.get(i).tags.get(j)).text+"  ");
    }
    println("");
  }
}
