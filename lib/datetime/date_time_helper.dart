String convertDateTimeToString(DateTime dateTime)
{
  String year=dateTime.year.toString();
  String month=dateTime.month.toString();
  if(month.length==1)
  {
    month='0$month';
  }
  String day=dateTime.day.toString();

  String yyyymmdd=year+month+day;
  return yyyymmdd;
}