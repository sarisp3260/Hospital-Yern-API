using HospitalApi.DotNet8.Data;
using HospitalApi.DotNet8.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HospitalApi.DotNet8.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HospitalController : ControllerBase
    {
        private readonly MedicalDbContext _context;

        public HospitalController(MedicalDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult> GetAllPatients()
        {
            var patients = await _context.Patients.Where(p => p.DeletedAt == null).ToListAsync();

            return Ok(patients);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetPatient(int id)
        {
            var patients = await _context.Patients.FindAsync(id);
            if (patients == null)
            {
                return BadRequest("The patinet is not found.");
            }

            return Ok(patients);
        }

        [HttpPost]
        public async Task<ActionResult> AddPatient(Patient patient)
        {
            _context.Patients.Add(patient);
            await _context.SaveChangesAsync();

            return Ok(await GetAllPatients());
        }

        [HttpPut]
        public async Task<ActionResult> UpdatePatient(Patient updatedPatient)
        {
            var patientDB = await _context.Patients.FindAsync(updatedPatient.Id);
            if (patientDB == null)
            {
                return BadRequest("The user does not exist");
            }

            patientDB.Name = updatedPatient.Name;
            patientDB.Age = updatedPatient.Age;
            patientDB.Gender = updatedPatient.Gender;
            patientDB.Diagnosis = updatedPatient.Diagnosis;
            patientDB.AdmissionDate = updatedPatient.AdmissionDate;
            patientDB.CreatedAt = updatedPatient.CreatedAt;
            patientDB.DeletedAt = updatedPatient.DeletedAt;

            await _context.SaveChangesAsync();

            return Ok(await GetAllPatients());
        }

        [HttpDelete]
        public async Task<ActionResult> DeletePatient(int id)
        {
           var patient = await _context.Patients.FindAsync(id);
            if (patient == null)
            {
                return NotFound();
            }

            patient.DeletedAt = DateTime.UtcNow;
            await _context.SaveChangesAsync();

            return Ok(await GetAllPatients());
        }
    }
}
