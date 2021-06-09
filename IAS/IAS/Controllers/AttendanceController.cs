using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DataAccessLayer;
using IAS.Models;

namespace IAS.Controllers
{
    public class AttendanceController : ApiController
    {
        IASDBEntities db = new IASDBEntities();
        // GET: api/Attendance
        [HttpGet]
        public HttpResponseMessage Get(int interneeid, DateTime date)
        {
            var AllAttendance = db.attendancetables.ToList();
            if (AllAttendance!=null)
            {
                var TAttendance = AllAttendance.FirstOrDefault(e => e.interneeid == interneeid && e.reportDatetime.Date == date.Date);
                if(TAttendance !=null)
                {
                    var Attendance = new attendance();
                    Attendance.id = TAttendance.id;
                    Attendance.interneeid = TAttendance.interneeid;
                    Attendance.reportDatetime = TAttendance.reportDatetime;
                    Attendance.leaveDatetime = TAttendance.leaveDatetime;
                    Attendance.statusid = TAttendance.statusid;
                    return Request.CreateResponse(HttpStatusCode.OK, Attendance);
                }
                return Request.CreateResponse(HttpStatusCode.NotFound, "Attendance Not Found!");
            }
            return Request.CreateResponse(HttpStatusCode.NoContent, "Attendance Not Found!");
        }

        // POST: api/Attendance
        [HttpPost]
        public HttpResponseMessage Post(attendancetable attendancetable)
        {
            if(attendancetable.reportDatetime!=null && attendancetable.statusid !=0 && attendancetable.interneeid !=0)
            {
                attendancetable.reportDatetime = attendancetable.reportDatetime.AddHours(5);
                attendancetable.leaveDatetime = attendancetable.reportDatetime.AddHours(7);
                var TAttendance = db.attendancetables.ToList().FirstOrDefault(e=>e.interneeid == attendancetable.interneeid && e.reportDatetime.Date == attendancetable.reportDatetime.Date);
                if(TAttendance !=null)
                {
                    TAttendance.statusid = attendancetable.statusid;
                    db.SaveChanges();
                    var Attendance = new attendance();
                    Attendance.id = TAttendance.id;
                    Attendance.interneeid = TAttendance.interneeid;
                    Attendance.reportDatetime = TAttendance.reportDatetime;
                    Attendance.leaveDatetime = TAttendance.leaveDatetime;
                    Attendance.statusid = TAttendance.statusid;
                    return Request.CreateResponse(HttpStatusCode.Accepted, Attendance);
                }
                else
                {
                    attendancetable = db.attendancetables.Add(attendancetable);
                    db.SaveChanges();
                    var Attendance = new attendance();
                    Attendance.id = attendancetable.id;
                    Attendance.interneeid = attendancetable.interneeid;
                    Attendance.reportDatetime = attendancetable.reportDatetime;
                    Attendance.leaveDatetime = attendancetable.leaveDatetime;
                    Attendance.statusid = attendancetable.statusid;
                    return Request.CreateResponse(HttpStatusCode.Created, Attendance);
                }
            }
            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Invalid data!");
        }
    }
}
