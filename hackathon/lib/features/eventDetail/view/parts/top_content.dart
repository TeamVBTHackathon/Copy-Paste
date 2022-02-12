part of event_detail_view;

class TopContentWidget extends StatelessWidget {
 final String _title;
 final String _host;
 const TopContentWidget(this._title,this._host, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [

        // bottom layer
        Container(
      padding: EdgeInsets.only(left: 15),
      height: context.height/4,
      width: double.infinity,
      decoration: BoxDecoration(
       // color: redTheme.primaryColor,
        borderRadius: BorderRadius.circular(10),

        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://www.sermayepiyasalari.net/wp-content/uploads/2021/06/vbt.jpg")
          )
        ),
          ),


     // middle layer
    Container(
       padding: EdgeInsets.only(left: 15),
      height: context.height/4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),)
    ),

    //  top Layer
    Container(
      padding: EdgeInsets.only(left: 15),
      height: context.height/4,
      width: double.infinity,
      decoration: BoxDecoration(
       // color: redTheme.primaryColor,
        borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        
          children: [
            Container(
              
              width: context.width,
              //color: Colors.black,
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  //color: Colors.orange,
                  width: context.width*2/4,  
                                    margin: EdgeInsets.only(
                                        left: 5,),
                                    child: Text(
                                      _title,
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
                          Text("Hosted by $_host",style: hostTextStyle,)
                        ],
                      )
        
            
          ],
        ),
    ),
      ],
    );
  }
}
