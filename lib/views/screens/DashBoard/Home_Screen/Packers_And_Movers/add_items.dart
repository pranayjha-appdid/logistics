import 'package:flutter/material.dart';
import 'package:logistics/services/theme.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
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

  void updateCount(
      String section, String category, String subCategory, int change) {
    setState(() {
      final categoryList = applianceData[section]?[category];
      if (categoryList != null) {
        final subCategoryData =
            categoryList.firstWhere((item) => item['name'] == subCategory);
        subCategoryData['count'] =
            (subCategoryData['count']! + change).clamp(0, 99);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffE7FBFF),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Free Home Inspection",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "If you don't want to fill this details.",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Call Now",
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ...applianceData.keys.map((section) {
            return SectionDropdown(
              sectionName: section,
              categories: applianceData[section]!,
              updateCount: updateCount,
            );
          }).toList(),
        ],
      ),
    );
  }
}

class SectionDropdown extends StatelessWidget {
  final String sectionName;
  final Map<String, List<Map<String, dynamic>>> categories;
  final Function updateCount;

  SectionDropdown({
    required this.sectionName,
    required this.categories,
    required this.updateCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            color: primaryColor,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Text(
            sectionName,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white, fontSize: 14),
          ),
        ),
        ...categories.keys.map((category) {
          return CategoryDropdown(
            categoryName: category,
            subCategories: categories[category]!,
            updateCount: updateCount,
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
  final Function updateCount;
  final String sectionName;

  CategoryDropdown({
    required this.categoryName,
    required this.subCategories,
    required this.updateCount,
    required this.sectionName,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: Border(),
      title: Text(
        categoryName,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      children: subCategories.map((subCategoryData) {
        String subCategory = subCategoryData['name'];
        int count = subCategoryData['count'];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subCategory,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 13,
                    ),
              ),
              SizedBox(
                width: 105,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => updateCount(
                          sectionName, categoryName, subCategory, -1),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: primaryColor,
                        ),
                        width: 30,
                        height: 30,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        count.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => updateCount(
                          sectionName, categoryName, subCategory, 1),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: primaryColor,
                        ),
                        width: 30,
                        height: 30,
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
