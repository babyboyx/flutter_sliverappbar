import "package:flutter/material.dart";

void main()=>runApp(
  MaterialApp(
    title: "Sliver",
    home: new Home(),
    theme: ThemeData(
      primaryColor: Colors.blue
    ),
  )
);

class Home extends StatelessWidget{

  List<String> itemData = ["one","two","three","four","car","two","three","one","car"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 350.0,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver title"),
              background: Image.asset("assets/imgs/car.jpg",fit: BoxFit.cover,)
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((contex,index){
                return Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(

                          padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
//                          color: Colors.grey,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            width: 100.0,
                            height: 100.0,
                            child:InkWell(
                                onTap: (){
                                  Navigator.of(context).push(new PageRouteBuilder(
                                      opaque: false,
                                      barrierDismissible:true,
                                      pageBuilder: (BuildContext context, _, __) {
                                        return Container(
                                          color: Colors.black38,
                                          alignment: Alignment.center,
                                          child: Material(
                                              color: Colors.redAccent.withOpacity(0.0),
                                              child: InkWell(
                                              onTap: (){
                                                print("clikc");
                                                Navigator.pop(context);
                                              },
                                              child: Hero(
                                                tag:"image_$index",
                                                child: Image.asset("assets/imgs/${itemData[index]}.jpg",
                                                  fit: BoxFit.cover,
                                                  height: 300.00,
                                                  width: 300.0,
                                                ),
                                              ),
                                            )
                                          ),
                                        );
                                      }));
                                },
                                child: Hero(
                                  tag: "image_$index",
                                  child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    elevation: 5.0,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        Image.asset("assets/imgs/${itemData[index]}.jpg",fit: BoxFit.fill),
                                      ],
                                    ),
                                  ),
                                ),
                            )
                        ),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text("Title $index",style: TextStyle(fontSize: 16.0),),
                                  Text("Title Description $index Title Description $index Title Description $index Title Description $index Title Description $index Title Description $index",style: TextStyle(fontSize: 13.0),),
                                ],
                              ),
                          )
                    ),

                    ],
                  )
                );
              },
              childCount: itemData.length
            ),
          )
        ],
      )
    );
  }
}