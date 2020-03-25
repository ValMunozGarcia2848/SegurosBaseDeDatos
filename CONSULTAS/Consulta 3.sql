-- DoctoresPerteneciantesASeguros
select seguro.Nombre, persona.Nombre1, persona.nombre2, persona.ApellidoPaterno, persona.ApellidoMaterno from seguro
inner join hospital on seguro.CodSeguro=hospital.CodSeguro
inner join consultorio on hospital.CodHospital = consultorio.CodHospital
inner join  medico on consultorio.CodConsultorio= medico.CodConsultorio
inner join persona on medico.CI = persona.CI