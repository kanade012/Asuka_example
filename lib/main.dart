import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI 피드백 비교',
      navigatorObservers: [asuka.Asuka.asukaHeroController],
      builder: asuka.Asuka.builder,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _showSnackbarWithBasic(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('기본 방식 Snackbar!'),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showSnackbarWithAsuka() {
    final snackBar = SnackBar(
      content: const Text('Asuka 방식 Snackbar!'),
      duration: const Duration(seconds: 2),
    );
    asuka.Asuka.showSnackBar(snackBar);
  }

  void _showDialogWithBasic(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('기본 방식 Dialog'),
        content: const Text('이것은 기본 방식 Dialog입니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('닫기'),
          ),
        ],
      ),
    );
  }

  void _showDialogWithAsuka() {
    asuka.Asuka.showDialog(
      builder: (ctx) => AlertDialog(
        title: const Text('Asuka 방식 Dialog'),
        content: const Text('이것은 Asuka 방식 Dialog입니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('닫기'),
          ),
        ],
      ),
    );
  }

  void _showModalSheetWithBasic(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SizedBox(
        height: 200,
        child: Center(child: Text('기본 방식 ModalBottomSheet')),
      ),
    );
  }

  void _showModalSheetWithAsuka() {
    asuka.Asuka.showModalBottomSheet(
      builder: (ctx) => SizedBox(
        height: 200,
        child: Center(child: Text('Asuka 방식 ModalBottomSheet')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI 피드백 비교'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () => _showSnackbarWithBasic(context),
              child: const Text('기본 방식 Snackbar'),
            ),
            ElevatedButton(
              onPressed: _showSnackbarWithAsuka,
              child: const Text('Asuka 방식 Snackbar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showDialogWithBasic(context),
              child: const Text('기본 방식 Dialog'),
            ),
            ElevatedButton(
              onPressed: _showDialogWithAsuka,
              child: const Text('Asuka 방식 Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showModalSheetWithBasic(context),
              child: const Text('기본 방식 ModalBottomSheet'),
            ),
            ElevatedButton(
              onPressed: _showModalSheetWithAsuka,
              child: const Text('Asuka 방식 ModalBottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}
