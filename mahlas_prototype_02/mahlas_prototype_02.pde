// https://github.com/mahlas-network/docs/blob/master/parts/idaf/prototype.md
import javax.activation.MimetypesFileTypeMap;

ArrayList<Creator> creators = new ArrayList<Creator>();
ArrayList<Tag> tagList = new ArrayList<Tag>();
ArrayList<Sentence> sentenceList = new ArrayList<Sentence>();

//ArrayList<Object> database = new ArrayList<Object>();
//HashMap<String,DatabaseElement> db = new HashMap<String,DatabaseElement>();
ArrayList<DatabaseElement> database = new ArrayList<DatabaseElement>();

Creator orhan, bager;
void setup() {
  database.add(new DatabaseElement("dream", "dream.txt"));
  addCreators();
  addRandomTagsToCreators();
  createsentenceList();
  int CurrentSentenceNo = 0;
  int CurrentTaskNo = 0;
  
  for (Sentence s : sentenceList) {
    createTaskList(s);
    //sentence execution should have a return value, for if goto
  }

//  while (CurrentTaskNo < sentenceList.size()){
//    task_tag();
//    task_setConsensus();
//    if (task_executeConsensus()){
//      CurrentTaskNo++;
//    }else
//    {
//      sentenceList.get(CurrentTaskNo).tags = new IntList();
//      sentenceList.get(CurrentTaskNo).consensus = -1;
//    }
//  }
  
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

void createsentenceList() {
  sentenceList.add(new Sentence("Artist's Name", "Find a name for the artist"));
  sentenceList.add(new Sentence("Artwork Idea", "Find an idea for the artwork"));
  sentenceList.add(new Sentence("Approval", "Ask for approval from the curaters if not accepted go back to idea creation"));
  sentenceList.add(new Sentence("Artwork Production", "Produce the artwork"));
  sentenceList.add(new Sentence("Artworks Name", "Find a name for the artwork "));
  sentenceList.add(new Sentence("Write Description", "Write description for the artwork"));
  sentenceList.add(new Sentence("Documentation", "Documentate the artwork"));
  sentenceList.add(new Sentence("Send documentation", "Send the documentation to curators"));
  sentenceList.add(new Sentence("Send the artwork", "Send the artwork to a suitable location for the curators"));
}