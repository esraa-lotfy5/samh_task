import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/enums/background_image.dart';
import 'package:samh_task/generated/locale_keys.g.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_background_header.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomBackgroundHeader(
              height: 294.0,
              image: BackgroundImage.bookFlight,
              showLogo: true,
            ),
            Text(LocaleKeys.home.tr()),
          ],
        ),
      ),
    );
  }
}
