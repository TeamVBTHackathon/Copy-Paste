import 'package:flutter/material.dart';
import 'package:hackathon/core/init/theme/text_theme_light.dart';
import 'package:hackathon/core/init/theme/theme.dart';
import 'package:hackathon/features/eventDetail/strings.dart';



TextStyle headerStyle=TextStyle(fontFamily: FONT_FAMILY,fontSize: 20,fontWeight: FontWeight.normal,color: Colors.white);
TextStyle hostTextStyle=TextStyle(fontFamily: FONT_FAMILY,fontSize: 12,fontWeight: FontWeight.normal,color: Colors.yellow);
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

          
            
          //ArrowBack and favorite Icon
          header(),


          //Top Content 
          TopContentWidget(),
            
        
          //About Content 
          AboutContentWidget(),
        

          //Next Schadule 
          SchedulesContentWidget(eventDate: _eventDate, timeRange: _timeRange, eventType: _eventType, duration: _duration),
        
        
          //Participant profile 
          ParticipantContentWidget(),
        
         
          //Join Button 
          JoinButton(),
         
           
        
        
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

class JoinButton extends StatelessWidget {
  const JoinButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: (){},
      style: ElevatedButton.styleFrom(
        primary: redTheme.primaryColor,
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(30.0),
           ),
      ),
       child: Text("Join")));
  }
}

class ParticipantContentWidget extends StatelessWidget {
  const ParticipantContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 160,
          height: 35,
          child: ListView.builder(
            shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context,index){
          return CircleAvatar(
            backgroundColor: Colors.grey,
          );
        })),
        Text(" +15 participants",style: TextStyle(fontSize: 15),)
      ],
    );
  }
}

class SchedulesContentWidget extends StatelessWidget {
  const SchedulesContentWidget({
    Key? key,
    required String eventDate,
    required String timeRange,
    required String eventType,
    required String duration,
  }) : _eventDate = eventDate, _timeRange = timeRange, _eventType = eventType, _duration = duration, super(key: key);

  final String _eventDate;
  final String _timeRange;
  final String _eventType;
  final String _duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
                 padding: EdgeInsets.only(left: 5),
                 child: Text("Next schedules",style: TextThemeLight.instance!.headline5,)),
      
      Container(
       //color: Colors.orange,
       height: 100,
       width: MediaQuery.of(context).size.width *3/4,
       child:Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
        
           
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 Icon(Icons.date_range),
                 Text(_eventDate),
               ],),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 Icon(Icons.schedule),
                 Text(_timeRange),
               ],),
              
             ],
           ),
            Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 Icon(Icons.video_call),
                 Text(_eventType),
               ],),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 Icon(Icons.schedule),
                 Text(_duration),
               ],)
             ],
           ),
           
       ],)
     ),
      ],
    );
  }
}

class AboutContentWidget extends StatelessWidget {
  const AboutContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("About this event",style: TextThemeLight.instance!.headline5,),
            IconButton(onPressed: (){}, icon: Icon(Icons.comment,color: redTheme.primaryColor,))
        
          ],
        ),
        
        Container(
          padding: EdgeInsets.only(right: 10,bottom: 20),
          child: Text(aboutsText,style: aboutStyle)),
        
      ],),
    );
  }
}

class TopContentWidget extends StatelessWidget {
  const TopContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: redTheme.primaryColor,
        borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        
          children: [
            Container(
              
              width: 400,
             // color: Colors.black,
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  //color: Colors.orange,
                  width: 200,  
                                    margin: EdgeInsets.only(
                                        left: 5,),
                                    child: Text(
                                      "Woodly Virtual Event The Creative",
                                    style:headerStyle,)
                                  ),
                                  Container(
                                     margin: EdgeInsets.only(right: 40),
                                    child: Icon(Icons.event,size: 30,color: Colors.orange,))
                                  
              ],),
            ),
           
            Row(
                        children: [
                          Icon(Icons.announcement,color: Colors.yellow,size: 25,),
                          Text("Hosted by Veli Bacık",style: hostTextStyle,)
                        ],
                      )
        
            
          ],
        ),
    );
  }
}
