import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../model/food.dart';
import '../model/resturant.dart';

class DetailScreen extends StatefulWidget {
  final Restaurant restaurant;
  DetailScreen({required this.restaurant});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.restaurant.name),
              background: Hero(
                tag: widget.restaurant.id,
                child: CachedNetworkImage(
                  imageUrl: widget.restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.restaurant.name,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Container(
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Text(
                                widget.restaurant.rating.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.grey,
                          ),
                          Text(widget.restaurant.city,
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                      Text(widget.restaurant.description),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(4),
            sliver: SliverToBoxAdapter(
                child: Text(
              'Foods',
              style: Theme.of(context).textTheme.headline6,
            )),
          ),
          menuList(widget.restaurant.menus.foods),
          SliverPadding(
            padding: EdgeInsets.all(4),
            sliver: SliverToBoxAdapter(
                child: Text(
              'Drinks',
              style: Theme.of(context).textTheme.headline6,
            )),
          ),
          menuList(widget.restaurant.menus.drinks),
        ],
      ),
    );
  }

  menuList(List<dynamic> menus) {
    return SliverPadding(
      padding: EdgeInsets.all(4),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: menus.map((e) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.center,
                          image: (e.runtimeType == Food)
                              ? AssetImage('lib/media/images/food.jpeg')
                              : AssetImage('lib/media/images/drink.jpeg'))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(e.name),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
