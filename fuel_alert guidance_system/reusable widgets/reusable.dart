import 'package:flutter/material.dart';

Image logoWidget(String imageName){
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width:340,
      height: 340,
      //color:Colors.white,
      );
  }



hexStringToColor(String hexColor){
  hexColor=hexColor.toUpperCase().replaceAll("#", "");
  if(hexColor.length==6){
    hexColor="FF$hexColor";
  }
  return Color(int.parse(hexColor,radix:16));
}

TextField reusableTextField(String text,IconData icon,bool isPasswordType,
  TextEditingController controller)
  {
    return TextField(controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    
    style: TextStyle(color: const Color.fromARGB(255, 255, 252, 252).withOpacity(0.9)),
    decoration: InputDecoration(prefixIcon: Icon(icon,color: Colors.white70,),
    labelText: text,
   
    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
    
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.white.withOpacity(0.3),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: const BorderSide(width: 0,style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
    );
  }

  TextField reusableTextField1(String text,IconData icon,bool isPhonenumber,
  TextEditingController controller)
  {
    return TextField(controller: controller,
    obscureText: isPhonenumber,
    enableSuggestions: !isPhonenumber,
    autocorrect: !isPhonenumber,
    cursorColor: Colors.white,
    style: TextStyle(color: const Color.fromARGB(255, 255, 252, 252).withOpacity(0.9)),
    decoration: InputDecoration(prefixIcon: Icon(icon,color: Colors.white70,),
    labelText: text,
    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.white.withOpacity(0.3),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: const BorderSide(width: 0,style: BorderStyle.none)),
    ),
    keyboardType: isPhonenumber ? TextInputType.phone: TextInputType.number,
    
    );
  }

Container signInSignUpButton(
  BuildContext context,bool isLogin,Function onTap){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(onPressed: (){onTap();}, child: Text(isLogin ? "Login" : "Sign up", 
      style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 16),
      ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
        if (states.contains(MaterialState.pressed))
        {
          return Colors.black26;
        }
        return Colors.white;
      } ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      ),
    );
  }

  Container navigateButton(
  BuildContext context, title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Color.fromARGB(221, 26, 3, 3),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black26.withOpacity(0.8); // add opacity to the pressed color
          }
          return Colors.white.withOpacity(0.9); // add opacity to the default color
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  );
}

TextField userinfo123(String text,IconData icon,bool isPasswordType,
  TextEditingController controller)
  { 
    return TextField(controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: const Color.fromARGB(255, 255, 252, 252).withOpacity(0.9)),
    decoration: InputDecoration(prefixIcon: Icon(icon,color: Colors.white70,),
    labelText: text,
    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.white.withOpacity(0.3),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: const BorderSide(width: 0,style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
    );
  }
  
  Container userButton(
  BuildContext context,title,Function onTap){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(onPressed: (){onTap();}, child: Text(title, 
      style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 16),
      ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
        if (states.contains(MaterialState.pressed))
        {
          return Colors.black26;
        }
        return Color.fromARGB(239, 250, 187, 0);
      } ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      ),
    );
  }
  

  TextField reusableTextField3(String text,IconData icon,bool isPasswordType,
  TextEditingController controller)
  {
    return TextField(controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    
    style: TextStyle(color: const Color.fromARGB(255, 255, 252, 252).withOpacity(0.9)),
    decoration: InputDecoration(prefixIcon: Icon(icon,color: Colors.white70,),
    labelText: text,
   
    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
    
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.white.withOpacity(0.3),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),borderSide: const BorderSide(width: 0,style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
    );
  }