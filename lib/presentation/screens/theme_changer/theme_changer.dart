import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/dark_mode_provider.dart';

class ThemeChanger extends ConsumerWidget {
  static const String name = 'theme_changer';
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final isDarkMode = ref.watch(darkModeProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    final colors = ref.watch(colorListProvider);
    //final selectedColor = ref.watch(selectedColorProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme Changer'),
          actions: [
            IconButton(
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_rounded
                  : Icons.light_mode_rounded),
              onPressed: () {
                //ref.read(darkModeProvider.notifier).state = !isDarkMode;
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
                //print(ref.read(themeNotifierProvider).isDarkMode);
              },
            )
          ],
        ),
        body: ListView.builder(
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final color = colors[index];
            return RadioListTile(
              title: Text(
                "Este color",
                style: TextStyle(color: color),
              ),
              subtitle: Text('${color.value}', style: TextStyle(color: color)),
              activeColor: color,
              value: index,
              groupValue: selectedColor,
              onChanged: (value) {
                //ref.read(selectedColorProvider.notifier).state = value!;
                ref.read(themeNotifierProvider.notifier).changeColor(value!);
              },
            );
          },
        ));
  }
}
