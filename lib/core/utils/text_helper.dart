class TextHelper {
  static String wrapWords(String str, int wordsPerLine) {
    final words = str.split(' ');
    final buffer = StringBuffer();
    for (int i = 0; i < words.length; i++) {
      buffer.write(words[i]);
      if ((i + 1) % wordsPerLine == 0 && i != words.length - 1) {
        buffer.write('\n');
      } else if (i != words.length - 1) {
        buffer.write(' ');
      }
    }
    return buffer.toString();
  }
 static String capitaliseFirstLetter(String text) {
   final capitaliseText =
      text.substring(0,1).toUpperCase() + text.substring(1);
  return capitaliseText;
}
}
