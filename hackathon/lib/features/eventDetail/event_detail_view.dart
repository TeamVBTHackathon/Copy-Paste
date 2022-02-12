
library event_detail_view;
import 'package:flutter/material.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/text_theme_light.dart';
import 'package:hackathon/core/init/theme/theme.dart';
import 'package:hackathon/features/eventDetail/strings.dart';

part 'parts/topcontent.dart';
part 'parts/aboutcontent.dart';
part 'parts/schedulescontent.dart';
part 'parts/participant.dart';
part 'parts/joinbutton.dart';

TextStyle headerStyle=TextStyle(fontFamily: FONT_FAMILY,fontSize: 22,fontWeight: FontWeight.normal,color: Colors.white);
TextStyle hostTextStyle=TextStyle(fontFamily: FONT_FAMILY,fontSize: 14,fontWeight: FontWeight.normal,color: Colors.yellow);
TextStyle aboutStyle = TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 13);


class EventDetail extends StatefulWidget {
  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  String _eventDate = "12.02.2022";

  String _duration = "4 hours";

  String _timeRange = "11:30 am - 15:30 pm ";

  String _eventType = "Virtual Event";

  String _title = "Woodly Virtual Event The Creative";

  String _host = "Veli Bacık";

  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [




            //Join butona kadar olan kısım
            Container(
              //color: Colors.blue,
              height: context.height*8/10,
              child: Column(
                children: [
                    //ArrowBack and favorite Icon
                    header(),

        
                    //Top Content 
                     TopContentWidget(_title,_host),
                      
                  
                    //About Content 
                     AboutContentWidget(aboutsText),
        

                    //Next Schadule 
                    SchedulesContentWidget(eventDate: _eventDate, timeRange: _timeRange, eventType: _eventType, duration: _duration),
        
        
        
          
              ],),
            ),



                  //Alt Bölüm
                    Container(
                      //color: Colors.red,
                      height: context.height*2/10,
                      child:
                     Column(
                        children: 
                        [

                          //Participant profile 
                          ParticipantContentWidget(),

                          //Join Button 
                          JoinButton()

                        ],
                      ),
                    ),
                
          
        
         
        
         
         
           
        
        
          ],),
        ),
      )
    );
  }











  Container header() {
    return Container(
        margin: EdgeInsets.only(top: 30,bottom: 30),
        child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children:[
    
    IconButton(icon: const Icon(Icons.arrow_back,color: Colors.black,size: 35,),
  
 onPressed: (){},),
  IconButton(
    icon:Icon(favorite==false ?Icons.favorite_outline:Icons.favorite,color: redTheme.primaryColor,size: 35,),onPressed: ()=>setState(() {
      favorite=!favorite;
    })),
 ]
),
      );
  }
}






