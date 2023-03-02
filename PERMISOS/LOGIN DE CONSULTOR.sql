CREATE LOGIN CONSULTOR2 WITH PASSWORD='555'
GO

use SEMENSTRE
CREATE USER abi for login consultor2
go 

--permiso consulta
use SEMENSTRE

grant select on EXAMEN_CLINICO TO abi with grant option;
go