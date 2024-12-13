import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_constants.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_images.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';
import 'package:pill_alert/src/core/widgets/medicine_tile.dart';
import 'package:pill_alert/src/features/home/presentation/ui/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  List<MedicineModel> searchList = medicines;

  @override
  void initState() {
    searchController.addListener(() {
      searchList = medicines
          .where((medicine) =>
              medicine.name
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()) ||
              medicine.similars
                  .toString()
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
          .toList();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.searchBackground,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.horizontalPadding),
                  child: Column(
                    children: [
                      TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search",
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            )),
                      ),
                      Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.only(top: 18),
                              itemBuilder: (context, index) {
                                final medicine = searchList[index];
                                return MedicineTile(medicine: medicine);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 30),
                              itemCount: searchList.length))
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
