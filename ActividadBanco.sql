create procedure sp_return_cuenta
as
select * from Cliente c  join Cuenta cu on c.dni = cu.dni


create procedure sp_insert_cuenta
(@cbu int,@saldo int,@tipoCuenta int,@ultimoMovimiento int,@dni int ) 
as
insert into Cuenta (cbu,saldo,tipoCuenta,ultimoMovimiento,dni,estado) values ( @cbu,@saldo,@tipoCuenta,@ultimoMovimiento,@dni,1)

create procedure sp_insert_cliente
(@dni int,@nombre varchar(30),@apellido varchar(30))
as
insert into Cliente (dni,nombre,apellido) values (@dni,@nombre,@apellido)

create procedure sp_tabla_cliente
as 
select * from Cliente
where estado = 1

drop procedure sp_tabla_cliente
create procedure sp_tabla_Cuenta
as
select * from Cuenta
where estado = 1

select * from Cuenta
where estado = 1
execute sp_tabla_Cuenta

create procedure sp_tabla_tipo
as
select * from TipoCuenta

create procedure sp_cuenta_estado_habilitar
(@dni int)
as
update cuenta
set estado = 1
where dni = @dni 

create procedure sp_cuenta_estado_deshabilitar
(@dni int)
as
update cuenta
set estado = 0
where dni = @dni 

select *
from cuenta

create procedure sp_cliente_estado_habilitar
(@dni int)
as
update cliente
set estado = 1
where dni = @dni 

create procedure  sp_select_group_cuenta_tipo_cuentacorriente
as 
select count(t.tipoCuenta) 'cantidad',t.nombre 
from Cuenta c join TipoCuenta t on c.tipoCuenta = t.tipoCuenta
 group by t.tipoCuenta,t.nombre
 having t.tipoCuenta = 3
 
 

 