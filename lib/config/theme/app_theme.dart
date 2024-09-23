import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
  Color.fromARGB(255, 152, 130, 13),
  Color.fromARGB(255, 35, 80, 53)
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

//! creamos un metodo copyWith para poder cambiar los valores de la clase
  //! recibe como parametro los valores que queremos cambiar, en este caso selectedColor y isDarkMode
  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) {
    return AppTheme(
      //! si el valor del parametro que tenemos en esta funcion es null, entonces se queda con el valor que ya tenia con this.selectedColor
      selectedColor: selectedColor ?? this.selectedColor,
      //! si el valor del parametro que tenemos en esta funcion es null, entonces se queda con el valor que ya tenia con this.isDarkMode
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
