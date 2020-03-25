select persona.nombre1, persona.nombre2, persona.apellidoPaterno, persona.apellidoMaterno, diagnostico.Diagnostico from persona
inner join asegurado on persona.CI = asegurado.CIDependiente
inner join citamedica on asegurado.Matricula = citamedica.Matricula
inner join consultamedica on citamedica.CodCitaMedica=consultamedica.CodCitaMedica
inner join signosvitales on signosvitales.CodSignosVitales=consultamedica.CodSignosVitales and 
	(Respiracion<11 or Respiracion >19 or pulso<60 or Pulso>100 or Temperatura<35 or Temperatura>37 or PresionSistolica<90 or PresionSistolica> 120 or PresionDistolica<60 or PresionDistolica>90)
inner join diagnostico on diagnostico.CodDiagnostico = consultamedica.CodDiagnostico