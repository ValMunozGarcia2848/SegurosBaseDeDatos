select persona.nombre1,persona.nombre2,persona.apellidoPaterno,persona.apellidoMaterno,citamedica.fecha,doctor.nombre1 as NombreDoctor,doctor.apellidoPaterno as ApellidoDoctor,especialidad.nombre as especialidad,hospital.nombre as hopital,consultorio.piso,consultorio.NroConsultorio from persona
inner join asegurado on persona.CI=asegurado.CIDependiente
inner join citamedica on citamedica.Matricula=asegurado.Matricula
inner join medico on medico.CodMedico=citamedica.CodMedico
inner join especialidad on medico.CodEspecialidad=especialidad.CodEspecialidad
inner join persona as doctor on doctor.CI=medico.CI
inner join consultorio on medico.CodConsultorio=consultorio.CodConsultorio
inner join hospital on consultorio.CodHospital=hospital.CodHospital
