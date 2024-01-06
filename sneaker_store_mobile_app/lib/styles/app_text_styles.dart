import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class app_text_style {
  
   static TextStyle latoStyle ({double fontSize = 12, FontWeight fontWeight = FontWeight.normal, Color color = Colors.black}){
    return GoogleFonts.lato(
      fontSize: fontSize, 
      fontWeight: fontWeight,
      color: color
      );
   }

// TextStyle for the header (Raleway)
static TextStyle raleway({double fontSize = 13.0}) {
  return GoogleFonts.raleway(
    fontStyle: FontStyle.normal,
    fontSize: fontSize,
  );
} //ef
static TextStyle ralewaySizeColor(
    {double fontSize = 13.0, Color color = Colors.black}) {
  return GoogleFonts.raleway(
    fontStyle: FontStyle.normal,
    fontSize: fontSize,
    color: color,
  );
} //ef

  static TextStyle ralewayBold({double fontSize = 13.0, fontWeight = FontWeight.bold}) {
    return GoogleFonts.raleway(
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  } //ef



// TextStyle for the body (Nunito)
static TextStyle nunito({double fontSize = 13.0}) {
  return GoogleFonts.nunito(
    fontStyle: FontStyle.normal,
    fontSize: fontSize,
  );
}//ef

static TextStyle nunitoSizeColor(
    {double fontSize = 13.0, Color? color = Colors.black}) {
  return GoogleFonts.nunito(
    fontStyle: FontStyle.normal,
    fontSize: fontSize,
    color: color,
  );
}//ef
}
