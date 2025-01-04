import 'package:flutter/material.dart';
import 'package:pill_alert/generated/l10n.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_constants.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';
import 'package:pill_alert/src/features/home/presentation/ux/saved_medicines_controller.dart';
import 'package:pill_alert/src/features/medicine/presentation/widgets/label_info_tile.dart';
import 'package:pill_alert/src/features/medicine/presentation/widgets/medicine_bottom_sheet.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MedicineScreen extends StatefulWidget {
  final MedicineModel medicine;
  const MedicineScreen({super.key, required this.medicine});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  final savedMedicinesController = SavedMedicinesController();
  YoutubePlayerController? _controller;

  @override
  void didChangeDependencies() {
    _controller = YoutubePlayerController(
        initialVideoId: widget.medicine.videoUrl!,
        flags: const YoutubePlayerFlags(autoPlay: false));
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          widget.medicine.name,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppConstants.borderRadius),
                  bottomRight: Radius.circular(AppConstants.borderRadius),
                )),
            padding: const EdgeInsets.symmetric(horizontal: 85),
            child: Image.asset(
              widget.medicine.image,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                LabelInfoTile(
                  label: S.of(context).similars,
                  info: widget.medicine.similars.join(", "),
                ),
                const SizedBox(height: 10),
                LabelInfoTile(
                  label: S.of(context).dose,
                  info: widget.medicine.dose,
                ),
                const SizedBox(height: 10),
                LabelInfoTile(
                  label: S.of(context).side_effects,
                  info: widget.medicine.sideEffects,
                ),
                const SizedBox(height: 10),
                LabelInfoTile(
                  label: S.of(context).tips,
                  info: widget.medicine.tips,
                ),
                if (widget.medicine.videoUrl != null) ...[
                  const SizedBox(height: 10),
                  LabelInfoTile(
                    label: S.of(context).educational_video,
                    info: null,
                  ),
                  const SizedBox(height: 10),
                  if (_controller != null)
                    YoutubePlayer(
                      controller: _controller!,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: AppColors.secondary,
                      progressColors: const ProgressBarColors(
                        playedColor: AppColors.secondary,
                        handleColor: AppColors.secondary,
                      ),
                    ),
                ],
                const SizedBox(height: 10),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: FilledButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return MedicineBottomSheet(
                            savedMedicinesController: savedMedicinesController,
                            medicine: widget.medicine);
                      });
                },
                label: Text(S.of(context).add_your_times),
                icon: const Icon(Icons.alarm, color: AppColors.secondary),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
