import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchInputController = TextEditingController();
  final _adsPageController = PageController();
  int _currentAdIndex = 0;
  int _currentBottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _buildBodyContent(),
    );
  }

  _buildBodyContent() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          _buildHeader(),
          _buildAds(),
          _buildMaterialContent(),
        ]),
      ),
    );
  }

  _buildHeader() {
    return Column(
      children: [
        const SizedBox(height: 30),
        Center(
          child: Image.asset(
            'assets/icons/logo_colored.png',
            width: 40,
            height: 40,
          ),
        ),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/icons/mark.png', width: 20, height: 20),
          const SizedBox(width: 8),
          Text('Dhaka, Banassre',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ]),
        _buildSearch(),
      ],
    );
  }

  _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(16),
        child: TextField(
            controller: _searchInputController,
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Search store',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                prefixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Image.asset(
                    'assets/icons/search.png',
                    height: 20,
                    width: 20,
                  ),
                ))),
      ),
    );
  }

  _buildAds() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AspectRatio(
        aspectRatio: 16 / 5,
        child: Stack(
          children: [
            PageView(
                controller: _adsPageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentAdIndex = index;
                  });
                },
                children: [
                  _buildAdItem(),
                  _buildAdItem(),
                  _buildAdItem(),
                ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildAdsIndicator(),
            )
          ],
        ),
      ),
    );
  }

  _buildAdItem() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        'assets/images/banner.png',
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }

  _buildAdsIndicator() {
    return DotsIndicator(
      dotsCount: 3,
      decorator: DotsDecorator(
          spacing: const EdgeInsets.all(6),
          activeSize: const Size(16, 6),
          size: const Size(6, 6),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      position: _currentAdIndex.toDouble(),
    );
  }

  _buildExclusiveOfferMaterials() {
    return Column(
      children: [
        _buildMaterialsTitle(title: 'Exclusive Offer', onPressShowAll: () {}),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List<Widget>.generate(4, (index) {
            return _buildMaterial(index: index, onAddPressed: () {});
          })),
        )
      ],
    );
  }

  _buildBestSellingMaterials() {
    return Column(
      children: [
        _buildMaterialsTitle(title: 'Best selling', onPressShowAll: () {}),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List<Widget>.generate(4, (index) {
            return _buildMaterial(index: index, onAddPressed: () {});
          }).reversed.toList()),
        )
      ],
    );
  }

  _buildMaterialsTitle(
      {required String title, required Function onPressShowAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        Text('See all',
            style:
                TextStyle(fontSize: 14, color: Theme.of(context).primaryColor)),
      ],
    );
  }

  _buildMaterial({required int index, required VoidCallback onAddPressed}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        height: 280,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Image.asset(
                        'assets/materials/$index.png',
                        width: double.infinity,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Material name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('7pcs, 1kg',
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('4.99\$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        InkResponse(
                          onTap: onAddPressed,
                          child: Material(
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).primaryColor,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMaterialContent() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _buildExclusiveOfferMaterials(),
          const SizedBox(height: 24),
          _buildBestSellingMaterials(),
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Material(
      borderRadius: bottomNavigationBarBorder,
      elevation: 16,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          elevation: 0,
            currentIndex: _currentBottomNavigationIndex,
            onTap: (int index) {
              setState(() {
                _currentBottomNavigationIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/home.png'),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/explorer.png'),
                  ),
                  label: 'Explorer'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/cart.png'),
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/favorite.png'),
                  ),
                  label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/icons/profile.png'),
                  ),
                  label: 'profile'),
            ]),
      ),
    );
  }
}
