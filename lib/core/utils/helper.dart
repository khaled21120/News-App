import 'package:flutter/material.dart';

abstract class Helper {
  static void showAlert({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) async {
    await showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog.adaptive(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Text(title),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text(
                      'اغلاق',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onTap();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text(
                      'التفسير',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  static String topNewsEndPoint({
    required String date,
    required String lang,
    required String country,
  }) => 'top-news?source-country=$country&language=$lang&date=$date';
}
