enum PerPage {
  ten,
  twenty,
  thirty,
  fifty;

  int get valueToNumber {
    switch (this) {
      case PerPage.ten:
        return 10;
      case PerPage.twenty:
        return 20;
      case PerPage.thirty:
        return 30;
      case PerPage.fifty:
        return 50;
    }
  }
}