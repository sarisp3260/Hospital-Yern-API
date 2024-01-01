﻿using System.Numerics;

namespace HospitalApi.DotNet8.Models
{
    public class Appointment
    {
        public int Id { get; set; }
        public int PatientId { get; set; }
        public Patient Patient { get; set; }
        public int DoctorId { get; set; }
        public Doctor Doctor { get; set; }
        public DateTime AppointmentDate { get; set; } 
        public DateTime CreatedAt { get; set; }
        public DateTime? DeletedAt { get; set; }
    }
}