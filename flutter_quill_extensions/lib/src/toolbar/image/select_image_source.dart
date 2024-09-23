import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill_internal.dart' show isDesktopApp;
import 'package:flutter_quill/translations.dart';

import '../../editor/image/image_embed_types.dart';

class SelectImageSourceDialog extends StatelessWidget {
  const SelectImageSourceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 200),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(context.loc.gallery),
              subtitle: Text(
                'アルバムからアップロード',
              ),
              leading: const Icon(Icons.photo_sharp),
              onTap: () => Navigator.of(context).pop(InsertImageSource.gallery),
            ),
            ListTile(
              title: Text(context.loc.camera),
              subtitle: Text(
                '撮影する',
              ),
              leading: const Icon(Icons.camera),
              enabled: !isDesktopApp,
              onTap: () => Navigator.of(context).pop(InsertImageSource.camera),
            ),
            ListTile(
              title: Text(context.loc.link),
              subtitle: Text(
               '画像リンクからアップロードする',
              ),
              leading: const Icon(Icons.link),
              onTap: () => Navigator.of(context).pop(InsertImageSource.link),
            ),
            const SizedBox(
                                height: 20,
                                )
          ],
        ),
      ),
    );
  }
}

Future<InsertImageSource?> showSelectImageSourceDialog({
  required BuildContext context,
}) async {
  final imageSource = await showModalBottomSheet<InsertImageSource>(
    showDragHandle: true,
    context: context,
    constraints: const BoxConstraints(maxWidth: 640),
    builder: (_) => const FlutterQuillLocalizationsWidget(
      child: SelectImageSourceDialog(),
    ),
  );
  return imageSource;
}
