-- 1. Lista el nombre y apellido de los empleados, su sueldo y el nombre del departamento donde trabaja.
SELECT d.departamento, e.nombre, e.apellido, e.sueldo FROM departamento d
JOIN empleado e
ON d.pk_departamento = e.fk_departamento;

-- 2. Lista el nombre y apellido de los empleados, su fecha de contrato y el nombre del cargo.
SELECT e.nombre, e.apellido, e.fecha_contrato, c.cargo FROM cargo c
JOIN empleado e
ON c.pk_cargo = e.fk_cargo;






