-- 1. Lista el nombre y apellido de los empleados, su sueldo y el nombre del departamento donde trabaja.
SELECT d.departamento, e.nombre, e.apellido, e.sueldo FROM departamento d
JOIN empleado e
ON d.pk_departamento = e.fk_departamento;

SELECT nombre, apellido, sueldo, fk_departamento
FROM empleado;





