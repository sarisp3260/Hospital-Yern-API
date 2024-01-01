namespace HospitalApi.DotNet8.Models
{
    public class Patient
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string Diagnosis { get; set; }
        public DateTime AdmissionDate { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? DeletedAt { get; set; } 
    }
}
