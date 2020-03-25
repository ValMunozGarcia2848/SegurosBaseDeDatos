select persona.nombre1, persona.nombre2, persona.apellidoPaterno, persona.apellidoMaterno, diagnostico.Diagnostico from persona
inner join asegurado on persona.CI = asegurado.CIDependiente
inner join citamedica on asegurado.Matricula = citamedica.Matricula
inner join consultamedica on citamedica.CodCitaMedica=consultamedica.CodCitaMedica
inner join signosvitales on signosvitales.CodSignosVitales=consultamedica.CodSignosVitales and 
	(Respiracion<11 or Respiracion >19 or pulso<60 or Pulso>100 or Temperatura<35 or Temperatura>37 or PresionSistolica<90 or PresionSistolica> 120 or PresionDistolica<60 or PresionDistolica>90)
inner join diagnostico on diagnostico.CodDiagnostico = consultamedica.CodDiagnostico;

select farmacia.NombreFarmacia, medicamento.NombreMedicamento from medicamento 
inner join farmacia_medicamentos on medicamento.CodMedicamento=farmacia_medicamentos.CodMedicamento
inner join farmacia on farmacia.CodFarmacia=farmacia_medicamentos.CodFarmacia;

select persona.nombre1,persona.nombre2,persona.apellidoPaterno,persona.apellidoMaterno,citamedica.fecha,doctor.nombre1 as NombreDoctor,doctor.apellidoPaterno as ApellidoDoctor,especialidad.nombre as especialidad,hospital.nombre as hopital,consultorio.piso,consultorio.NroConsultorio from persona
inner join asegurado on persona.CI=asegurado.CIDependiente
inner join citamedica on citamedica.Matricula=asegurado.Matricula
inner join medico on medico.CodMedico=citamedica.CodMedico
inner join especialidad on medico.CodEspecialidad=especialidad.CodEspecialidad
inner join persona as doctor on doctor.CI=medico.CI
inner join consultorio on medico.CodConsultorio=consultorio.CodConsultorio
inner join hospital on consultorio.CodHospital=hospital.CodHospital;

select hospital.Nombre, especialidad.Nombre from medico
inner join especialidad on medico.CodEspecialidad=especialidad.CodEspecialidad
inner join consultorio on medico.CodConsultorio=consultorio.CodConsultorio
inner join hospital on hospital.CodHospital=consultorio.CodHospital;

select seguro.Nombre, persona.Nombre1, persona.nombre2, persona.ApellidoPaterno, persona.ApellidoMaterno from seguro
inner join hospital on seguro.CodSeguro=hospital.CodSeguro
inner join consultorio on hospital.CodHospital = consultorio.CodHospital
inner join  medico on consultorio.CodConsultorio= medico.CodConsultorio
inner join persona on medico.CI = persona.CI;

select persona.Nombre1, persona.Nombre2, ApellidoPaterno, ApellidoMaterno, year(DATE_SUB(NOW(),INTERVAL year(persona.fechaDeNAcimiento) YEAR)) as edad from persona
inner join asegurado on (persona.CI = asegurado.CIDependiente and asegurado.CI<>0 and 24<year(DATE_SUB(NOW(),INTERVAL year(persona.fechaDeNAcimiento) YEAR)))