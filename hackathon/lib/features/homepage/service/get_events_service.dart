import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon/core/core/model/event_model.dart';



class EventService{


Future<dynamic> getir()async{
    print("getire geldi");
    List datalar = [];
       var allEvents= await FirebaseFirestore.instance.collection("events").get();
      print("13 e geldi"+allEvents.docs.length.toString());
      
      print(allEvents.docs.length);
      for(var i=0;i<allEvents.docs.length;i++){  print("fora girdi");
        datalar.add(EventModel.fromSnapshot(allEvents.docs[i]));
      
        print("data uzunluk : "+datalar.length.toString());
      }

  return datalar;
}
}