import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarouselAppBarExample(),
    );
  }
}

class CarouselAppBarExample extends StatelessWidget {
  const CarouselAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverPersistentHeader for the "Avatarro" text and "PRO" button
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight:
                    screenWidth > 600 ? screenWidth * 0.07 : screenWidth * 0.07,
                maxHeight:
                    screenWidth > 600 ? screenWidth * 0.07 : screenWidth * 0.07,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Avatarro",
                        style: TextStyle(
                          fontSize: screenWidth > 600
                              ? screenWidth * 0.035
                              : screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.purple],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.04),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth > 600
                              ? screenWidth * 0.04
                              : screenWidth * 0.04,
                          // vertical: screenHeight * 0.01,
                        ),
                        child: Center(
                          child: Text(
                            'PRO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth > 600
                                  ? screenWidth * 0.02
                                  : screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
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
              pinned: false,
              delegate: _SliverAppBarDelegate(
                minHeight: 0.0,
                maxHeight: screenHeight * 0.3,
                child: PageView(
                  children: <Widget>[
                    buildCarouselItem(
                        'assets/image_1.png',
                        screenWidth,
                        screenHeight),
                    buildCarouselItem(
                        'assets/image_2.png',
                        screenWidth,
                        screenHeight),
                    buildCarouselItem(
                        'assets/image_3.png',
                        screenWidth,
                        screenHeight),
                    buildCarouselItem(
                        'assets/image_1.png',
                        screenWidth,
                        screenHeight),
                  ],
                ),
              ),
            ),

            // SliverPersistentHeader for "Most popular AI filters" text
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: screenWidth>600? screenHeight * 0.1: screenHeight * 0.12,
                maxHeight: screenWidth>600? screenHeight * 0.1: screenHeight * 0.12,
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most popular AI filters',
                            style: TextStyle(
                              fontSize: screenWidth > 600
                                  ? screenWidth * 0.03
                                  : screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search,
                                color: Colors.white,
                                size: screenWidth > 600
                                    ? screenWidth * 0.04
                                    : screenWidth * 0.06),
                          ),
                        ],
                      ),
                      screenWidth>600? SizedBox(
                          height:
                              screenHeight * 0.01):const SizedBox.shrink(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            buildFilterButton('All', screenWidth),
                            buildFilterButton('Women fashion', screenWidth),
                            buildFilterButton('Sexy', screenWidth),
                            buildFilterButton('Superhero', screenWidth),
                            buildFilterButton('Fashion', screenWidth),
                            buildFilterButton('3D', screenWidth),
                            buildFilterButton('Superhero', screenWidth),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: ResponsiveRowsView(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                child: Icon(Icons.home,
                    size: screenWidth>600? screenWidth * 0.05:screenWidth*0.07, color: Colors.white)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
              child: Icon(Icons.camera,
                  size: screenWidth>600? screenWidth * 0.07:screenWidth*0.1, color: Colors.white),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,
                size: screenWidth>600? screenWidth * 0.05:screenWidth*0.07, color: Colors.white),
            label: '',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFF8E6EFF),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget buildCarouselItem(
      String imageUrl, double screenWidth, double screenHeight) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: screenHeight * 0.3, // Adjust height based on screen size
              width: screenWidth * 0.9,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            child: Container(color: Colors.transparent,
            padding: EdgeInsets.only(left: 10,right: 10),
            width: screenWidth *0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Text("AI Avatars",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth > 600
                  ? screenWidth * 0.02
                  : screenWidth *
                      0.04, // Adjust text size based on screen width
            ),),
              CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text("Try", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth > 600
                    ? screenWidth * 0.02
                    : screenWidth *
                        0.04, // Adjust text size based on screen width
                            ),),
              )
                        ],),
            ))
        ],
      ),
    );
  }

  Widget buildFilterButton(String label, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.03),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenWidth * 0.02,
          ),
        ),
      ),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height:
                screenWidth > 600 ? screenHeight * 0.3 : screenHeight * 0.18,
            width: screenWidth * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10), // Space between image and text
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth > 600
                  ? screenWidth * 0.02
                  : screenWidth *
                      0.04, // Adjust text size based on screen width
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
        ],
      ),
    );
  }
}

// class ResponsiveGridView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         int crossAxisCount;
//         if (constraints.maxWidth > 600) {
//           crossAxisCount = 3; // Medium screens
//         } else {
//           crossAxisCount = 2; // Small screens
//         }

//         final screenWidth = MediaQuery.of(context).size.width;

//         return Padding(
//           padding: EdgeInsets.all(screenWidth * 0.04),
//           child: GridView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: crossAxisCount,
//               crossAxisSpacing: screenWidth * 0.04,
//               mainAxisSpacing: screenWidth * 0.04,
//               childAspectRatio:0.7
//             ),
//             itemCount: 9, // Number of items in the grid
//             itemBuilder: (context, index) {
//               return FilterItem(
//                 image: 'https://avatars.githubusercontent.com/u/103445587?v=4',
//                 title: 'Item $index',
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class ResponsiveRowsView extends StatelessWidget {
  ResponsiveRowsView({super.key});
  final List title = [
    'Doctor Superhero',
    'Bed Purple SuperHero',
    'Pool SuperHero',
    'Hammer SuperHero',
    'Doctor Superhero',
    'Bed Purple SuperHero',
    'Pool SuperHero',
    'Hammer SuperHero',
    'Hammer SuperHero',
    'Doctor Superhero',
    'Bed Purple SuperHero',
    'Pool SuperHero',
    'Hammer SuperHero',
    'Doctor Superhero',
    'Bed Purple SuperHero',
    'Pool SuperHero',
    'Hammer SuperHero',
    'Pool SuperHero'
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isWideScreen = constraints.maxWidth > 600;
        final itemsPerRow = isWideScreen ? 3 : 2;

        // Creating a list of items
        final items = List.generate(
            18,
            (index) => FilterItem(
                  image:
                      'assets/image_3.png',
                  title: title[index],
                ));

        // Splitting items into rows
        List<Widget> rows = [];
        for (int i = 0; i < items.length; i += itemsPerRow) {
          rows.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items
                  .sublist(
                      i,
                      (i + itemsPerRow) > items.length
                          ? items.length
                          : (i + itemsPerRow))
                  .map((item) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02),
                          child: item,
                        ),
                      ))
                  .toList(),
            ),
          );

          // Add a special row after every 3 rows of items
          if ((i + itemsPerRow) % (itemsPerRow * 3) == 0) {
            rows.add(
              Container(
                // color: Colors.black,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.01,
                    horizontal: screenWidth * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.diamond,
                          color: Colors.white,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Upgrade to pro',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth > 600
                                    ? screenWidth * 0.02
                                    : screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'No ads and best image quality',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth > 600
                                    ? screenWidth * 0.02
                                    : screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: screenWidth > 600
                          ? screenWidth * 0.035
                          : screenWidth * 0.05,
                      child: CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: screenWidth > 600
                            ? screenWidth * 0.033
                            : screenWidth * 0.048,
                        child: CircleAvatar(
                          // borderRadius: BorderRadius.circular(20),
                          backgroundColor: Colors.white,
                          radius: screenWidth > 600
                              ? screenWidth * 0.03
                              : screenWidth * 0.045,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "GO",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: screenWidth > 600
                                      ? screenWidth * 0.017
                                      : screenWidth * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ),
                    )

                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Text('Button'),
                    //   style: ElevatedButton.styleFrom(
                    //     foregroundColor: Colors.white,
                    //     backgroundColor: Colors.blue,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius:
                    //           BorderRadius.circular(screenWidth * 0.04),
                    //     ),
                    //     padding: EdgeInsets.symmetric(
                    //       horizontal: screenWidth * 0.04,
                    //       vertical: screenWidth * 0.02,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }
        }

        return Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rows,
          ),
        );
      },
    );
  }
}
