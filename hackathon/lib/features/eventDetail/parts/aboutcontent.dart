part of event_detail_view;


class AboutContentWidget extends StatelessWidget {
  final String _aboutText;
  AboutContentWidget(this._aboutText);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("About this event",style: TextThemeLight.instance!.headline5,),
            IconButton(onPressed: (){}, icon: Icon(Icons.comment,color: theme.primaryColor,))
        
          ],
        ),
        
        Container(
          padding: EdgeInsets.only(right: 10,bottom: 20),
          child: Text(_aboutText,style: aboutStyle)),
        
      ],),
    );
  }
}