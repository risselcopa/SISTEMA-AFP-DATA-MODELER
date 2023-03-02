CREATE LOGIN TECNICO WITH PASSWORD='222'
GO

use SEMENSTRE
CREATE USER ANA for login TECNICO
go 

--tiene los privilegios de insertar, modificar y anular 
use SEMENSTRE
grant insert, update, DELETE on TRABAJADOR_AFILIADO TO ANA with grant option;
go