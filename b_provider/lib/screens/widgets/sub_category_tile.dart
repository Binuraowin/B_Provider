import 'package:flutter/material.dart';

class SubCategoryTile extends StatelessWidget {
  final String imageUrl;
  final String subCategoryName;
  // final String id;

  const SubCategoryTile({Key key, this.imageUrl, this.subCategoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: InkWell(
          onTap: (){

//          Navigator.push(context,
//            MaterialPageRoute(
//                builder:(context) =>SubCategoryPage(id: id,)
//            ),);

            //     Navigator.push(context,
            //     MaterialPageRoute(
            // builder:(context) => Details(
            //     name:brew.name,sugars:brew.strength,strength:brew.strength
            // )
            //  ),);
            // Navigator.pushNamed(context, '/');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Image.network(imageUrl),

                        height: 75.0,
                        width: 75.0,
                      ),


                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            subCategoryName,
                            style: TextStyle(
                                fontFamily: 'Monteserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            ),
                          )

                        ],
                      )
                    ],

                  )
              ),
              IconButton(
                icon: Icon(Icons.send),
                color: Colors.black,
                onPressed: (){

                },
              )
            ],
          ),

//          child: Column(
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
////                    _postHeader(clubImage: clubImage,clubName: clubName,),
////                    const SizedBox(height: 4.0,),
//                    Text(subCategoryName),
//                    imageUrl != null ? const SizedBox.shrink() : const SizedBox(height: 6.0,)
//
//                  ],
//                ),
//              ),
//              imageUrl != null ?
//              Padding(
//                padding: const EdgeInsets.symmetric(vertical: 8.0),
//                child: Image.network(imageUrl),
//                // CachedNetworkImage(imageUrl: post.imageUrl),
//              )
//
//                  : const SizedBox.shrink(),
//              Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
////                child: _postStats(clubName: clubName,),
//              )
//            ],
//          )

//          Navigator.push(context,
//            MaterialPageRoute(
//                builder:(context) => SubCategory(id: id,)
//            ),);

          //     Navigator.push(context,
          //     MaterialPageRoute(
          // builder:(context) => Details(
          //     name:brew.name,sugars:brew.strength,strength:brew.strength
          // )
          //  ),);
          // Navigator.pushNamed(context, '/');
        )
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Container(
//                child: Row(
//                  children: <Widget>[
//
//                    Hero(tag: imageUrl,
//                        child: Image.network(imageUrl,
//                          fit: BoxFit.cover,
//                          height: 75.0,
//                          width: 75.0,
//                        )
//
//
//                    ),
//
//                    SizedBox(width: 10.0),
//                    Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text(
//                          subCategoryName,
//                          style: TextStyle(
//                              fontFamily: 'Monteserrat',
//                              fontSize: 17.0,
//                              fontWeight: FontWeight.bold
//                          ),
//                        )
//
//                      ],
//                    )
//                  ],
//
//                )
//            ),
//            IconButton(
//              icon: Icon(Icons.send),
//              color: Colors.black,
//              onPressed: (){
//
//              },
//            )
//          ],
//        ),

    );
//      Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
//
//    );
  }
}
