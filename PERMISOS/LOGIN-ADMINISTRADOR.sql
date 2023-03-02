CREATE LOGIN ADMINISTRADOR22 WITH PASSWORD='333'
GO

use SEMENSTRE
CREATE USER SOFIA for login ADMINISTRADOR22
go 

--todos los permisos
use SEMENSTRE
grant select, insert, delete, update  on INFORMACION_LABORAL TO SOFIA with grant option;
go