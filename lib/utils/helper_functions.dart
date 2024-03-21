class HelperFunction {
//  Writing a function :
// We want to convert String like this Manjeri Town to manjeri+town
// We gonna name it convertStationName
// It will take a String as an argument and return a String as output
// In this example, argument will be Manjeri Town and output will be manjeri+town
// We use static keyword to make it a class level function so that we can call it without creating an object of the class

  static String convertStationName(String stationName) {
    // FIrst we have to convert the stationName to lower case
    String lowerCaseStationName = stationName.toLowerCase();
    // Then we have to replace the space with +
    String convertedStationName = lowerCaseStationName.replaceAll(' ',
        '+'); // replaceAll is a method in dart which replaces all the occurences of a string with another string
    // Finally we return the convertedStationName
    return convertedStationName;

    // or we can do it in one line
    // return stationName.toLowerCase().replaceAll(' ', '+');
  }
}

// Usage:

// import 'package:bus_tracker/lib/utils/helper_functions.dart';

// String stationName = 'Manjeri Town';

// String convertedStationName = HelperFunction.convertStationName(stationName);

// print(convertedStationName); // Output: manjeri+town
