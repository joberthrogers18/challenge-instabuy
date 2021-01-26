class TextManipulation {
  static String textFormat(String value) {
    if (value.length > 20) {
    return value.substring(0, 18);
    }

    return value;
  }

  static String htmlTransform(String html) {
    var htmlSplit = html.split('<br>');

    var parserBr = htmlSplit.where((e) => e.length > 50 ).toList();

    if (parserBr.isNotEmpty) {
      var removeHeaders = parserBr[0].split(new RegExp(r"<\/?h?[0-6]>"));
      var getDescription = removeHeaders.where((e) => e.length > 50 ).toList();

      if (getDescription.length > 0) {
        if (getDescription[0].length > 270) {
          return '${getDescription[0].substring(0, 270)}...';
        }

        return getDescription[0];
      }
    }

    return 'Sem Descrição';
  }
}