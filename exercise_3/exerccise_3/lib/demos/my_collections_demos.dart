import 'package:flutter/material.dart';

class MyCollectionsDemosView extends StatefulWidget {
  const MyCollectionsDemosView({super.key});

  @override
  State<MyCollectionsDemosView> createState() => _MyCollectionsDemosViewState();
}

class _MyCollectionsDemosViewState extends State<MyCollectionsDemosView> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        padding: PaddingUtility().paddingHorizontal,
        itemBuilder: (context, index) {
          return _CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    super.key,
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: Padding(
        padding: PaddingUtility().paddingGeneral,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: RadiusUitlity().radiusCircularMin,
              child: Image.asset(
                _model.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: PaddingUtility().paddingTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_model.title),
                  Text('${_model.price} ETH'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(
      {required this.imagePath, required this.title, required this.price});
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstract Art',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstract Art2',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstract Art3',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstract Art4',
          price: 3.4)
    ];
  }
}

class ProjectImages{
static const imageCollection =  'assets/png/hoays_pic.png';
}

class PaddingUtility {
  final paddingTop = const EdgeInsets.only(top: 10);
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingGeneral = const EdgeInsets.all(20);
  final paddingHorizontal = const EdgeInsets.symmetric(horizontal: 10);
}

class RadiusUitlity {
  final radiusCircularMin = BorderRadius.circular(10);
}
