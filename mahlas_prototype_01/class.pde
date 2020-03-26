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
  int estimatedCost;
  int cost;
  int estimatedTimeLength;
  LocalDateTime startTime;
  LocalDateTime endTime;
  ArrayList<Task> taskList = new ArrayList<Task>();
  ArrayList<Message> MessagesReceived = new ArrayList<Message>();
  ArrayList<Message> MessagesReplied = new ArrayList<Message>();
  ArrayList<Message> MessagesToSend = new ArrayList<Message>();
  ArrayList<Message> MessagesArchived = new ArrayList<Message>();


  Dream (int id, String _text) {
    dreamerID = id ;
    text = _text;
    status = 1 ;
    cost = -1 ;
    estimatedTimeLength = -1;
    startTime = LocalDateTime.now(); 
    endTime = startTime.minusMinutes(-1);
    //println(startTime);
    //println(endTime);
    
    println(findCreatorByID(id).name+"'s dream is : "+text);
    
    /*
    "
    Dream declared  
    JobList.add "Dream"
    Data.add : "Dream text" -- dream is a task from now on
    JobList.addPrior : "Dream Clarity Check"
    forPriorJob (Job in tag / estimateTime / estimateCost / set_consensus / execute_consensus)
      assign data to for job
      write human readable text for job
      execute job
    if consensus met {
      Move Joblist.firstJob to DoneList
      JobList.addPrior : "Atomization of open task, divide undone job into two if possible"
      forPriorJob (Job in tag / estimateTime / estimateCost / set_consensus / execute_consensus)
        assign data to for job
        write human readable text for job
        execute job
      move this job to DoneList (there should be three jobs before that and two after)
      forPriorJob (Job in tag / estimateTime / estimateCost / set_consensus / execute_consensus)
        assign data to for job
        write human readable text for job
        execute job
      
      
    
    }else{ 
    fail
    }
    document
    
    
    //
    task is made. dreamer, text, cost are written to database
      create one atomic prior task and delete priors part from the task //w consensus
      assign related database elements to prior task //w consensus
      tag prior task //w consensus
      estimate total time to execute prior task //w consensus
      estimate total cost to execute prior task //w consensus
      set consensus type to clarify prior task //w consensus
      execute_consensus
      if (consensus met) execute prior task //w consensus
      write task output to database //w consensus
  
  
  ----------------------
      
      assume task is perfect, bpml is perfect, we have workers for all tasks tags, everyone works for free, time is not important
      bpml is linear
      
      until all task are done
        take first task undone
        tag task
        set consensus for task type
        execute task w/consensus
        mark task done
      
      consensus types
      
      "idsf için bir eser üretecek bir sanatçı oluşturup o eserin üretilmesi"
      "idsf nedir netleşmesi lazım" + "idsf için bir eser üretecek bir sanatçı oluşturup o eserin üretilmesi" 
      bla bla tüm standart tasklar 
      "idsf bir festival web sitesi şurada...."
      "iki cümlenin birleştirilmesi"
      "idsf bir festival web sitesi şurada.... + bunun için bir eser üretecek bir sanatçı oluşturup o eserin üretilmesi"
      "sanatçı kim anlaşılmıyor"
      bla bla bla
      "kurgusal bir sanatçı oluşturulacak."
      "kurgusal bir sanatçı oluşturmak lazım önce"
      
      bu yapı gitgide sistemi karmaşıklaştırmaz mı?
      taskın netleştirilmesi
      taskın priorisinin ayrılması
      taskın priorisinin execute edilmesi
      taskın tekrar yazılması
    
    
    //kasmayayım bir şekilde basit olarak çözeyim. sergide yapılan ok bence şimdilik.
    
    */
    
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
  int id, balance;
  int wagePerMinute; //cents
  String name;
  IntList tags = new IntList();
  //int status;
  Creator(String _name) {
    id=Creators.size();
    name=_name;
    balance = 10000;
  }
}

class Tag {
  int id;
  String text;
  Tag(String _text) {
    id = tagList.size();
    text = _text;
  }
}

class Task {
  int id;
  String text;
  /*
  0 open_forever
   1 open
   2 assigned
   3 delivered
   4 consensus_met
   5 consensus_unmet
   5 paid
   */
  int status;
  int estimatedCost;
  int cost;
  int estimatedTime;
  int startTime;
  int endTime;
  int consensus;
  boolean isAtom;

  Task(String _text) {
    text=_text;
  }
}
