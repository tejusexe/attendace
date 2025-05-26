import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<EmpAttendanceTableRow>? getAttendanceRowFordate(
  DateTime? date,
  List<EmpAttendanceTableRow>? rows,
) {
// // iterrate through the list of rows present in rows of type - EmpAttendanceTableRow   // filter the rows present EmpAttendanceTableRow which matches the date in the row item markin   // EmpAttendanceTableRow markin is in DateTime format so covert date to format of dd/mm/yyyy before matching and date is in format dd/mm/yyyy
  if (date == null || rows == null) {
    return null;
  }

  String formattedDate = DateFormat('dd/MM/yyyy').format(date);
  List<EmpAttendanceTableRow> matchingRows = [];
  for (var row in rows) {
    if (row.date != null) {
      String formattedMarkinDate = DateFormat('dd/MM/yyyy').format(row.date!);
      if (formattedMarkinDate == formattedDate) {
        matchingRows.add(row);
        //print("input date = {formattedDate} row date = $formattedMarkinDate");
        //debugDate = formattedDate;
        return matchingRows;
      }
    }
  }
  return matchingRows;
}

DebugVariableStruct? getAttendanceRowFordateCopy(
  DateTime? date,
  List<EmpAttendanceTableRow>? rows,
) {
  // // // iterrate through the list of rows present in rows of type - EmpAttendanceTableRow   // filter the rows present EmpAttendanceTableRow which matches the date in the row item markin   // EmpAttendanceTableRow markin is in DateTime format so covert date to format of dd/mm/yyyy before matching and date is in format dd/mm/yyyy - return the matching row, formatteddate and formattedMarkinDate
  if (date == null || rows == null) {
    return null;
  }

  String formattedDate = DateFormat('dd/MM/yyyy').format(date);
  EmpAttendanceTableRow? matchingRow;
  String formattedMarkinDate = '';
  for (var row in rows) {
    if (row.date != null) {
      formattedMarkinDate = DateFormat('dd/MM/yyyy').format(row.date!);
      if (formattedMarkinDate == formattedDate) {
        matchingRow = row;
        break;
      }
    }
  }

  return createDebugVariableStruct(
    row: null,
    inputDate: formattedDate,
    outputDate: formattedMarkinDate,
  );
}

bool? checkforlocationCopy(
  LatLng userlocation,
  double radiusInMeters,
  double targetlattitude,
  double targetlongitude,
  String designation,
) {
  LatLng targetlocation = LatLng(targetlattitude, targetlongitude);
  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  // check and return true if the user is in 50meters of the specified location.Take input 50meters and location
  double distanceInMeters(LatLng point1, LatLng point2) {
    const double earthRadius = 6371000; // in meters
    double dLat = _degreesToRadians(point2.latitude - point1.latitude);
    double dLon = _degreesToRadians(point2.longitude - point1.longitude);
    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreesToRadians(point1.latitude)) *
            math.cos(_degreesToRadians(point2.latitude)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadius * c; // returns distance in meters
  }

  double distance = distanceInMeters(userlocation, targetlocation);
  if (designation == "Coordinator") {
    return distance <= radiusInMeters;
  } else {
    return true;
  }
}

LatLng? checkforlocationCopyCopy(
  LatLng userlocation,
  double radiusInMeters,
  double targetlattitude,
  double targetlongitude,
) {
  LatLng targetlocation = LatLng(targetlattitude, targetlongitude);

  return targetlocation;
}

bool isCheckinAllowed(
  DateTime currentTime,
  DateTime checkInTime,
) {
//   // // input arguments currentTime and checkinTime arein DateTime format   //format both arguments currentTime and checkinTime so that it is in format jm having only time without date   // example 9:00 AM   // check if currentTime is greater than checkinTime or equal   // Format currentTime and checkInTime to have only time without date   //return false if date is greater or equal, true if not
  // Format currentTime and checkInTime to have only time without date
  String currenttimeFormated = DateFormat.jm().format(currentTime);
  String checkInTimeFormatted = DateFormat.jm().format(checkInTime);
  // print("currenttimeFormated = $checkinTimeFormed");
  DateTime formattedCurrentTime = DateFormat.jm().parse(currenttimeFormated);
  DateTime formattedCheckInTime = DateFormat.jm().parse(checkInTimeFormatted);

  if (formattedCurrentTime.isAfter(formattedCheckInTime)) {
    return true;
  } else {
    return false;
  }
}

DateTime isCheckinAllowedCopy(
  DateTime currentTime,
  DateTime checkInTime,
) {
  //   // // input arguments currentTime and checkinTime arein DateTime format   //format both arguments currentTime and checkinTime so that it is in format jm having only time without date   // example 9:00 AM   // check if currentTime is greater than checkinTime or equal   // Format currentTime and checkInTime to have only time without date   //return false if date is greater or equal, true if not
  // Format currentTime and checkInTime to have only time without date
  String currenttimeFormated = DateFormat.jm().format(currentTime);
  String checkInTimeFormatted = DateFormat.jm().format(checkInTime);
  // print("currenttimeFormated = $checkinTimeFormed");
  DateTime formattedCurrentTime = DateFormat.jm().parse(currenttimeFormated);
  DateTime formattedCheckInTime = DateFormat.jm().parse(checkInTimeFormatted);
  // Check if currentTime is greater than checkInTime or equal
  // if (currentTime.isAfter(checkInTime) ||
  //     currentTime.isAtSameMomentAs(checkInTime)) {
  //   return true;
  // } else {
  //   return false;
  // }
  // if (formattedCurrentTime.isAfter(formattedCheckInTime)) {
  //   return true;
  // } else {
  //   return false;
  // }
  return formattedCurrentTime;
}

AttendanceSummaryStruct getAttendanceSummaryCopy2(
  List<DateTime> workingDays,
  List<EmpAttendanceTableRow> employeeAttendDetails,
) {
// List of dates present in workingDays
  // for each date in workingDays -try to find this date in the testinput.

  // Iterate through each date in workingDays
  AbsentSummaryStruct absentsummary = AbsentSummaryStruct(
    absentDates: [],
    absentDaysNum: 0,
  );
  LeaveSummaryStruct leavesummary = LeaveSummaryStruct(
    leaveDates: [],
    leaveNumber: 0,
  );
  PresentSummaryStruct presentsummary = PresentSummaryStruct(
    presentdatesList: [],
    presentdaysNum: 0,
  );

  AttendanceSummaryStruct attendanceSummary = AttendanceSummaryStruct();
  attendanceSummary.absentSummary = absentsummary;
  attendanceSummary.presentSummary = presentsummary;
  attendanceSummary.leaveSummary = leavesummary;
  // attendanceSummary.absentSummary = AbsentSummaryStruct();
  // attendanceSummary.absentSummary.absentDaysNum = 11;
  EmpAttendanceTableRow? attendanceRow = null;
  // uinqPunchDate = employeeAttendDetails[0].uinqPunchDate);
  List<AttendanceTableRowsTestStruct> matchingRow = [];
  for (var date in workingDays) {
    //formattedWorkingDate = date
    String formattedWorkingDate = DateFormat('dd/MM/yyyy').format(date);
    for (var row in employeeAttendDetails) {
      if (row.date != null) {
        String formattedRowDate = DateFormat('dd/MM/yyyy').format(row.date!);
        if (formattedRowDate == formattedWorkingDate) {
          //matchingRow.add(row);
          //return 1;
          attendanceRow = row;
          //print("input date = {formattedDate} row date = $formattedMarkinDate");
          //debugDate = formattedDate;
          break;
        }
      }
    }
    if (attendanceRow != Null) {
      //attendanceRow = matchingRow[0];
      if (attendanceRow?.takenleave == 1) {
        attendanceSummary.leaveSummary.leaveNumber++;
        attendanceSummary.leaveSummary.leaveDates.add(date);
      } else if (attendanceRow?.takenleave == 0.5) {
        attendanceSummary.leaveSummary.leaveNumber =
            attendanceSummary.leaveSummary.leaveNumber + 0.5;

        attendanceSummary.leaveSummary.leaveDates.add(date);
        if (attendanceRow?.present == 0.5) {
          attendanceSummary.presentSummary.presentdaysNum =
              attendanceSummary.presentSummary.presentdaysNum + 0.5;
          attendanceSummary.presentSummary.presentdatesList.add(date);
        } else {
          attendanceSummary.absentSummary.absentDaysNum =
              attendanceSummary.absentSummary.absentDaysNum + 0.5;
          attendanceSummary.absentSummary.absentDates.add(date);
        }
        attendanceSummary.leaveSummary.leaveDates.add(date);
      } else {
        if (attendanceRow?.present == 1) {
          attendanceSummary.presentSummary.presentdaysNum++;
          attendanceSummary.presentSummary.presentdatesList.add(date);
        } else if (attendanceRow?.present == 0.5) {
          attendanceSummary.presentSummary.presentdaysNum =
              attendanceSummary.presentSummary.presentdaysNum + 0.5;
          attendanceSummary.presentSummary.presentdatesList.add(date);

          attendanceSummary.absentSummary.absentDaysNum =
              attendanceSummary.absentSummary.absentDaysNum + 0.5;
          attendanceSummary.absentSummary.absentDates.add(date);
        } else {
          attendanceSummary.absentSummary.absentDaysNum =
              attendanceSummary.absentSummary.absentDaysNum + 1;
          attendanceSummary.absentSummary.absentDates.add(date);
        }
      }
    }
  }
  //return attendanceSummary.absentSummary.absentDaysNum;
  //return attendanceSummary.presentSummary.presentdaysNum;
  //return attendanceSummary.leaveSummary.leaveNumber;
  return attendanceSummary;
}

bool isCheckoutAllowed(
  DateTime currentTime,
  DateTime checkoutTime,
) {
//input arguments currentTime and checkinTime arein DateTime format
  //format both arguments currentTime and checkinTime so that it is in format jm having only time without date   // example 9:00 AM   // check if currentTime is greater than checkinTime or equal   // Format currentTime and checkInTime to have only time without date   //return false if date is greater or equal, true if not
  // Format currentTime and checkInTime to have only time without date
  // Check if currentTime is greater than checkInTime or equal
  String currenttimeFormated = DateFormat.jm().format(currentTime);
  String checkoutTimeFormatted = DateFormat.jm().format(checkoutTime);
  // print("currenttimeFormated = $checkinTimeFormed");
  DateTime formattedCurrentTime = DateFormat.jm().parse(currenttimeFormated);
  DateTime formattedCheckoutTime = DateFormat.jm().parse(checkoutTimeFormatted);
  if (formattedCurrentTime.isBefore(formattedCheckoutTime)) {
    //1:06 PM  is after 12:10 PM
    return true;
  } else {
    return false;
  }
}

bool isWorkStatusFilled(String workStatusWords) {
  //if (workStatusWords == null) {
  //List<String> words = workStatusWords.split(' ');

  if (workStatusWords.length >= 1) {
    return true;
  } else {
    return false;
  }
}

List<DateTime> getMonthlyWorkingDates(DateTime date) {
// get the working days dates for a specific month passd as input. Include monday to saturday except sundays. Also dont inlcude the dates gievn in holiday list input
  // Get the number of days in the month
  // Get the first day of the next month
  DateTime firstDayOfNextMonth = DateTime(date.year, date.month + 1, 1);

  // Subtract one day to get the last day of the current month
  DateTime lastDayOfCurrentMonth =
      firstDayOfNextMonth.subtract(Duration(days: 1));

  // Return the day of the last day of the month, which is the total number of days in the month
  int daysInMonth = lastDayOfCurrentMonth.day;

  // Initialize a list to store working days
  List<DateTime> workingDays = [];
  List<String> workingDays_string = [];

  // // Loop through each day in the month
  // for (int i = 1; i <= daysInMonth; i++) {
  //   DateTime currentDate = DateTime(date.year, date.month, i);

  //   // Check if the current day is a Sunday or a holiday
  //   if (currentDate.weekday != DateTime.sunday &&
  //       !holidayList.contains(currentDate)) {
  //     workingDays.add(currentDate);
  //   }
  // }
  for (int i = 1; i <= daysInMonth; i++) {
    // make the 2 dateTime variables of diffrent DateTime format to same format
    // Convert the given date to the desired format
    DateTime currentDate = DateTime(date.year, date.month, i);
    String formattedDate = DateFormat('d/M/yyyy').format(currentDate);
    // Convert the holiday list dates to the desired format
    List<DateTime> holidayList = [];
    List<String> formattedHolidayList = holidayList.map((holiday) {
      return DateFormat('d/M/yyyy').format(holiday);
    }).toList();
    if (currentDate.weekday != DateTime.sunday &&
        !formattedHolidayList.contains(formattedDate)) {
      workingDays.add(currentDate);
      workingDays_string.add(formattedDate);
    }
  }

  // Return the list of working days
  // DateTime currentDate = DateTime(date.year, date.month, 2);
  // String currentDate1 = DateFormat('d/M/yyyy').format(currentDate);
  //DateTime formattedCurrentTime = DateFormat('d/M/yyyy').parse(currentDate1);
  //return DateFormat('d/M/yyyy').format(workingDays[0]);

  return workingDays;
}

WorkDurationStruct calculateWorkTime(DateTime? checkInTime) {
// // calculate number of hours worked by subracting checkInTime with current time. Return 1 if worked hours is > 8hrs, return 0.5 if worked hours is > 4hrs but else than 8hrs
  DateTime currentTime = DateTime.now();

  String currenttimeFormated = DateFormat.jm().format(currentTime);
  String checkinTimeFormated = DateFormat.jm().format(checkInTime!);
  // print("currenttimeFormated = $checkinTimeFormed");
  DateTime currenttimeFormated_1 = DateFormat.jm().parse(currenttimeFormated);
  DateTime checkinTimeFormated_1 = DateFormat.jm().parse(checkinTimeFormated);

  Duration workedHours =
      currenttimeFormated_1.difference(checkinTimeFormated_1);
  double hoursWorked = workedHours.inHours.toDouble();
  double days = 0;
  //return hoursWorked;
  if (hoursWorked >= 8) {
    days = 1;
  } else if (hoursWorked >= 4 && hoursWorked < 8) {
    days = 0.5;
  } else {
    days = 0;
  }
  double minutes = workedHours.inMinutes.remainder(60).toDouble();
  double totalWorkedTime = hoursWorked + (minutes / 100);
  return createWorkDurationStruct(
    durationWorked: totalWorkedTime,
    numDayPresent: days,
  );
}

AttendanceSummaryStruct getAttendanceSummary(
  List<DateTime> workingDays,
  List<EmpAttendanceTableRow> employeeAttendDetails,
) {
// List of dates present in workingDays
  // for each date in workingDays -try to find this date in the testinput.

  // Iterate through each date in workingDays
  AbsentSummaryStruct absentsummary = AbsentSummaryStruct(
    absentDates: [],
    absentDaysNum: 0,
  );
  LeaveSummaryStruct leavesummary = LeaveSummaryStruct(
    leaveDates: [],
    leaveNumber: 0,
  );
  PresentSummaryStruct presentsummary = PresentSummaryStruct(
    presentdatesList: [],
    presentdaysNum: 0,
  );

  AttendanceSummaryStruct attendanceSummary = AttendanceSummaryStruct();
  attendanceSummary.absentSummary = absentsummary;
  attendanceSummary.presentSummary = presentsummary;
  attendanceSummary.leaveSummary = leavesummary;
  // attendanceSummary.absentSummary = AbsentSummaryStruct();
  // attendanceSummary.absentSummary.absentDaysNum = 11;
  EmpAttendanceTableRow? attendanceRow = null;
  // uinqPunchDate = employeeAttendDetails[0].uinqPunchDate);
  List<AttendanceTableRowsTestStruct> matchingRow = [];
  for (var date in workingDays) {
    //formattedWorkingDate = date
    String formattedWorkingDate = DateFormat('dd/MM/yyyy').format(date);
    for (var row in employeeAttendDetails) {
      if (row.date != null) {
        String formattedRowDate = DateFormat('dd/MM/yyyy').format(row.date!);
        if (formattedRowDate == formattedWorkingDate) {
          //matchingRow.add(row);
          //return 1;
          attendanceRow = row;
          //print("input date = {formattedDate} row date = $formattedMarkinDate");
          //debugDate = formattedDate;
          break;
        }
      }
    }
    if (attendanceRow != Null) {
      //attendanceRow = matchingRow[0];
      if (attendanceRow?.takenleave == 1) {
        attendanceSummary.leaveSummary.leaveNumber++;
        attendanceSummary.leaveSummary.leaveDates.add(date);
      } else if (attendanceRow?.takenleave == 0.5) {
        attendanceSummary.leaveSummary.leaveNumber =
            attendanceSummary.leaveSummary.leaveNumber + 0.5;

        attendanceSummary.leaveSummary.leaveDates.add(date);
        if (attendanceRow?.present == 0.5) {
          attendanceSummary.presentSummary.presentdaysNum =
              attendanceSummary.presentSummary.presentdaysNum + 0.5;
          attendanceSummary.presentSummary.presentdatesList.add(date);
        } else {
          attendanceSummary.absentSummary.absentDaysNum =
              attendanceSummary.absentSummary.absentDaysNum + 0.5;
          attendanceSummary.absentSummary.absentDates.add(date);
        }
        attendanceSummary.leaveSummary.leaveDates.add(date);
      } else {
        if (attendanceRow?.present == 1) {
          attendanceSummary.presentSummary.presentdaysNum =
              attendanceSummary.presentSummary.presentdaysNum + 1;
          attendanceSummary.presentSummary.presentdatesList.add(date);
        } else if (attendanceRow?.present == 0.5) {
          attendanceSummary.presentSummary.presentdaysNum =
              attendanceSummary.presentSummary.presentdaysNum + 0.5;
          attendanceSummary.presentSummary.presentdatesList.add(date);

          attendanceSummary.absentSummary.absentDaysNum =
              attendanceSummary.absentSummary.absentDaysNum + 0.5;
          attendanceSummary.absentSummary.absentDates.add(date);
        } else {
          attendanceSummary.absentSummary.absentDaysNum =
              attendanceSummary.absentSummary.absentDaysNum + 1;
          attendanceSummary.absentSummary.absentDates.add(date);
        }
      }
    }
  }
  //return attendanceSummary.absentSummary.absentDaysNum;
  //return attendanceSummary.presentSummary.presentdaysNum;
  //return attendanceSummary.leaveSummary.leaveNumber;
  return attendanceSummary;
}

double? getAttendanceSummaryCopy(
  List<DateTime> workingDays,
  List<AttendanceTableRowsTestStruct> testInput,
) {
  // List of dates present in workingDays
  // for each date in workingDays -try to find this date in the testinput.

  // Iterate through each date in workingDays
  AbsentSummaryStruct absentsummary = AbsentSummaryStruct(
    absentDates: [],
    absentDaysNum: 0,
  );
  LeaveSummaryStruct leavesummary = LeaveSummaryStruct(
    leaveDates: [],
    leaveNumber: 0,
  );
  PresentSummaryStruct presentsummary = PresentSummaryStruct(
    presentdatesList: [],
    presentdaysNum: 0,
  );

  AttendanceSummaryStruct attendanceSummary = AttendanceSummaryStruct();
  attendanceSummary.absentSummary = absentsummary;
  attendanceSummary.presentSummary = presentsummary;
  attendanceSummary.leaveSummary = leavesummary;
  // attendanceSummary.absentSummary = AbsentSummaryStruct();
  // attendanceSummary.absentSummary.absentDaysNum = 11;
  List<AttendanceTableRowsTestStruct> matchingRow = [];
  AttendanceTableRowsTestStruct attendanceRow = AttendanceTableRowsTestStruct();
  for (var date in workingDays) {
    String formattedWorkingDate = DateFormat('dd/MM/yyyy').format(date);
    for (var row in testInput) {
      if (row.date != null) {
        String formattedRowDate = DateFormat('dd/MM/yyyy').format(row.date!);
        if (formattedRowDate == formattedWorkingDate) {
          //matchingRow.add(row);
          //return 1;
          attendanceRow = row;
          //print("input date = {formattedDate} row date = $formattedMarkinDate");
          //debugDate = formattedDate;
          break;
        }
      }
    }
    if (attendanceRow == Null) {
      continue;
    }
    //attendanceRow = matchingRow[0];
    if (attendanceRow.leave == 1) {
      attendanceSummary.leaveSummary.leaveNumber++;
      attendanceSummary.leaveSummary.leaveDates.add(date);
    } else if (attendanceRow.leave == 0.5) {
      attendanceSummary.leaveSummary.leaveNumber =
          attendanceSummary.leaveSummary.leaveNumber + 0.5;

      attendanceSummary.leaveSummary.leaveDates.add(date);
      if (attendanceRow.present >= 0.5) {
        attendanceSummary.presentSummary.presentdaysNum =
            attendanceSummary.presentSummary.presentdaysNum + 0.5;
        attendanceSummary.presentSummary.presentdatesList.add(date);
      } else {
        attendanceSummary.absentSummary.absentDaysNum =
            attendanceSummary.absentSummary.absentDaysNum + 0.5;
        attendanceSummary.absentSummary.absentDates.add(date);
      }
      attendanceSummary.leaveSummary.leaveDates.add(date);
    } else {
      if (attendanceRow.present == 1) {
        attendanceSummary.presentSummary.presentdaysNum++;
        attendanceSummary.presentSummary.presentdatesList.add(date);
      } else if (attendanceRow.present == 0.5) {
        attendanceSummary.presentSummary.presentdaysNum =
            attendanceSummary.presentSummary.presentdaysNum + 0.5;
        attendanceSummary.presentSummary.presentdatesList.add(date);

        attendanceSummary.absentSummary.absentDaysNum =
            attendanceSummary.absentSummary.absentDaysNum + 0.5;
        attendanceSummary.absentSummary.absentDates.add(date);
      } else {
        attendanceSummary.absentSummary.absentDaysNum =
            attendanceSummary.absentSummary.absentDaysNum + 1;
        attendanceSummary.absentSummary.absentDates.add(date);
      }
    }
  }
  //return attendanceSummary.absentSummary.absentDaysNum;
  //return attendanceSummary.presentSummary.presentdaysNum;
  return attendanceSummary.leaveSummary.leaveNumber;
  //return attendanceSummary;
  //for all the dates present in workingDays list, get the list which matches the date member present in list
}

bool? checkforlocation(
  LatLng userlocation,
  LatLng targetlocation,
  double radiusInMeters,
) {
  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  // check and return true if the user is in 50meters of the specified location.Take input 50meters and location
  double distanceInMeters(LatLng point1, LatLng point2) {
    const double earthRadius = 6371000; // in meters
    double dLat = _degreesToRadians(point2.latitude - point1.latitude);
    double dLon = _degreesToRadians(point2.longitude - point1.longitude);
    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreesToRadians(point1.latitude)) *
            math.cos(_degreesToRadians(point2.latitude)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadius * c; // returns distance in meters
  }

  double distance = distanceInMeters(userlocation, targetlocation);
  return distance <= radiusInMeters;
}

bool? checkdateIseven(DateTimeRange? date) {
  // check if the calender selected date from the timestamprange  is even or odd
  if (date == null) return null; // Check if date is null
  int day = date.start.day; // Get the day of the start date
  return day % 2 == 0; // Return true if even, false if odd
}
