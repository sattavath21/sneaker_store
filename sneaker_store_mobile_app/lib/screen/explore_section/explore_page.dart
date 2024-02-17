import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
//===> class: ExplorePage
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/component/product_overview.dart';
import 'package:sneaker_store_mobile_app/model/brand.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/filter_brand_page.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/product_detail_page.dart';
import 'package:sneaker_store_mobile_app/screen/home_section/filter_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';
import 'package:sneaker_store_mobile_app/utils/route_util.dart';

class ExplorePage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://d2cva83hdk3bwc.cloudfront.net/nike-dunk-low-retro-white-black--2021--1.jpg',
        'https://d2cva83hdk3bwc.cloudfront.net/gucci-espadrille-in-gg-canvas-black-1.jpg',

    'https://d2cva83hdk3bwc.cloudfront.net/jordan-1-high-og-spider-man-across-the-spider-verse-1.jpg',
    'https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-1.jpg',
    'https://d2cva83hdk3bwc.cloudfront.net/celine-tippi-slides-in-shearling-and-calfskin-tan-natural--w--1.jpg',
    'https://d2cva83hdk3bwc.cloudfront.net/chanel-trainer-sneakers-in-fabric-and-suede-calfskin-light-grey-1.jpg',
    'https://d2cva83hdk3bwc.cloudfront.net/salomon-xt-6-black-falcon-1.jpg',
    'https://d2cva83hdk3bwc.cloudfront.net/louis-vuitton-lv-trainer-sneaker-black-1.jpg',
    // Add more image URLs as needed
  ];
  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    //place this ref inside build()
    var store1 = Provider.of<CentralStore>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            children: List.generate(
              8,
              (index) {
                Brand brand = store1.brandList[index];

                return GestureDetector(
                  onTap: () {
                    // Navigate to another page with details about the selected collection
                    Navigator.push(
                      context,
                      RouteUtil.routeSlideTransition(FilterBrandPage(
                          selectedName: brand.brandName,
                        ), false)
                   
                    );
                    
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      children: [
                        // Display collection image (you may need to update this)
                        Image.network(
                          imageUrls[index],
                          height: 70,
                          width: 70,
                          fit: BoxFit.contain,
                        ),

                        // Display collection name
                        Text(
                          brand.brandName,
                          style: app_text_style.latoStyle(),
                        ),
                        SizedBox(
                          height: 18,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    16.0), // Adjust the left and right padding as needed
            child: Divider(
              color: Colors.black, // Set the color of the line (optional)
              thickness: 0.1, // Set the thickness of the line (optional)
              height: 20, // Set the height of the line (optional)
              endIndent:
                  16.0, // Set the endIndent to control the space on the right (optional)
            ),
          ),
          RichText(
            
            text: TextSpan(
              style: app_text_style.latoStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10, // Adjust the font size
                                    ),
    children: <TextSpan>[
      TextSpan(text: "${store1.productLists.length} "),
      TextSpan(text: 'Results'.tr()),
    ],
  ), ),
        
          FilterButton(),
          
          Wrap(
            children: List.generate(
              store1.productLists.length,
              (index) {
                Product product = store1.productLists[index];
                return ProductOverview(product:product);

              },
            ),
          ),
        ],
      ),
    );
  } //ef
} //ec

class FilterButton extends StatefulWidget {
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  Map<String, List<String>> filterOptions = {
    'Sort By': [
      'Latest Listing',
      'Just Dropped',
      'Most Popular',
      'Price Low To High',
      'Price High To Low',
      'Must Have',
      'Recently Sold'
    ],
    'Brand': ['Brand1', 'Brand2', 'Brand3'],
    'Collection': ['Collection1', 'Collection2', 'Collection3'],
    'Gender Size': ['Men', 'Women', 'Kids'],
    'Condition': ['New', 'Used'],
    'Type': ['Type1', 'Type2', 'Type3'],
    'Size': ['Size1', 'Size2', 'Size3'],
    'Price': ['Price1', 'Price2', 'Price3'],
  };

  Map<String, Set<String>> selectedSubOptions = {};

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showFilterOptions(context),
      child: const Icon(
        Icons.tune,
        color: Colors.grey,
      ),
    );
  }

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filter Options',
                style: app_text_style.latoStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              for (var entry in filterOptions.entries)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        entry.key,
                        style: app_text_style.latoStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        // Handle main option selection
                        _handleMainOptionSelection(
                            context, entry.key, entry.value);
                      },
                      // subtitle: _buildSubtitle(entry.key), // Show subtitle here
                    ),
                    SizedBox(height: 6),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Clear selected filters
                        _clearFilters();
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size.fromHeight(
                                50)), // Adjust the height of the "Clear" button
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            return Colors
                                .white; // Set the background color for the "Clear" button
                          },
                        ),
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            return Colors
                                .black; // Set the text color for the "Clear" button
                          },
                        ),
                        side: MaterialStateProperty.resolveWith<BorderSide>(
                          (Set<MaterialState> states) {
                            return BorderSide(
                                color: Colors
                                    .black); // Set the border color for the "Clear" button
                          },
                        ),
                      ),
                      child: Text('Clear'.tr()),
                    ),
                  ),
                  SizedBox(width: 16), // Adjust the spacing between buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Apply filters and show results
                        _applyFilters(context);
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(
                            50)), // Adjust the height of the "Show Results" button
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            return Colors
                                .black; // Set the background color for the "Show Results" button
                          },
                        ),
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            return Colors
                                .white; // Set the text color for the "Show Results" button
                          },
                        ),
                      ),
                      child: Text('Show Results'.tr()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  
// Widget _buildSubtitle(String mainOption) {
//     if (selectedSubOptions.containsKey(mainOption) &&
//         selectedSubOptions[mainOption]!.isNotEmpty) {
//       return Text(
//         'Selected: ${selectedSubOptions[mainOption]!.join(', ')}',
//         style: app_text_style.latoStyle(
//           fontWeight: FontWeight.normal,
//           fontSize: 12,
//           color: Colors.grey,
//         ),
//       );
//     } else {
//       return Container(); // If no sub-options are selected, display an empty container
//     }
//   }
  void _handleMainOptionSelection(
      BuildContext context, String mainOption, List<String> subOptions) {
    if (mainOption == 'Sort By' || mainOption == 'Price') {
      // For "Sort By" and "Price," only allow single selection
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubOptionSelectionPage(
            mainOption: mainOption,
            subOptions: subOptions,
            selectedSubOptions: selectedSubOptions[mainOption] ?? {},
            onSubOptionSelected: (Set<String> selectedSubOptions) {
              // Update selected sub-options
              setState(() {
                this.selectedSubOptions[mainOption] = selectedSubOptions;
              });
            },
          ),
        ),
      );
    } else {
      // For other options, allow multiple selections
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubOptionSelectionPage(
            mainOption: mainOption,
            subOptions: subOptions,
            selectedSubOptions: selectedSubOptions[mainOption] ?? {},
            onSubOptionSelected: (Set<String> selectedSubOptions) {
              // Update selected sub-options
              setState(() {
                this.selectedSubOptions[mainOption] = selectedSubOptions;
              });
            },
          ),
        ),
      );
    }
  }

  void _clearFilters() {
    setState(() {
      selectedSubOptions.clear();
    });
  }

  void _applyFilters(BuildContext context) {
    // Implement logic to apply filters and show results
    print('Selected Filters: $selectedSubOptions');
    Navigator.pop(context); // Close the filter options modal
  }
  
}

class SubOptionSelectionPage extends StatefulWidget {
  final String mainOption;
  final List<String> subOptions;
  final Set<String> selectedSubOptions;
  final Function(Set<String>) onSubOptionSelected;

  SubOptionSelectionPage({
    required this.mainOption,
    required this.subOptions,
    required this.selectedSubOptions,
    required this.onSubOptionSelected,
  });

  @override
  _SubOptionSelectionPageState createState() => _SubOptionSelectionPageState();
}

class _SubOptionSelectionPageState extends State<SubOptionSelectionPage> {
  Set<String> _selectedSubOptions = Set<String>();

  @override
  void initState() {
    super.initState();
    _selectedSubOptions.addAll(widget.selectedSubOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mainOption),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (String subOption in widget.subOptions)
              ListTile(
                title: Text(
                  subOption,
                  style: app_text_style.latoStyle(
                    fontWeight: _selectedSubOptions.contains(subOption)
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  // Handle sub-option selection
                  _handleSubOptionSelection(subOption);
                },
              ),
            ElevatedButton(
              onPressed: () {
                // Apply selected sub-options
                widget.onSubOptionSelected(_selectedSubOptions);
                Navigator.pop(context);
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
  
  // Widget _buildSubtitle() {
  //   if (_selectedSubOptions.isNotEmpty) {
  //     return Text(
  //       'Selected: ${_selectedSubOptions.join(', ')}',
  //       style: app_text_style.latoStyle(
  //         fontWeight: FontWeight.normal,
  //         fontSize: 12,
  //         color: Colors.grey,
  //       ),
  //     );
  //   } else {
  //     return Container(); // If no sub-options are selected, display an empty container
  //   }
  // }

  void _handleSubOptionSelection(String subOption) {
    setState(() {
      if (widget.mainOption == 'Sort By' || widget.mainOption == 'Price') {
        // For "Sort By" and "Price," only allow single selection
        _selectedSubOptions.clear();
        _selectedSubOptions.add(subOption);
      } else {
        // For other options, allow multiple selections
        if (_selectedSubOptions.contains(subOption)) {
          _selectedSubOptions.remove(subOption);
        } else {
          _selectedSubOptions.add(subOption);
        }
      }
    });
  }
}

