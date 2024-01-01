# Hospital API using .NET Core 8

This Hospital API project is built with .NET Core 8 and Entity Framework Core. It provides endpoints to manage patients' data in a hospital.

## Features

- **GET /api/Hospital**: Retrieves all active patients.
- **GET /api/Hospital/{id}**: Retrieves a specific patient by ID.
- **POST /api/Hospital**: Adds a new patient.
- **PUT /api/Hospital**: Updates an existing patient.
- **DELETE /api/Hospital/{id}**: Soft deletes a patient record.

## Data DB structure

Below is an example JSON object representing patient information:

```
{
    "id": 2,
    "name": "Pedro Pascal",
    "age": 44,
    "gender": "M",
    "diagnosis": "Operación de riñon",
    "admissionDate": "2024-01-01T14:55:33.609",
    "createdAt": "2024-01-01T14:55:33.609",
    "deletedAt": null
}
```

Here the diagram database:

![Image Description](https://github.com/sarisp3260/Hospital-Yern-API/blob/main/DB/Diagrama.PNG?raw=true)

## Clone repository
To clone this repository, use the following command:

- Git bash
  
	```git
	git clone https://github.com/sarisp3260/Hospital-Yern-API.git

### Requirements

- [.NET Core SDK 8](https://dotnet.microsoft.com/es-es/download/dotnet/8.0)
- [Visual Studio Code](https://code.visualstudio.com/) or [Visual Studio](https://visualstudio.microsoft.com/)

### Steps to Run

1. Clone this repository.
2. Open the project in your preferred editor (VS Code or Visual Studio).
3. Set up the database connection string in `appsettings.json`.
	
	```
 	"ConnectionStrings": {
	  "DefaultConnection": "Server=.\\SQLExpress; Database=YourDatabaseHere; Trusted_Connection=true; TrustServerCertificate=true;"
	},
 	```

5. Run the following command in the terminal to apply database migrations:

   ```bash
   dotnet ef database update

