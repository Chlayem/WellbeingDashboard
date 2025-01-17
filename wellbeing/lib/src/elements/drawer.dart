import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../blocs/provider.dart';
import 'menu_item.dart';

class Draweer extends StatefulWidget {
  List<MenuuItem> items;
  String username;
  String role;
  Draweer({required this.items,required this.username,required this.role});
  @override
  State<Draweer> createState() => _DraweerState();
}

class _DraweerState extends State<Draweer> {
  Widget build(context) {
    //bool s=false;
    double screenWidth = MediaQuery.of(context).size.width;
    //double itemSpacing = screenHeight * 0.02;

    return Drawer(
      elevation: 0,
      //backgroundColor: Color.fromRGBO(3, 28, 48, 1.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromRGBO(2, 13, 21, 1.0),
              Color.fromRGBO(20, 120, 198, 1.0),

            ]
          )
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 40.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/James.jpg"),
                ),
                title: Text(widget.username,style: GoogleFonts.mulish(color: Colors.white,),),
                subtitle: Text(widget.role,style: GoogleFonts.mulish(color: Colors.grey),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(color: Colors.white,),
            ),
            //SizedBox(height: 50.0,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context,i){
                if(widget.items[i].isExpansion){
                  List<MenuuItem>? l=widget.items[i].exItems;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
                    child: ExpansionTile(
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      leading: Icon(widget.items[i].icon,color: Colors.white,),
                      title: Text(widget.items[i].title,style:GoogleFonts.mulish(
                        color: Colors.white,
                        //letterSpacing: 3.0,
                      ) ,),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: l?.length  ,
                          itemBuilder: (context,j){
                            return Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: ListTile(
                                  selected: l?[j].isSelected??false,
                                  selectedTileColor: Color.fromRGBO(100, 200, 220, 1.0),
                                  hoverColor: Color.fromRGBO(100, 200, 220, 1.0),
                                leading:Icon(l![j].icon,color: Colors.white,size: 15.0,) ,
                                title: Text(l[j].title,style: GoogleFonts.mulish(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),),
                                onTap: () {setState(() {
                                  for(MenuuItem item in widget.items){
                                    if (item.isExpansion){
                                      for(MenuuItem it in item.exItems!){
                                        it.isSelected=false;
                                      }}else{
                                      item.isSelected=false;
                                    }
                                  }
                                  l[j].isSelected=true;
                                });

                                  if(screenWidth <= 1100){
                                    Navigator.of(context).pop();
                                  }
                                  Provider.of(context).navigateToScreen(l[j].screenIndex);

                                }
                              ),
                            );
                          }
                      ),]
                    ),
                  );
                } else{return Padding(
                  padding: EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
                  child: ListTile(
                    selected: widget.items[i].isSelected,
                    selectedTileColor: Color.fromRGBO(100, 200, 220, 1.0),
                    hoverColor: Color.fromRGBO(100, 200, 220, 1.0),
                    leading: Icon(widget.items[i].icon,color: Colors.white,),
                    title: Text(widget.items[i].title,style: GoogleFonts.mulish(
                      color: Colors.white,
                      //letterSpacing: 3.0,
                    ),),
                    onTap: (){
                      setState(() {
                        for(MenuuItem item in widget.items){
                          if (item.isExpansion){
                            for(MenuuItem it in item.exItems!){
                              it.isSelected=false;
                            }}else{
                            item.isSelected=false;
                          }
                        }
                        widget.items[i].isSelected=true;
                      });

                      if(screenWidth <= 1100){
                        Navigator.of(context).pop();
                      }
                      Provider.of(context).navigateToScreen(widget.items[i].screenIndex);

                    },
                  ),
                );}
              }
            ),
          ],
        ),
      ),
    );
  }
}