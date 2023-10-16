///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class Esquecisenha extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xff92bae8),
appBar: 
AppBar(
elevation:0,
centerTitle:true,
automaticallyImplyLeading: false,
backgroundColor:Color(0xff94bae7),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
title:Text(
"Esqueceu a senha",
style:TextStyle(
fontWeight:FontWeight.w800,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
leading: Icon(
Icons.arrow_back,
color:Color(0xff060000),
size:24,
),
),
body:SizedBox(
height:MediaQuery.of(context).size.height,
width:MediaQuery.of(context).size.width,
child:
Stack(
alignment:Alignment.topLeft,
children: [
Align(
alignment:Alignment.center,
child:Padding(
padding:EdgeInsets.fromLTRB(16, 0, 16, 50),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:AssetImage("assets/images/Neto-pig.jpg"),
height:150,
width:200,
fit:BoxFit.contain,
),
Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 16),
child:Text(
"Esqueceu sua senha ?",
textAlign: TextAlign.center,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:24,
color:Color(0xffffffff),
),
),
),
Text(
" Basta inserir o endereço de e-mail que você usou para se registrar",
textAlign: TextAlign.center,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:18,
color:Color(0xffffffff),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 50, 0, 0),
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
hintText:"Insira seu e-mail",
hintStyle:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xffffffff),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
),
),
],),),),),
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 30),
child:Align(
alignment:Alignment.bottomRight,
child:MaterialButton(
onPressed:(){},
color:Color(0xff0055ff),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.only(topLeft: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
side:BorderSide(color:Color(0xff808080),width:1),
),
padding:EdgeInsets.all(16),
child:Text("Enviar", style: TextStyle( fontSize:19,
fontWeight:FontWeight.w800,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:60,
minWidth:190,
),
),
),
],),),
)
;}
}
