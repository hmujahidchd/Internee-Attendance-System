using DataAccessLayer;
using IAS.Helper_Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IAS.ViewModel
{
    public class MonthViewModel
    {
        public int id { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public int Present
        {
            get
            {
                return AttendanceSheet.Where(e => e.statusid == (int)Cls_Attendance.AttendanceStatus.Present).Count();
            }
        }
        public int Absent
        {
            get
            {
                return AttendanceSheet.Where(e=>e.statusid == (int)Cls_Attendance.AttendanceStatus.Absent).Count();
            }
        }
        public int Leaves
        {
            get
            {
                return AttendanceSheet.Where(e => e.statusid == (int)Cls_Attendance.AttendanceStatus.Leave).Count();
            }
        }
        public int PublicHolidays
        {
            get
            {
                return AttendanceSheet.Where(e => e.statusid == (int)Cls_Attendance.AttendanceStatus.Public_Holiday).Count();
            }
        }
        public int TotalWorkingDays
        {
            get
            {
                return AttendanceSheet.Where(e => e.statusid == (int)Cls_Attendance.AttendanceStatus.Absent || e.statusid == (int)Cls_Attendance.AttendanceStatus.Present || e.statusid == (int)Cls_Attendance.AttendanceStatus.Leave).Count();
            }
        }
        public List<attendancetable> AttendanceSheet = new List<attendancetable>();
        
    }
}