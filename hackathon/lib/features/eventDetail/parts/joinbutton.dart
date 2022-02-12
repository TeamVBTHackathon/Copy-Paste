part of event_detail_view;

class JoinButton extends StatelessWidget {
  const JoinButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: context.height/15,
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
