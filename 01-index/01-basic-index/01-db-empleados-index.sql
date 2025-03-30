select * from Empleados;

-- Create Clustered Index
create clustered index I_id
on Empleados (IdEmpleado);

-- Create Clustered Index multiple columns
create clustered index I_id_sal
on Empleados (IdEmpleado, salario);

-- Create Non Clustered Index
create nonclustered index I_edadEmpleado
on Empleados (Edad);

-- Rename Index
exec sp_rename 'Empleados.I_id', 'I_idEmpleado', 'INDEX';

-- Delete Index
drop index I_idEmpleado on Empleados;