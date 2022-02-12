part of create_event.dart;

class SubmitButton extends StatelessWidget {
  var _formKey;
  SubmitButton(this._formKey);
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: context.height/15,
      child: ElevatedButton(onPressed: ()=>_trySubmit(context,_formKey),
      style: ElevatedButton.styleFrom(
        primary: theme.primaryColor,
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(30.0),
           ),
      ),
       child: Text("Submit")));
  }


     void _trySubmit(context,var _formKey) async {
    final _isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_isValid) {
      _formKey.currentState!.save();
    }
  }

}
