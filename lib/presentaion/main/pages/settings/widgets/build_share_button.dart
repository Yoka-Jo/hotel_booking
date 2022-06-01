import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../../../resources/strings_manager.dart';

class BuildShareButton extends StatelessWidget {
  final Uri? uri;
  const BuildShareButton({Key? key, this.uri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ElevatedButton(
        onPressed: () => shareLink(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.share.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white),
            ),
            const Icon(
              Icons.share,
              size: 25.0,
            ),
          ],
        ),
      ),
    );
  }

  void shareLink() => Share.share(uri.toString());
}
