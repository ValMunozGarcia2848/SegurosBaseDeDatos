-- MedicamentosEnFarmacias
select farmacia.NombreFarmacia, medicamento.NombreMedicamento from medicamento 
inner join farmacia_medicamentos on medicamento.CodMedicamento=farmacia_medicamentos.CodMedicamento
inner join farmacia on farmacia.CodFarmacia=farmacia_medicamentos.CodFarmacia