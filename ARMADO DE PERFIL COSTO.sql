select * from costo.perfil_costo
id_perfil_costo nombre               descripcion                                                                                                                                                                                              fecha_creacion          fecha_baja              vigente
--------------- -------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------- ----------------------- -------
1               CIF                  COMPOSICION Y DETALLE DE CIF                                                                                                                                                                             2023-05-16 12:46:00     NULL                    1
3               IVA                  BASE IMPONIBLE IVA USD                                                                                                                                                                                   2023-05-16 23:43:00     NULL                    1
4               NACIONALIZACION      TOTAL GASTOS NACIONALIZACION                                                                                                                                                                             2023-05-16 23:43:00     NULL                    1
5               DIMP                 DERECHOS DE IMPORTACION         

select * from relacion.Perfil_Concepto
delete from relacion.Perfil_Concepto where id_perfil_costo=9
delete from  costo.perfil_costo where id_perfil_costo=10

INSERT INTO costo.perfil_costo(nombre,descripcion,fecha_creacion,vigente)
VALUES('EXW','EX WORK solo cubre el costo de producción y entrega de la mercancía en el lugar de origen acordado',getdate(),1)
INSERT INTO relacion.Perfil_Concepto(id_perfil_costo,id_concepto_header,enlace_concepto)
VALUES(6,1,1)


INSERT INTO costo.perfil_costo(nombre,descripcion,fecha_creacion,vigente)
VALUES('FOB','costo incluye la entrega en el puerto de origen',getdate(),1)
INSERT INTO relacion.Perfil_Concepto(id_perfil_costo,id_concepto_header,enlace_concepto)
VALUES(8,1,2)
INSERT INTO relacion.Perfil_Concepto(id_perfil_costo,id_concepto_header,enlace_concepto)
VALUES(8,16,2)

INSERT INTO costo.perfil_costo(nombre,descripcion,fecha_creacion,vigente)
VALUES('CFR','costo incluye el transporte marítimo y seguro hasta el puerto de destino',getdate(),1)
INSERT INTO relacion.Perfil_Concepto(id_perfil_costo,id_concepto_header,enlace_concepto)
VALUES(9,2,3)
INSERT INTO relacion.Perfil_Concepto(id_perfil_costo,id_concepto_header,enlace_concepto)
VALUES(9,16,3)
INSERT INTO relacion.Perfil_Concepto(id_perfil_costo,id_concepto_header,enlace_concepto)
VALUES(9,21,3)

select * from relacion.perfil_concepto
select * from costo.Concepto_Header
delete from relacion.perfil_concepto where id_perfil_concepto=23

select * from costo.perfil_costo


update relacion.perfil_concepto set id_concepto_header=3 where id_perfil_concepto=22



INSERT INTO costo.perfil_costo(nombre,descripcion,fecha_creacion,vigente)
VALUES('CFR 2','costo incluye el transporte marítimo y seguro hasta el puerto de destino con doble ajuste',getdate(),1)


INSERT INTO relacion.Perfil_Concepto(id_perfil_costo,id_concepto_header,enlace_concepto)
VALUES(11,3,3)
INSERT INTO relacion.Perfil_Concepto(id_perfil_costo,id_concepto_header,enlace_concepto)
VALUES(11,18,3)
INSERT INTO relacion.Perfil_Concepto(id_perfil_costo,id_concepto_header,enlace_concepto)
VALUES(11,21,3)