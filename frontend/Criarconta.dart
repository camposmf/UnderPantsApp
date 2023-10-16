///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class Criarconta extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xff94b9e4),
body:Align(
alignment:Alignment.center,
child:Padding(
padding:EdgeInsets.fromLTRB(16, 50, 16, 40),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"Crie sua conta",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w900,
fontStyle:FontStyle.normal,
fontSize:28,
color:Color(0xff000000),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 16),
child:TextField(
controller:TextEditingController(),
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
hintText:"Nome",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff9f9d9d),
),
filled:true,
fillColor:Color(0xfff2f2f3),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
),
),
TextField(
controller:TextEditingController(),
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
hintText:"E-mail",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff9f9d9d),
),
filled:true,
fillColor:Color(0xfff2f2f3),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 16,horizontal:0),
child:TextField(
controller:TextEditingController(),
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
hintText:"Telefone",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff9f9d9d),
),
filled:true,
fillColor:Color(0xfff2f2f3),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
),
),
TextField(
controller:TextEditingController(),
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(12.0),
borderSide:BorderSide(
color:Color(0x00ffffff),
width:1
),
),
hintText:"Senha",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff9f9d9d),
),
filled:true,
fillColor:Color(0xfff2f2f3),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
suffixIcon:Icon(Icons.visibility,color:Color(0xff9f9d9d),size:20),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 16),
child:MaterialButton(
onPressed:(){},
color:Color(0xff005bff),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(12.0),
),
padding:EdgeInsets.all(16),
child:Text("Criar", style: TextStyle( fontSize:16,
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:50,
minWidth:MediaQuery.of(context).size.width,
),
),
Align(
alignment:Alignment.center,
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.min,
children:[

Text(
"Já tem uma conta? ",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
Padding(
padding:EdgeInsets.fromLTRB(4, 0, 0, 0),
child:Text(
"Entre",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w900,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff002dff),
),
),
),
],),),
],),),),),
)
;}
}
