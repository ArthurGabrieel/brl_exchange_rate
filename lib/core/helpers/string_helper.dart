extension StringHelper on String {
  // 2024-11-19T17:06:38.174Z to 09/03/2022 - 15h09
  String toFormattedDateWithHour() {
    final date = DateTime.parse(this);

    final formattedDate = '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year} - '
        '${date.hour.toString().padLeft(2, '0')}h'
        '${date.minute.toString().padLeft(2, '0')}';

    return formattedDate;
  }

  // 2024-11-19T17:06:38.174Z to 09/03/2022
  String toFormattedDate() {
    final date = DateTime.parse(this);

    final formattedDate = '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';

    return formattedDate;
  }
}
