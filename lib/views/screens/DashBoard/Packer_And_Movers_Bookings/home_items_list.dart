import 'package:flutter/material.dart';

class HomeItemsList extends StatefulWidget {
  const HomeItemsList({super.key});

  @override
  State<HomeItemsList> createState() => _HomeItemsListState();
}

class _HomeItemsListState extends State<HomeItemsList> {
  final Map<String, Map<String, List<Map<String, dynamic>>>> applianceData = {
    'Living Room': {
      'Chair': [
        {'name': 'Plastic/Folding Chair', 'count': 0},
        {'name': 'Dining Table Chair', 'count': 0},
      ],
      'Table': [
        {'name': 'Canter Table', 'count': 0},
        {'name': 'Dining Table', 'count': 0},
        {'name': 'Coffee Table', 'count': 0},
      ],
      'T.V': [
        {'name': 'Small T.V', 'count': 0},
        {'name': 'Big T.V', 'count': 0},
      ],
      'Sofa': [
        {'name': 'Corner Sofa', 'count': 0},
        {'name': 'Recliner', 'count': 0},
      ],
      'Shoe Rack': [
        {'name': 'Corner Sofa', 'count': 0},
        {'name': 'Recliner', 'count': 0},
      ],
    },
    'Bed Room': {
      'Wardrobe/Almirah': [
        {'name': 'Single Wardrobe', 'count': 0},
        {'name': 'Double Wardrobe', 'count': 0},
      ],
      'Mattress': [
        {'name': 'King Size', 'count': 0},
        {'name': 'Queen Size', 'count': 0},
        {'name': 'Single', 'count': 0},
      ],
      'PC Tables': [
        {'name': 'Small PC Table', 'count': 0},
        {'name': 'Large PC Table', 'count': 0},
      ],
      'AC / Cooler / Fan': [
        {'name': 'AC', 'count': 0},
        {'name': 'Cooler', 'count': 0},
        {'name': 'Fan', 'count': 0},
      ],
    },
    'Kitchen': {
      'Fridge': [
        {'name': 'Single Door', 'count': 0},
        {'name': 'Double Door', 'count': 0},
        {'name': 'Mini Fridge', 'count': 0},
      ],
      'Electric Appliances': [
        {'name': 'Mixer', 'count': 0},
        {'name': 'Grinder', 'count': 0},
        {'name': 'Juicer', 'count': 0},
      ],
      'Water Purifiers': [
        {'name': 'RO', 'count': 0},
        {'name': 'UV', 'count': 0},
        {'name': 'UV+RO', 'count': 0},
      ],
      'Stainless Steel Vessels': [
        {'name': 'Pots', 'count': 0},
        {'name': 'Pans', 'count': 0},
        {'name': 'Bowls', 'count': 0},
      ],
      'Mandir / Devotional Items': [
        {'name': 'Idols', 'count': 0},
        {'name': 'Pooja Thali', 'count': 0},
        {'name': 'Incense Sticks', 'count': 0},
      ],
    },
    'Others': {
      'Plants': [
        {'name': 'Indoor Plants', 'count': 0},
        {'name': 'Outdoor Plants', 'count': 0},
      ],
      'Cycles': [
        {'name': 'Mountain Bike', 'count': 0},
        {'name': 'Road Bike', 'count': 0},
        {'name': 'Hybrid Bike', 'count': 0},
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, size: 30),
          color: Colors.black,
        ),
        title: Text(
          "Home Items List",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...applianceData.keys.map((section) {
                  return SectionDropdown(
                    sectionName: section,
                    categories: applianceData[section]!,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionDropdown extends StatelessWidget {
  final String sectionName;
  final Map<String, List<Map<String, dynamic>>> categories;

  SectionDropdown({
    required this.sectionName,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Text(
            sectionName,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        ...categories.keys.map((category) {
          return CategoryDropdown(
            categoryName: category,
            subCategories: categories[category]!,
            sectionName: sectionName,
          );
        }).toList(),
      ],
    );
  }
}

class CategoryDropdown extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> subCategories;
  final String sectionName;

  CategoryDropdown({
    required this.categoryName,
    required this.subCategories,
    required this.sectionName,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: ExpansionTile(
        iconColor: Colors.grey,
        shape: Border(),
        title: Text(
          categoryName,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        children: subCategories.map((subCategoryData) {
          String subCategory = subCategoryData['name'];
          int count = subCategoryData['count'];
          return Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subCategory,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                ),
                Text(
                  count.toString(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
