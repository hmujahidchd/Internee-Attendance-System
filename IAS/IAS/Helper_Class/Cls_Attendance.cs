using DataAccessLayer;
using IAS.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IAS.Helper_Class
{
    public static class Cls_Attendance
    {
        static IASDBEntities db = new IASDBEntities();
        static List<MonthViewModel> MonthList = new List<MonthViewModel>();
        public static List<MonthViewModel> GetAttendanceDetails(int InterneeId)
        {
            MonthList.Clear();
            var attendance = db.attendancetables.ToList().OrderBy(e=>e.reportDatetime).ToList().Where(e => e.interneeid == InterneeId).ToList();
            if(attendance.Count>0)
            {
                var InitialDateTime = attendance.FirstOrDefault().reportDatetime;
                var EndDateTime = attendance.LastOrDefault().reportDatetime;
                if (InitialDateTime.Day != 1)
                {
                    InitialDateTime = new DateTime(InitialDateTime.Year, InitialDateTime.Month, 1, 9, 30, 0);
                    var initialItem = new attendancetable
                    {
                        interneeid = InterneeId,
                        reportDatetime = InitialDateTime,
                        leaveDatetime = InitialDateTime.AddHours(7),
                        statusid = (int)AttendanceStatus.Absent,
                    };
                    attendance.Insert(0, initialItem);
                }
                if (EndDateTime.Day != DateTime.DaysInMonth(EndDateTime.Year, EndDateTime.Month))
                {
                    EndDateTime = new DateTime(EndDateTime.Year, EndDateTime.Month, DateTime.DaysInMonth(EndDateTime.Year, EndDateTime.Month));
                    var EndItem = new attendancetable
                    {
                        interneeid = InterneeId,
                        reportDatetime = InitialDateTime,
                        leaveDatetime = InitialDateTime.AddHours(7),
                        statusid = (int)AttendanceStatus.Absent,
                    };
                    attendance.Add(EndItem);
                }
                DateTime PreviousItemDate = attendance.FirstOrDefault().leaveDatetime;
                foreach (var item in attendance)
                {
                    //checking for missing dates
                    var Difference = item.reportDatetime - PreviousItemDate;
                    TimeSpan MinDifference = new TimeSpan(1, 0, 0, 0);
                    if (Difference > MinDifference)
                    {
                        for(int day = PreviousItemDate.Day+1; day<item.reportDatetime.Day;day++)
                        {
                            var newItem = new attendancetable();
                            AddItemToMonthList(item);
                        }
                    }
                    //add item to list
                    AddItemToMonthList(item);
                    //update previous datetime
                    PreviousItemDate = item.leaveDatetime;
                }
            }

            return MonthList;
        }
        public static AttendanceReportModel GetAttendanceReport(int InterneeId, int year, int month)
        {
            return new AttendanceReportModel
            {
                Month = GetAttendanceDetails(InterneeId).FirstOrDefault(e => e.Year == year && e.Month == month),
                User = db.interneetables.ToList().FirstOrDefault(e=>e.id == InterneeId).usertable,
                Supervisor = db.interneetables.ToList().FirstOrDefault(e => e.id == InterneeId).supervisortable.usertable,
            };
        }

        private static void AddItemToMonthList(attendancetable item)
        {
            AddMonthIfNotExistFor(item);
            //adding attendance details to monthlist
            MonthList.FirstOrDefault(e => e.Year == item.reportDatetime.Year && e.Month == item.reportDatetime.Month).AttendanceSheet.Add(item);
        }
        private static void AddMonthIfNotExistFor(attendancetable item)
        {   //retriving existing month model
            MonthViewModel ExistedMonth = MonthList.FirstOrDefault(e => e.Month == item.reportDatetime.Month && e.Year == item.reportDatetime.Year);
            //checking if existing month model exist or not
            if (ExistedMonth == null)
            {
                //creating month model
                var NewMonthModel = new MonthViewModel
                {
                    Month = item.reportDatetime.Month,
                    Year = item.reportDatetime.Year
                };
                MonthList.Add(NewMonthModel);
            }
        }
        
        public static string StatusString(int id)
        {
            string status = "";
            if(id==1)
            {
                status = "Absent";
            }
            else if (id == 2)
            {
                status = "Present";
            }
            else if (id == 3)
            {
                status = "Public Holiday";
            }
            else if (id == 4)
            {
                status = "Leave";
            }
            return status;
        }

        public enum AttendanceStatus
        {
            Unattempt, Absent, Present, Public_Holiday, Leave
        }
    }
}