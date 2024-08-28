import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarouselAppBarExample(),
    );
  }
}

class CarouselAppBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              // SliverPersistentHeader for the "Avatarro" text and "PRO" button
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 60.0,
                  maxHeight: 60.0,
                  child: Container(
                    color: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Avatarro",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("PRO"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // SliverAppBar with the carousel
              SliverPersistentHeader(
                // expandedHeight: 250.0,
                pinned: false,
                delegate: _SliverAppBarDelegate(
                  minHeight: 0.0,
                  maxHeight: 250.0,
                  child: PageView(
                    padEnds: true,
                    allowImplicitScrolling: true,
                    reverse: true,
                    // fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              'https://avatars.githubusercontent.com/u/103445587?v=4',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              'https://avatars.githubusercontent.com/u/103445587?v=4',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              'https://avatars.githubusercontent.com/u/103445587?v=4',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              'https://avatars.githubusercontent.com/u/103445587?v=4',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // SliverPersistentHeader for "Most popular Al filters" text
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 90.0,
                  maxHeight: 100.0,
                  child: Container(
                    color: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Most popular Al filters',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.search, color: Colors.white)
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('All'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Women fashion'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Sexy'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Superhero'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        children: <Widget>[
                          FilterItem(
                            image:
                                'https://avatars.githubusercontent.com/u/103445587?v=4',
                            title: 'Evening dress',
                          ),
                          FilterItem(
                            image:
                                'https://avatars.githubusercontent.com/u/103445587?v=4',
                            title: 'EU Vintage',
                          ),
                          FilterItem(
                            image:
                                'https://avatars.githubusercontent.com/u/103445587?v=4',
                            title: 'White vintage',
                          ),
                          FilterItem(
                            image:
                                'https://avatars.githubusercontent.com/u/103445587?v=4',
                            title: 'EU Vintage',
                          ),
                          FilterItem(
                            image:
                                'https://avatars.githubusercontent.com/u/103445587?v=4',
                            title: 'EU Vintage',
                          ),
                          FilterItem(
                            image:
                                'https://avatars.githubusercontent.com/u/103445587?v=4',
                            title: 'White vintage',
                          ),
                          FilterItem(
                            image:
                                'https://avatars.githubusercontent.com/u/103445587?v=4',
                            title: 'EU Vintage',
                          ),
                          FilterItem(
                            image:
                                'https://avatars.githubusercontent.com/u/103445587?v=4',
                            title: 'EU Vintage',
                          ),
                          FilterItem(
                            image:
                                'https://avatars.githubusercontent.com/u/103445587?v=3',
                            title: 'EU Vintage',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Material(
          elevation: 2,
          color: Colors.transparent,
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.camera,
                  size: 45,
                  color: Colors.white,
                ),
                Icon(
                  Icons.settings,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        )

        // BottomNavigationBar(
        //   backgroundColor: Colors.black,
        //   items: [

        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.home,
        //         size: 15,
        //       ),
        //       // label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.camera_alt, size: 35),
        //       // label: 'Camera',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.settings, size: 15),
        //       // label: 'Settings',
        //     ),
        //   ],
        //   currentIndex: 0,
        //   selectedItemColor: Color(0xFF8E6EFF),
        //   unselectedItemColor: Colors.grey,
        // ),

        );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class FilterItem extends StatelessWidget {
  final String image;
  final String title;

  FilterItem({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          // image: DecorationImage(
          //   image: NetworkImage(image),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ));
  }
}
