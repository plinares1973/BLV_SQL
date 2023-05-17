select 
	* 
from 
	proceso.Tablon_Impacto_Stock tis
	,proceso.Relacion_Tablones rt
	,proceso.Tablon_Impacto_Deposito tid
where
	tis.id_tablon_impacto_stock=rt.id_tablon_impacto_stock
	and tid.id_tablon_impacto_deposito=rt.id_tablon_impacto_deposito

