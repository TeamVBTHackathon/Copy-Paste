part of event_detail_view;

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
       
       height: context.height/8,
       width: context.width *3/4,
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