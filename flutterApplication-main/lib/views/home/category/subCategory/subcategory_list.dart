import 'package:flutter/material.dart';
import 'package:gehnamall/models/sub_categories_models.dart';
import 'package:gehnamall/views/home/category/product_card/product_list.dart';
import 'package:http/http.dart' as http;

class SubcategoryList extends StatefulWidget {
  final int categoryCode;
  final int? selectedGenderCode; // Changed to genderCode as int
  final void Function()? onTap;

  const SubcategoryList({
    Key? key,
    required this.categoryCode,
    this.selectedGenderCode,
    this.onTap,
  }) : super(key: key);

  @override
  _SubcategoryListState createState() => _SubcategoryListState();
}

class _SubcategoryListState extends State<SubcategoryList> {
  List<SubCategoryModels>? subcategories;
  bool isLoading = false;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchSubcategories();
  }

  Future<void> fetchSubcategories() async {
    setState(() => isLoading = true);
    try {
      String url =
          'https://api.gehnamall.com/api/subCategories/${widget.categoryCode}?wholeseller=BANSAL';
      if (widget.selectedGenderCode != null) {
        url +=
            '&genderCode=${widget.selectedGenderCode}'; // Adjusted query param
      }
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final fetchedSubcategories = subCategoryModelsFromJson(response.body);
        if (widget.selectedGenderCode != null) {
          subcategories = fetchedSubcategories
              .where((subcategory) =>
                  subcategory.genderCode == widget.selectedGenderCode)
              .toList();
        } else {
          subcategories = fetchedSubcategories;
        }
      } else {
        error = 'Failed to fetch subcategories: ${response.statusCode}';
      }
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(
        child: Text(
          error!,
          style: const TextStyle(fontSize: 18.0, color: Colors.red),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (subcategories == null || subcategories!.isEmpty) {
      return const Center(
        child: Text(
          'No Subcategories Found',
          style: TextStyle(fontSize: 18.0),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: subcategories!.length,
          itemBuilder: (context, index) {
            final subcategory = subcategories![index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductList(
                      categoryCode:
                          widget.categoryCode, // Pass the category code
                      subCategoryCode: subcategory.subcategoryCode,
                      subCategoryName: subcategory.subcategoryName,
                      // Passing the name
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      subcategory.exfield1 != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                subcategory.exfield1!,
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(Icons.image, size: 80.0),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subcategory.subcategoryName,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
