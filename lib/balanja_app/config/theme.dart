import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

ThemeData defaultTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark, // <-- WAJIB agar dianggap dark mode
    scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),

    // ===== INPUT TEXTFIELD =====
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.white70, // warna hint lebih soft
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey[700]!, width: 1.0),
      ),
      outlineBorder: BorderSide(color: Colors.grey[700]!, width: 1.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey[800]!, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
    ),

    // ===== APPBAR =====
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),

    // ===== BUTTON =====
    buttonTheme: ButtonThemeData(
      buttonColor: primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),

    // ===== COLOR SCHEME =====
    colorScheme: ColorScheme.dark().copyWith(
      primary: HexColor('B9975B'),
      secondary: HexColor('#3453B7'),
      surface: const Color(0xFF1F1F1F),
      onSurface: Colors.white,
    ),

    // ===== TEXT THEME =====
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserrat(
        fontSize: 21,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.white60,
      ),
    ),
  );
}

Color primary = HexColor('#B9975B');
Color primary2 = HexColor('#f2d4a0');
Color success = HexColor('#00b300');
Color danger = HexColor('#cc0000');
Color warning = HexColor('#FFCA00');
Color info = HexColor('#1992ff');
Color dark = HexColor('#212121');
Color dark2 = HexColor('#262626');
Color textdark = HexColor('#949492');

Color textTheme = Colors.white;
String nameApp = 'matrial.id';
