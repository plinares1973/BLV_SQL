USE BLV
TRUNCATE TABLE compra.Orden_compra
TRUNCATE TABLE compra.Orden_compra_producto
TRUNCATE TABLE Compra.Certificado_COA

TRUNCATE TABLE Relacion.compra_estado
TRUNCATE TABLE Relacion.Hoja_fab_estado
TRUNCATE TABLE Relacion.oc_producto_empaque
TRUNCATE TABLE Relacion.oc_producto_medida
TRUNCATE TABLE Relacion.costo_oc
TRUNCATE TABLE Relacion.orden_compra_envio
TRUNCATE TABLE Relacion.orden_compra_lote
TRUNCATE TABLE Relacion.producto_compra
TRUNCATE TABLE Relacion.Stock_Cuarentena

TRUNCATE TABLE Relacion.proveedor_ordencompra
TRUNCATE TABLE produccion.producto
TRUNCATE TABLE relacion.lote_producto
TRUNCATE TABLE relacion.lote_stock



truncate table produccion.producto
truncate table relacion.lote_producto
truncate table compra.lote
truncate table relacion.orden_compra_lote
truncate table relacion.Lote_Stock
/*
update produccion.stock set disponible=1
truncate table costo.secuencia_perfil

truncate table costo.perfil_costo
truncate table relacion.perfil_concepto

*/
/*
select * from proceso.Estado

select * from produccion.Hoja_Fabricacion_Header
select * from relacion.Hoja_Fab_Estado
select * from proceso.Hoja_Fabricacion
*/
truncate table produccion.hoja_fabricacion_header
truncate table  relacion.Hoja_Fab_Estado
truncate table  proceso.Hoja_Fabricacion
truncate table proceso.tablon_impacto_stock

truncate table proceso.tablon_impacto_deposito
truncate table proceso.relacion_tablones
truncate table proceso.costo_a_calcular