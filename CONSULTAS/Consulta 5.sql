-- ASeguradosQueDebenGestionarSuIndependencia
Select persona.Nombre1, persona.Nombre2, ApellidoPaterno, ApellidoMaterno, 
year(DATE_SUB(NOW(),INTERVAL year(persona.fechaDeNAcimiento) YEAR)) as edad from persona
inner join asegurado on (persona.CI = asegurado.CI and asegurado.CI<>0 
and 24<year(DATE_SUB(NOW(),INTERVAL year(persona.fechaDeNAcimiento) YEAR)));