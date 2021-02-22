class DateUtil {

  static DateTime midNight() {
    var today = DateTime.now();
    return DateTime(today.year, today.month, today.day);
  }

  static DateTime todayTime(int hour, int minute) {
    var today = DateTime.now();
    return DateTime(today.year, today.month, today.day, hour, minute);
  }

  static String formatDateCalendar(DateTime date) {// [dd/MM/yyyy]
    return (date.day < 10 ? "0${date.day}" : date.day.toString()) + "/" +
        (date.month < 10 ? "0${date.month}" : date.month.toString()) + "/" +
        date.year.toString();
  }

  static String getWeekDat(DateTime date) {// [Segunda]
    String result = "";
    switch(date.weekday) {
      case 1:
        result += "Segunda";
        break;
      case 2:
        result += "Terça";
        break;
      case 3:
        result += "Quarta";
        break;
      case 4:
        result += "Quinta";
        break;
      case 5:
        result += "Sexta";
        break;
      case 6:
        result += "Sábado";
        break;
      case 7:
        result += "Domingo";
        break;
    }
    return result;
  }

  static String getMounth(DateTime date) {// [Janeiro]
    String result = "";
    switch(date.month) {
      case 1:
        result += "Janeiro";
        break;
      case 2:
        result += "Fevereiro";
        break;
      case 3:
        result += "Março";
        break;
      case 4:
        result += "Abril";
        break;
      case 5:
        result += "Maio";
        break;
      case 6:
        result += "Junho";
        break;
      case 7:
        result += "Julho";
        break;
      case 8:
        result += "Agosto";
        break;
      case 9:
        result += "Setembro";
        break;
      case 10:
        result += "Outubro";
        break;
      case 11:
        result += "Novembro";
        break;
      case 12:
        result += "Dezembro";
        break;
    }
    return result;
  }

  static String formatDateMonth(DateTime date) {// [10 de jan]
    String result = "${date.day} de ";
    switch(date.month) {
      case 1:
        result += "jan";
        break;
      case 2:
        result += "fev";
        break;
      case 3:
        result += "mar";
        break;
      case 4:
        result += "abr";
        break;
      case 5:
        result += "mai";
        break;
      case 6:
        result += "jun";
        break;
      case 7:
        result += "jul";
        break;
      case 8:
        result += "ago";
        break;
      case 9:
        result += "set";
        break;
      case 10:
        result += "out";
        break;
      case 11:
        result += "nov";
        break;
      case 12:
        result += "dez";
        break;
    }
    return result;
  }

  static String formatDateMouthHour(DateTime date) {// [10 de jan às 20:05]
    return "${formatDateMonth(date)} às ${formatHourMinute(date)}";
  }

  static String formatHourMinute(DateTime date) {// [20:05]
    return (date.hour < 10 ? "0${date.hour}:" : "${date.hour}:") +
        (date.minute < 10 ? "0${date.minute}" : "${date.minute}");
  }

}