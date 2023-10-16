///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class Mudarsenha extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xff98bae3),
appBar: 
AppBar(
elevation:0,
centerTitle:false,
automaticallyImplyLeading: false,
backgroundColor:Color(0xff93b8e3),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
title:Text(
"Change Password",
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
leading: Icon(
Icons.arrow_back,
color:Color(0xff212435),
size:24,
),
),
body:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Padding(
padding:EdgeInsets.all(16),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
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
hintText:"Senha antiga",
hintStyle:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xffffffff),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
suffixIcon:Icon(Icons.visibility,color:Color(0xff9f9d9d),size:24),
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
hintText:"Nova senha",
hintStyle:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xffffffff),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
suffixIcon:Icon(Icons.visibility,color:Color(0xff9f9d9d),size:24),
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
hintText:"Repita a nova senha",
hintStyle:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xffffffff),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
suffixIcon:Icon(Icons.visibility,color:Color(0xff9f9d9d),size:24),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
child:MaterialButton(
onPressed:(){},
color:Color(0xff005bff),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(12.0),
),
padding:EdgeInsets.all(16),
child:Text("Continue", style: TextStyle( fontSize:16,
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:50,
minWidth:MediaQuery.of(context).size.width,
),
),
],),),),
Padding(
padding:EdgeInsets.fromLTRB(0, 35, 0, 0),
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:AssetImage("assets/images/neto.jfif"),
height:180,
width:180,
fit:BoxFit.cover,
),
),
],),
)
;}
}
