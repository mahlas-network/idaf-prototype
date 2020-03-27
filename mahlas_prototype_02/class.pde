import java.time.LocalDateTime;  

class Dream {
  int dreamerID;
  int id;
  String text;
  /*
   0 open
   1 wished
   2 started
   3 finished
   4 satisfied //aproval of dreamer
   5 failed
   6 fail checked
   7 paid
   */
  int status;
  ArrayList<Task> sentenceList = new ArrayList<Task>();
  ArrayList<Message> MessagesReceived = new ArrayList<Message>();
  ArrayList<Message> MessagesReplied = new ArrayList<Message>();
  ArrayList<Message> MessagesToSend = new ArrayList<Message>();
  ArrayList<Message> MessagesArchived = new ArrayList<Message>();


  Dream (int id, String _text) {
    dreamerID = id ;
    text = _text;
    status = 1 ;

    println(findCreatorByID(id).name+"'s dream is : "+text);
  }
}

class Message {
  boolean sent, replied;
  String text;
  Message(String _text) {
    text = _text;
    sent = false;
    replied = false;
  }
}


class Creator {
  int id;
  String name;
  IntList tags = new IntList();

  Creator(String _name) {
    id=creators.size();
    name=_name;
  }
}

class Tag {
  int id;
  String text;
  String description;
  Tag(String _text) {
    id = tagList.size();
    text = _text;
    description = "";
  }
}

class Task {
  int id;
  String text;
  /*
   1 open
   2 assigned
   3 delivered
   4 consensus_met
   5 consensus_unmet
   5 done
   */
  int status;
  int consensus;
  IntList tags = new IntList();

  Task(int _id, String _text) {
    id = _id;
    text = _text;
    status = 1;
    consensus = -1;
  }
}

class Sentence {
  ArrayList<Task> taskList = new ArrayList<Task>();
  ArrayList<Task> atomicTaskList = new ArrayList<Task>();
  String name;
  String description;
  Sentence(String _name, String _description) {
    name = _name ;
    description = _description ;
  }

  void atomize() {
    for (Task t : taskList) {
      atomicTaskList.add(task_tag(t));
      atomicTaskList.add(task_writeDesc(t));
      atomicTaskList.add(task_setConsensus(t));
    }
  }
}

class DatabaseElement {
  String name;
  String fileType; //txt, integer, file
  String fileName;
  String filePath;
  File file;

  DatabaseElement(String _name, String _fileName) {
    name = _name;
    fileName = _fileName;
    filePath = sketchPath("") +"files\\"+fileName;
    file = new File(filePath);
    fileType = new MimetypesFileTypeMap().getContentType(file);
    println ("New database entry : "+name);
    println ("Filename :"+fileName+"  ---  FileType : "+fileType+"  ---  FilePath : "+filePath);
  }
}
