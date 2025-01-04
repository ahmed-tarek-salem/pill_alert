import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_constants.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_images.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';
import 'package:pill_alert/src/core/widgets/medicine_tile.dart';
import 'package:pill_alert/src/features/home/presentation/ui/home_screen.dart';

import '../../../../../generated/l10n.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  late final List<MedicineModel> searchList;

  @override
  void initState() {
    searchController.addListener(() {
      searchList = getLocalizedMedicines(context)
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
  void didChangeDependencies() {
    searchList = getLocalizedMedicines(context);
    super.didChangeDependencies();
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
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.search),
                            hintText: S.of(context).search,
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            )),
                      ),
                      Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              itemBuilder: (context, index) {
                                final medicine = searchList[index];
                                return MedicineTile(
                                    medicine: medicine, times: const []);
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
