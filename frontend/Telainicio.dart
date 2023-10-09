///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class Telainicio extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xff95b9e3),
body:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Padding(
padding:EdgeInsets.fromLTRB(16, 40, 16, 16),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Expanded(
flex: 1,
child: 
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 8),
child:Text(
"Olá,",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w800,
fontStyle:FontStyle.normal,
fontSize:33,
color:Color(0xfff9f9f9),
),
),
),
Text(
"CraqueNeto",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w800,
fontStyle:FontStyle.normal,
fontSize:24,
color:Color(0xff000000),
),
),
],),),
SizedBox(
height:50,
width:50,
child:
Stack(
alignment:Alignment.topRight,
children: [
Container(
height:50,
width:50,
clipBehavior: Clip.antiAlias,
decoration: BoxDecoration(
shape: BoxShape.circle,
),
child:Image.network(
 "https://image.freepik.com/free-photo/portrait-beautiful-young-woman-looking-camera_23-2147865523.jpg",
fit:BoxFit.cover),
),
],),),
],),),
Padding(
padding:EdgeInsets.all(16),
child:Text(
"Oque você precisa?",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(16, 0, 16, 30),
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
disabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
focusedBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
enabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
filled:true,
fillColor:Color(0x00ffffff),
isDense:true,
contentPadding:EdgeInsets.all(12),
prefixIcon:Icon(Icons.search,color:Color(0xffffffff),size:20),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(16, 16, 16, 60),
child:Row(
mainAxisAlignment:MainAxisAlignment.spaceBetween,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Text(
"Categorias",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:18,
color:Color(0xff000000),
),
),
],),),

GridView( 
padding:EdgeInsets.fromLTRB(16, 0, 16, 90),
shrinkWrap:true,
scrollDirection:Axis.vertical,
physics:ClampingScrollPhysics(), 
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
crossAxisCount:3,
crossAxisSpacing:16,
mainAxisSpacing:16,
childAspectRatio:0.7,
),
children:[
Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
decoration: BoxDecoration(
color:Color(0xffffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(10.0),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:50,
height:50,
decoration: BoxDecoration(
color:Color(0xff5f75e6),
shape:BoxShape.circle,
),
child:
ImageIcon(
AssetImage("images/114955.png"),
size:55,
color:Color(0xffffffff),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Text(
"Receitas",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
],),
),
Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
decoration: BoxDecoration(
color:Color(0xffffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(10.0),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:50,
height:50,
decoration: BoxDecoration(
color:Color(0xffe260b7),
shape:BoxShape.circle,
),
child:
ImageIcon(
AssetImage("images/contas.png"),
size:50,
color:Color(0xffffffff),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Text(
"Contas",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
],),
),
Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
decoration: BoxDecoration(
color:Color(0xffffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(10.0),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:50,
height:50,
decoration: BoxDecoration(
color:Color(0xffee9d30),
shape:BoxShape.circle,
),
child:
ImageIcon(
AssetImage("images/despesa.jpg"),
size:50,
color:Color(0xffffffff),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Text(
"Despesas",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:15,
color:Color(0xff000000),
),
),
),
],),
),
Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
decoration: BoxDecoration(
color:Color(0xffffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(10.0),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:50,
height:50,
decoration: BoxDecoration(
color:Color(0xff5cde75),
shape:BoxShape.circle,
),
child:
ImageIcon(
NetworkImage("https://cdn4.iconfinder.com/data/icons/outdoor-nature-and-ecology-vol-2/24/_animal_care-128.png"),
size:30,
color:Color(0xffffffff),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Text(
"Metas",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:15,
color:Color(0xff000000),
),
),
),
],),
),
Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
decoration: BoxDecoration(
color:Color(0xffffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(10.0),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:50,
height:50,
decoration: BoxDecoration(
color:Color(0xffe98258),
shape:BoxShape.circle,
),
child:
ImageIcon(
AssetImage("images/usuario.png"),
size:24,
color:Color(0xffffffff),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Text(
"Usuário",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
],),
),
Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
decoration: BoxDecoration(
color:Color(0xffffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(10.0),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Container(
alignment:Alignment.center,
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:50,
height:50,
decoration: BoxDecoration(
color:Color(0xff4ee3ce),
shape:BoxShape.circle,
),
child:
ImageIcon(
NetworkImage("https://cdn4.iconfinder.com/data/icons/social-productivity-line-art-4/128/security-shield-lock-128.png"),
size:30,
color:Color(0xffffffff),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Text(
"Mercado",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
],),
),
],),
Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
height:170,
decoration: BoxDecoration(
color:Color(0x00ffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.zero,
),
)

,
],),),
)
;}
}
