SELECT P.plantaID, NombreEsp, razonTraslado
FROM plantas P, especie E, planta_especie PE, traslado T
WHERE PE.plantaID = P.plantaID AND P.trasladoID = T.trasladoID AND E.EspID = PE.EspID
GROUP BY NombreEsp

CREATE VIEW plantas_madre (NombreEsp, EspID, fecha, cantidadPlantasMadre, imagen) as
SELECT NombreEsp, E.EspID, PM.fecha, COUNT(PM.plantaMadreID) as cantidadPlantasMadre, imagen
FROM especie E, plantasmadreactivas PM, plantamadre_especie PME
WHERE E.EspID = PME.EspID AND PM.plantaMadreID = PME.plantaMadreID
GROUP BY E.EspID

CREATE VIEW lotes_plantula (NombreEsp, EspID, fecha, cantidadLotesPlantulas) as
SELECT NombreEsp, E.EspID, LP.fecha, COUNT(LP.lotePlantulaID) as cantidadLotesPlantulas
FROM especie E, plantulasactivas LP, loteplantula_especie LPE
WHERE E.EspID = LPE.EspID AND LP.lotePlantulaID = LPE.lotePlantulaID
GROUP BY E.EspID

CREATE VIEW cantidad_plantas (NombreEsp, EspID, fecha, cantidadPlantas) as
SELECT NombreEsp, E.EspID, P.fecha, COUNT(P.plantaID) as cantidadPlantas
FROM especie E, plantasactivas P, planta_especie PE
WHERE E.EspID = PE.EspID AND P.plantaID = PE.plantaID
GROUP BY E.EspID

CREATE VIEW lotes_semillas (NombreEsp, EspID, fecha, cantidadSemillas) as
SELECT NombreEsp, E.EspID, S.fecha, COUNT(S.loteSemillaID) as cantidadSemillas
FROM especie E, semillasactivas S, lotesemillas_especie LSE
WHERE E.EspID = LSE.EspID AND S.loteSemillaID = LSE.loteSemillaID
GROUP BY E.EspID

CREATE VIEW tarjetas (NombreEsp, cantidadPlantasMadre, cantidadPlantasReproducidas) as
select 
    plantas_madre.NombreEsp, plantas_madre.cantidadPlantasMadre, IFNULL( plantas.cantidadPlantasReproducidas, 0) as cantidadPlantasReproducidas
from plantas_madre 
left outer join plantas
  on plantas_madre.NombreEsp = plantas.NombreEsp
union all
select 
     plantas.NombreEsp, IFNULL(plantas_madre.cantidadPlantasMadre, 0), plantas.cantidadPlantasReproducidas
from plantas 
left outer join plantas_madre
  on plantas_madre.NombreEsp = plantas.NombreEsp
where 
    plantas_madre.cantidadPlantasMadre IS NULL


CREATE VIEW tarjetas2 (NombreEsp, cantidadPlantasMadre, cantidadPlantasReproducidas, cantidadLotesPlantulas) as
select 
    plantas_madre.NombreEsp, plantas_madre.cantidadPlantasMadre, IFNULL( plantas_reproducidas.cantidadPlantasReproducidas, 0) as cantidadPlantasReproducidas, IFNULL(lotes_plantula.cantidadLotesPlantulas,0) as cantidadLotesPlantulas
from plantas_madre
left outer join plantas_reproducidas on plantas_madre.NombreEsp = plantas_reproducidas.NombreEsp
left outer join lotes_plantula on plantas_madre.NombreEsp = lotes_plantula.NombreEsp
union all
select 
     plantas_reproducidas.NombreEsp, IFNULL(plantas_madre.cantidadPlantasMadre, 0), plantas_reproducidas.cantidadPlantasReproducidas, IFNULL(lotes_plantula.cantidadLotesPlantulas,0)
from plantas_reproducidas 
left outer join plantas_madre on plantas_madre.NombreEsp = plantas_reproducidas.NombreEsp
left outer join lotes_plantula on lotes_plantula.NombreEsp = plantas_reproducidas.NombreEsp
union all 
select
	lotes_plantula.NombreEsp, IFNULL(plantas_madre.cantidadPlantasMadre, 0), IFNULL( plantas_reproducidas.cantidadPlantasReproducidas, 0), lotes_plantula.cantidadLotesPlantulas
from lotes_plantula
left outer join plantas_madre on plantas_madre.NombreEsp = lotes_plantula.NombreEsp
left outer join plantas_reproducidas on plantas_reproducidas.NombreEsp = lotes_plantula.NombreEsp
where 
    plantas_madre.cantidadPlantasMadre IS NULL AND plantas_reproducidas.cantidadPlantasReproducidas IS NULL



CREATE VIEW tarjetas (NombreEsp, EspID, fecha, cantidadPlantasMadre, cantidadPlantas, cantidadLotesPlantulas, cantidadLotesSemillas, imagen) as
select 
    plantas_madre.NombreEsp, plantas_madre.EspID, plantas_madre.fecha, plantas_madre.cantidadPlantasMadre, IFNULL( cantidad_plantas.cantidadPlantas, 0) as cantidadPlantas, IFNULL(lotes_plantula.cantidadLotesPlantulas,0) as cantidadLotesPlantulas, IFNULL(lotes_semillas.cantidadSemillas, 0) as cantidadSemillas, plantas_madre.imagen
from plantas_madre
left outer join cantidad_plantas on plantas_madre.NombreEsp = cantidad_plantas.NombreEsp
left outer join lotes_plantula on plantas_madre.NombreEsp = lotes_plantula.NombreEsp
left outer join lotes_semillas on plantas_madre.NombreEsp = lotes_semillas.NombreEsp

union all

select 
     cantidad_plantas.NombreEsp, cantidad_plantas.EspID, cantidad_plantas.fecha, IFNULL(plantas_madre.cantidadPlantasMadre, 0), cantidad_plantas.cantidadPlantas, IFNULL(lotes_plantula.cantidadLotesPlantulas,0), IFNULL(lotes_semillas.cantidadSemillas,0), plantas_madre.imagen
from cantidad_plantas 
left outer join plantas_madre on plantas_madre.NombreEsp = cantidad_plantas.NombreEsp
left outer join lotes_plantula on lotes_plantula.NombreEsp = cantidad_plantas.NombreEsp
left outer join lotes_semillas on lotes_semillas.NombreEsp = cantidad_plantas.NombreEsp

union all

select
	lotes_plantula.NombreEsp, lotes_plantula.EspID, lotes_plantula.fecha, IFNULL(plantas_madre.cantidadPlantasMadre, 0), IFNULL( cantidad_plantas.cantidadPlantas, 0), lotes_plantula.cantidadLotesPlantulas, IFNULL(lotes_semillas.cantidadSemillas,0), plantas_madre.imagen
from lotes_plantula
left outer join plantas_madre on plantas_madre.NombreEsp = lotes_plantula.NombreEsp
left outer join cantidad_plantas on cantidad_plantas.NombreEsp = lotes_plantula.NombreEsp
left outer join lotes_semillas on lotes_semillas.NombreEsp = lotes_plantula.NombreEsp

union all

select
	lotes_semillas.NombreEsp, lotes_semillas.EspID, lotes_semillas.fecha, IFNULL(plantas_madre.cantidadPlantasMadre, 0), IFNULL( cantidad_plantas.cantidadPlantas, 0), IFNULL(lotes_plantula.cantidadLotesPlantulas,0), lotes_semillas.cantidadSemillas, plantas_madre.imagen
from lotes_semillas
left outer join plantas_madre on plantas_madre.NombreEsp = lotes_semillas.NombreEsp
left outer join cantidad_plantas on cantidad_plantas.NombreEsp = lotes_semillas.NombreEsp
left outer join lotes_plantula on lotes_plantula.NombreEsp = lotes_semillas.NombreEsp

where 
    plantas_madre.cantidadPlantasMadre IS NULL AND cantidad_plantas.cantidadPlantas IS NULL AND lotes_semillas.cantidadSemillas IS NULL AND plantas_madre.imagen IS NULL
group by plantas_madre.NombreEsp