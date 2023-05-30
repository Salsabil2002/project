import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screens/AddProuduct.dart';
import '../contstanse.dart';
import '../databaseProvider.dart';
import '../product.dart';



class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(child:Icon(Icons.add) ,onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return NewProduct();
        }));
      },),
      // bottom: false,
      body: Consumer<DbController>(
        builder: (context, provider, x) {
    return provider.product == null
    ? SizedBox()
        :


    Column(
    children: [
    SizedBox(height: kDefaultPadding/2),
    Expanded(
    child: Stack(
    children: [
    Container(
    margin: EdgeInsets.only(top: 70.0),
    decoration: BoxDecoration(
    color: kBackgroundColor,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(40),
    topRight: Radius.circular(40),
    ),
    ),
    ),
    ListView.builder(
    itemCount:provider.product.length,
    itemBuilder: (context, index) => ProductCard( provider.product[index],


    ),
    ),
    ],
    ),
    ),
    ],
    );
    })

    );
  }
}

class ProductCard extends StatelessWidget {

  Product pr;
  ProductCard(this.pr);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      height: 190.0,


        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 166.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 25,
                      color: Colors.black12),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 70, 0, 0),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
                height: 70.0,
                width: 120.0,
                child: Image.asset('assets/pr1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: SizedBox(
                height: 136.0,
                // Because oure image is 200 width, then: width - 200
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text( pr.name??"",style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        pr.description??"",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Spacer(),
                    // Padding(
                    //   padding: const EdgeInsets.all(kDefaultPadding),
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(
                    //       horizontal: kDefaultPadding * 1.5, // 30 px padding
                    //       vertical: kDefaultPadding / 5, // 5 px padding
                    //     ),
                    //     decoration: BoxDecoration(
                    //       color: kSecondaryColor,
                    //       borderRadius: BorderRadius.circular(22),
                    //     ),
                    //     child: Text('السعر: \$'),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }
}