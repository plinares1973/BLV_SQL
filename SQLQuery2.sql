truncate table produccion.producto
truncate table relacion.lote_producto
truncate table compra.lote
truncate table relacion.orden_compra_lote
truncate table relacion.Lote_Stock
update produccion.stock set disponible=1

select * from produccion.producto
select * from relacion.lote_producto
select * from compra.lote
select * from relacion.orden_compra_lote
select * from relacion.Lote_Stock
--NO TRUNCAR
select * from produccion.Stock