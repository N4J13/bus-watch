extension StringExtension on String {
  String capitalize() {
    List<String> words = split(" ");
    return words
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(" ");
  }

  String slugify() {
    return toLowerCase().replaceAll(" ", "+");
  }

  String createShortName() {
    List<String> words = split(" ");

    if (words.length <= 2) {
      return this;
    } else if (split(" ").length > 2) {
      return words.map((word) => word[0].toUpperCase()).join("");
    }

    return this;
  }
}
