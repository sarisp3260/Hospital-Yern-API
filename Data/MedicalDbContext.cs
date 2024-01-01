using HospitalApi.DotNet8.Models;
using Microsoft.EntityFrameworkCore;

namespace HospitalApi.DotNet8.Data
{
    public class MedicalDbContext : DbContext
    {
        public MedicalDbContext(DbContextOptions<MedicalDbContext> options) : base(options) 
        { 
        }

        public DbSet<Patient> Patients { get; set; }
        public DbSet<Doctor> Doctors { get; set; }
        public DbSet<Appointment> Appointments { get; set; }
    }
}
