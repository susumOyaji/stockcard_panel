import 'package:flutter/material.dart';

void main() => runApp(MyApp());

enum SpecialContainerType { customers, products, revenue, statistics }
enum BottomNav { home, clock, notification, profile }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1a1830),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffb43af7),
                    Color(0xff6d2af7),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Hello Amazigh!",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://c10.patreonusercontent.com/3/eyJ3IjoyMDB9/patreon-media/p/campaign/2895569/4f7a92f58e6740438a5988189a0b8e3b/1.png?token-time=2145916800&token-hash=6OaOR40De5xhunONrhD2wHILZexccfkBPki238oHc8M%3D",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Today Sales",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "\$",
                          style: TextStyle(fontSize: 13.0, color: Colors.white),
                        ),
                        TextSpan(
                          text: "1395.21",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            "My Account",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            "Orders",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            "TRANSACTIONS",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    SpecialContainer(SpecialContainerType.customers),
                    SpecialContainer(SpecialContainerType.products),
                    SpecialContainer(SpecialContainerType.revenue),
                    SpecialContainer(SpecialContainerType.statistics),
                  ],
                ),
              ),
            ),
            Expanded(child: 
            SnackBarPage(),
            ),
            /*
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 11),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                   
                    
                    BottomNavigationItem(
                      type: BottomNav.home,
                      isActive: true,
                    ),
                    BottomNavigationItem(
                      type: BottomNav.clock,
                      isActive: false,
                    ),
                    BottomNavigationItem(
                      type: BottomNav.notification,
                      isActive: false,
                    ),
                    BottomNavigationItem(
                      type: BottomNav.profile,
                      isActive: false,
                    ),
                    
                  ],
                ),
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final type;
  final bool isActive;
  const BottomNavigationItem({Key key, this.type, this.isActive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (type) {
      case BottomNav.home:
        icon = Icons.home;
        break;
      case BottomNav.clock:
        icon = Icons.timelapse;
        break;
      case BottomNav.notification:
        icon = Icons.notifications;
        break;
      case BottomNav.profile:
        icon = Icons.person;
        break;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        gradient: isActive
            ? LinearGradient(
                colors: [
                  Color(0xffb43af7),
                  Color(0xff6d2af7),
                ],
              )
            : null,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class SpecialContainer extends StatelessWidget {
  final type;
  SpecialContainer(this.type);
  @override
  Widget build(BuildContext context) {
    String containerText, containerImage;
    Color color;
    switch (type) {
      case SpecialContainerType.customers:
        containerText = "Customers";
        containerImage = "assets/people.png";
        color = Colors.blue;
        break;
      case SpecialContainerType.products:
        containerText = "Products";
        containerImage = "assets/box.png";
        color = Colors.orange;
        break;
      case SpecialContainerType.revenue:
        containerText = "Revenue";
        containerImage = "assets/revenue.png";
        color = Colors.green;
        break;
      case SpecialContainerType.statistics:
        containerText = "Statistics";
        containerImage = "assets/statistics.png";
        color = Colors.redAccent;
        break;
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white24,
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  // backgroundImage: AssetImage(containerImage,),
                  child: Container(
                    width: 31,
                    height: 31,
                    child: Image.asset(containerImage,),
                  ),
                  backgroundColor: color,
                  radius: 25,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "$containerText",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        color: Color(0xff1f1f1f),//lightBlack,
        //duration: Duration(seconds: 3),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            
            IconButton(
              icon: CircleAvatar(
                backgroundColor: Colors.red,
                //backgroundImage: NetworkImage(
                //  "https://cdn.pixabay.com/photo/2019/12/23/08/15/alaska-4714097_960_720.jpg",
                //),
              ),
              onPressed: () {},
            )
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.apps),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*
      appBar: AppBar(
        backgroundColor:  Color(0xff1f1f1f),//lightBlack,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {},
          )
        ],
      ),*/
      body: Column(
        children: <Widget>[
          //HomeHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    //Navigator.push(
                    //  context,
                      //MaterialPageRoute(
                      //  builder: (context) => ProductScreen(id: i),
                      //),
                    //);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            //CircleAvatar(
                            //  backgroundColor: Colors.purple,
                            //  backgroundImage: NetworkImage(products[i].img),
                            //),
                            /*
                            SizedBox(width: 5.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    products[i].author,
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    products[i].location,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            */
                            /*
                            IconButton(
                              icon: Icon(Icons.more_vert, color: Colors.white),
                              onPressed: () {},
                            )
                            */
                          ],
                        ),
                        /*
                        SizedBox(
                          height: 15.0,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height / 3,
                            minWidth: double.infinity
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.network(
                              products[i].img,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          products[i].title,
                          style: Theme.of(context).textTheme.title.copyWith(
                                color: Colors.white.withOpacity(.85),
                              ),
                        ),
                        */
                        Row(
                          children: <Widget>[
                            /*
                            FlatButton.icon(
                              icon: Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                              label: Text(
                                "${products[i].comments}",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                            */
                            /*
                            FlatButton.icon(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              label: Text(
                                "${products[i].likes}",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                            */
                            /*
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                Icons.bookmark_border,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            )
                            */
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}





class Products {
  final String title, location, img, author;
  final int comments, likes;
  final double price;

  Products(
      {this.title,
      this.author,
      this.location,
      this.img,
      this.comments,
      this.likes,
      this.price});
}

List<Products> products = [
  
 
  
  Products(
    author: "Cybdom",
    comments: 10495,
    img:
        "https://cdn.pixabay.com/photo/2017/04/05/01/12/traveler-2203666_960_720.jpg",
    likes: 8340,
    location: "New York, United States",
    price: 1200,
    title: "Awesome Traveler Bag",
  ),
  Products(
    author: "Cybdom",
    comments: 10495,
    img:
        "https://cdn.pixabay.com/photo/2014/08/05/10/31/waiting-410328_960_720.jpg",
    likes: 8340,
    location: "New York, United States",
    price: 1200,
    title: "Another Awesome Thing",
  ),
  Products(
    author: "Cybdom",
    comments: 10495,
    img:
        "https://cdn.pixabay.com/photo/2015/03/26/09/41/tie-690084_960_720.jpg",
    likes: 8340,
    location: "New York, United States",
    price: 1200,
    title: "Awesome Shirt",
  ),
  Products(
    author: "Cybdom",
    comments: 10495,
    img:
        "https://cdn.pixabay.com/photo/2016/02/19/11/46/man-1209947_960_720.jpg",
    likes: 8340,
    location: "New York, United States",
    price: 1200,
    title: "Awesome Tux",
  ),
];
