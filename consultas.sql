SELECT documentacion FROM cliente WHERE nombre = 'Ivan Rafael';
UPDATE cliente SET IBAN = 'ES76 7738 8892 9902 0012 6372 0938' WHERE documentacion = 'Z1038513E';
UPDATE suscripcion SET precio = precio * 0.9;
UPDATE suscripcion SET modelo = 'FLACO' WHERE modelo = 'BASICA';

DELETE FROM actividad WHERE fecha < '2024-12-12';

SELECT equipamiento.id_equipamiento AS Equipamiento_No_Asignado FROM equipamiento LEFT JOIN gimnasio_equipamient
o ON equipamiento.id_equipamiento = gimnasio_equipamiento.id_equipamiento WHERE gimnasio_equipamiento.id_gimnasio IS NULL;
DELETE FROM equipamiento WHERE id_equipamiento IN(18,43);