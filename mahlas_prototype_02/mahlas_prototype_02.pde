// https://github.com/mahlas-network/docs/blob/master/parts/idaf/prototype.md
import javax.activation.MimetypesFileTypeMap;

ArrayList<Creator> creators = new ArrayList<Creator>();
ArrayList<Tag> tagList = new ArrayList<Tag>();
ArrayList<Sentence> sentenceList = new ArrayList<Sentence>();
ArrayList<Task> taskList = new ArrayList<Task>();

ArrayList<DatabaseElement> database = new ArrayList<DatabaseElement>();

Creator orhan, bager;
void setup() {
  database.add(new DatabaseElement("dream", "dream.txt"));
  addCreators();
  addRandomTagsToCreators();
  createSentenceList();
  int CurrentSentenceNo = 0;
  int CurrentTaskNo = 0;

  /*
  -----------------------------------------
  Dream is a paragraph
  -----------------------------------------
  
  To be represented in Istanbul Digital Art Festival a pseudo artist and its first artwork will be created and exhibited. 
  Curators of the exhibition Ege Sevinçli (ege@digitalartfestistanbul.org) and Esra Özkan (esra@digitalartfestistanbul.org) 
  are aware of the project. They should be added to the system for guidance in the creation process. Total budget is 600$.
  
  -----------------------------------------
  Sentences are a list of human readables to dos
  -----------------------------------------
  
  Find a name for the artist  
  Find an idea for the artwork
  Ask for approval from the curaters if not accepted go back to idea creation
  Produce the artwork
  Find a name for the artwork
  Write description for the artwork
  Documentate the artwork
  Send the documentation to curators
  Send the artwork to a suitable location for the curators
 
  -----------------------------------------
  Task are sentences turned to bpml
  -----------------------------------------
  
  5 different people - generate 10 name possibilities for the artist
  put names generated together in a text file
  400 people - make vs between two random words - put scores in a shared scoresheet
  select top 5 scores
  5 different people - write advantages/disadvanteges line by line for all names -- put result in a file for all names
  10 people - sort 5 names after reading advantages and disadvantages
  select top one
  
  -----------------------------------------
  Atomic tasks are tasks with tag, consensus etc.
  -----------------------------------------
  
  5 times {
  tag "generate 10 name possibilities for the artist, create a text file with every sentence is one name" tag:tag -- result:writing, creative
  set consensus "generate 10 name possibilities for the artist, create a text file with every sentence is one name" tag:consensus result:0
  "generate 10 name possibilities for the artist, create a text file with every sentence is one name" tag:writing, creative -- result file
  }
  
  tag "put names generated together in a text file" tag:tag -- result:writing
  set consensus "put together names generated in a text file" tag:consensus -- result:1
  "put together names generated in a text file" tag:writing result -- result : file
  check "put together names generated in a text file" tag:writing -- result:boolean
  if prev = false restart this group
   
  
  */

  for (Sentence s : sentenceList) {
    s.createTaskList();
    s.atomize();
    //createTaskList(s);
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

void createSentenceList() {
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