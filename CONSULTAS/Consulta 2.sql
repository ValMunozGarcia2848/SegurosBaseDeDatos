-- EspecialidadHospitales
select hospital.Nombre, especialidad.Nombre from medico
inner join especialidad on medico.CodEspecialidad=especialidad.CodEspecialidad
inner join consultorio on medico.CodConsultorio=consultorio.CodConsultorio
inner join hospital on hospital.CodHospital=consultorio.CodHospital