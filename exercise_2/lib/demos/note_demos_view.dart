import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({super.key});

  final _title = 'Create your first note';
  final _description = 'Add a note';
  final _createNote = 'Create a Note';
  final _importNote = 'Import Notes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().applex),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubtTitleWidget(
                title: _description * 10,
              ),
            ),
            const Spacer(), // colum icinde spcer atarsan o tum boslugu alir sadece sana ihtiyacin olan kadar verir

            _createButton(context),

            TextButton(
              onPressed: () {},
              child: Text(
                _importNote,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.blue),
              ),
            ),
            SizedBox(
              ButtonHeights.buttonNormalHeight,
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        height: ButtonHeights.buttonNormalHeight,
        child: Center(
            child: Text(
          _createNote,
          style: Theme.of(context).textTheme.headlineSmall,
        )),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}

/// Center text widget
class _SubtTitleWidget extends StatelessWidget {
  const _SubtTitleWidget({
    super.key,
    this.textAlign = TextAlign.center,
    required this.title,
  });
  final TextAlign textAlign;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}

class PaddingItems {
  static final EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static final EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
}

class ButtonHeights {
  static const double buttonNormalHeight = 50;
}
