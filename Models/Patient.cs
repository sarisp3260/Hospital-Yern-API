using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HospitalApi.DotNet8.Models
{
    public class Patient
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PatientID { get; set; }

        [Required]
        [MaxLength(50)]
        public string PatientName { get; set; }

        [Required]
        [Range(0, 150)] // Adjust the range as per your requirements
        public int Age { get; set; } = 30; // Default value

        [Required]
        [MaxLength(10)]
        public string Gender { get; set; }

        [Required]
        [MaxLength(100)]
        public string Diagnosis { get; set; }

        [Required]
        public DateTime AdmissionDate { get; set; } = DateTime.Now;

        [Required]
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public DateTime? DeletedAt { get; set; }
    }
}