ArrayList<Creator> Creators = new ArrayList<Creator>();
ArrayList<Tag> tagList = new ArrayList<Tag>();
Dream theDream;
int systemBalance = 10000;

boolean printTransactions = true;

Creator orhan, bager;
void setup() {
  addCreators();
  addRandomTagsToCreators();
  transferMoneyToSystem(Creators.get(0).id,50);
  theDream = new Dream(Creators.get(0).id,"bana bi tane sarılmış sigara gelsin yarım saat içinde!");
  
  //dream task queue olsun //
  
}

void addCreators() {  
  String[] names = {"Alper", "Bager", "Cansu", "Ecem", "Ege", "Orhan", "Özgür", "Yavuzhan"};
  for (int i=0; i<names.length; i++)
    Creators.add(new Creator(names[i]));

  println("Creator Sayısı : "+Creators.size());
}

void addRandomTagsToCreators() {
  int creatorSize = Creators.size();

  String[] someTags={"muhasebe", "planlama", "lojistik", "tasarım", "uzlaşma", "bütçelendirme", "tasarım"};
  for (int i=0; i<=someTags.length-1; i++) {
    tagList.add(0, new Tag(someTags[i]));
    println(tagList.get(0).id+" : "+tagList.get(0).text);
  }
  int tagSize = tagList.size();

  println("CreatorSize : "+ creatorSize);
  println("tagSize : "+ tagSize);


  for (int i=0; i<=creatorSize-1; i++) {
    Creators.get(i).tags.append(int(random(tagSize-1)));
    Creators.get(i).tags.append(int(random(tagSize-1)));
    Creators.get(i).tags.append(int(random(tagSize-1)));
  }

  //println(Creators.get(0).name);
  //println(tagList.get(Creators.get(0).tags.get(0)).text);
  //println(tagList.get(Creators.get(0).tags.get(1)).text);
}
