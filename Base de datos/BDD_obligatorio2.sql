USE master
GO

IF EXISTS(SELECT * FROM SysDataBases WHERE NAME='Obligatorio2')
begin
	DROP DATABASE Obligatorio2
end 
go

CREATE DATABASE Obligatorio2
GO

--creacion de usuario IIS para que el sitio pueda acceder a la bd------------------------
USE master
GO

CREATE LOGIN [IIS APPPOOL\DefaultAppPool] FROM WINDOWS 
GO

USE Obligatorio2
GO

CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool]
GO

exec sys.sp_addrolemember 'db_owner', [IIS APPPOOL\DefaultAppPool] --Va todo con db_owner?
go

-------------------------------TABLAS-----------------------------------------------------------

Create Table Companias
(
	NombreComp varchar(50) Primary key not null,
	Direccion varchar(100) not null,
	Telefono varchar(15) not null Check (Telefono not like '%[^0-9]%' and len(Telefono)>7)
)
go

Create Table Empleados
(
	Usuario varchar(8) primary key Check(Len(Usuario)=8),
	Pass varchar(6) not null check(Pass like '[A-Z]%[A-Z]%[A-Z]%'
					AND Pass like'%[0-9]%[0-9]%[0-9]%'
					And Len(Pass)=6),
	NombreCompleto varchar(50) not null	
)
go

Create Table Terminales
(
	Codigo varchar(6) primary key not null check (codigo not like '%[^a-z]%' AND LEN(codigo)=6),
	Ciudad varchar(50) not null,
	Pais varchar(50) not null
)
go

create Table Viajes
(
   CodigoInterno INT IDENTITY(1,1) PRIMARY KEY not null,
   FechaPartida DateTime not null check(FechaPartida > GetDate()),
   FechaLlegada DateTime not null,
   Pasajeros int not null check(Pasajeros between 1 and 50),
   Precio decimal not null check(Precio>0),
   Anden int not null check(Anden between 1 and 35),
   NombreComp varchar(50) not null,
   Usuario varchar(8) not null,
   FOREIGN KEY(NombreComp) REFERENCES Companias(NombreComp),
   FOREIGN KEY(Usuario) REFERENCES Empleados(Usuario),
   check (FechaPartida < FechaLlegada)
)
go

Create Table ViajeTerminal
(
	CodigoInterno int not null,
	CodigoTerminal varchar(6) not null,
	NroParada int not null check(NroParada > 0),
	FOREIGN KEY(CodigoInterno) REFERENCES Viajes(CodigoInterno),	
	FOREIGN KEY(CodigoTerminal) REFERENCES Terminales(Codigo),
	primary key (CodigoInterno,CodigoTerminal) 
	
)
go

----------------------------Ejemplos------------------------------------------------------------

Insert into Empleados(Usuario,Pass,NombreCompleto) values 
('Lucas123','asd123','Lucas Lutter'),
('Eddy1234','qwe123','Edmundo Griffin'),
('Diego123','zxc123','Diego Fernandez'),
('Emp12345','asd111','Empleado1'),
('Emp23456','asd112','Empleado2'),
('Emp34567','asd113','Empleado3'),
('Emp45678','asd114','Empleado4'),
('Emp56789','asd115','Empleado5'),
('Emp67891','asd116','Empleado6'),
('Emp78912','asd117','Empleado7')
go

Insert into Companias(NombreComp,Direccion,Telefono) values
('Buquebus','Guana 1315','29003945'),
('Jetmar','Independencia 1254','099123456'),
('Expreso Minuano','Maldonado 789','29014040'),
('Copsa','Rio Branco 1092','099123877'),
('Colonia Express','Colonia 687','099662778'),
('Cita','Durazno 222','22085762'),
('Intertur','Rua 100 solar 12','00343309949'),
('Turil','Gonzalo Ramirez 2255','099768364'),
('Ega','18 de Julio 1855','27010101'),
('Nunez','Almeria 2814','099122233')
go

Insert into Terminales(Codigo,Ciudad,Pais) values
('PayNor','Paysandu','Uruguay'),
('LaPazC','La Paz','Uruguay'),
('DurCen','Durazno','Uruguay'),
('MinLav','Minas','Uruguay'),
('FloCen','Florida','Uruguay'),
('Castil','Castillos','Uruguay'),
('ColSac','Colonia del Sacramento','Uruguay'),
('DolMer','Dolores','Uruguay'),
('TriCen','Trinidad','Uruguay'),
('FryBns','Fray Bentos','Uruguay'),
('Rochas','Rocha','Uruguay'),
('PteMal','Punta Del Este','Uruguay'),
('RioBco','Rio Branco','Uruguay'),
('AsuPar','Asuncion','Paraguay'),
('BsAirs','Buenos Aires','Argentina'),
('FloBra','Florianopolis','Brasil'),
('PtoAle','PortoAlegre','Brasil'),
('SgoChi','Santiago de Chile','Chile'),
('LimaPe','Lima','Peru'),
('CiuCor','Cordoba','Argentina'),
('BelUni','Bella Union','Uruguay'),
('Cambor','Camboriu','Brasil'),
('Guicho','Guichon','Uruguay'),
('MenArg','Mendoza','Argentina'),
('PasTor','Paso de los Toros','Uruguay'),
('MinCor','Minas de Corrales','Uruguay'),
('SanGPo','San Gregorio de polanco','Uruguay'),
('Saltos','Salto','Uruguay'),
('CiuCos','Ciudad de la Costa','Uruguay'),
('Rivera','Rivera','Uruguay'),
('Tacmbo','Tacuarembó','Uruguay'),
('MeloCL','Melo','Uruguay'),
('Artiga','Artigas','Uruguay'),
('Sorian','Soriano','Uruguay'),
('Tretre','Treinta y Tres','Uruguay'),
('SanCar','San Carlos','Uruguay'),
('Youngs','Young','Uruguay'),
('Carmel','Carmelo','Uruguay'),
('SanLuc','Santa Lucia','Uruguay'),
('JuanLA','Juan Lacaze','Uruguay'),
('Talita','Tala','Uruguay'),
('LaPalo','La Paloma','Uruguay'),
('JoPeVa','Jose Pedro Varela','Uruguay'),
('Tranqu','Tranqueras','Uruguay')
go

insert into Viajes(FechaPartida,Anden,NombreComp,FechaLlegada,Pasajeros,Precio,Usuario) values
('20231216 10:30:00',1,'Buquebus',			'20231216 12:00:00',45,1500,'Lucas123'),
('20231216 10:30:00',2,'Expreso Minuano',	'20231216 15:00:00',50,500,'Eddy1234'),
('20231216 10:30:00',3,'Copsa',				'20231216 12:00:00',30,300,'Emp23456'),
('20231215 10:30:00',4,'Cita',				'20231216 17:00:00',49,100,'Eddy1234'),
('20231215 10:30:00',5,'Expreso Minuano',	'20231216 18:00:00',45,700,'Emp12345'),
('20231215 10:30:00',6,'Jetmar',			'20231216 16:00:00',32,12000,'Eddy1234'),
('20231215 10:30:00',7,'Turil',				'20231216 20:00:00',40,400,'Diego123'),
('20231215 10:30:00',8,'Cita',				'20231216 13:00:00',23,800,'Lucas123'),
('20231215 10:30:00',9,'Intertur',			'20231216 18:00:00',40,900,'Emp34567'),
('20231215 10:30:00',10,'Expreso Minuano',	'20231216 17:00:00',35,500,'Emp67891'),
('20231215 10:30:00',11,'Colonia Express',	'20231216 16:00:00',38,800,'Emp12345'),
('20231215 10:30:00',12,'Ega',				'20231216 19:00:00',33,10000,'Emp23456'),
('20231215 10:30:00',13,'Expreso Minuano',	'20231216 15:00:00',45,400,'Eddy1234'),
('20231215 10:30:00',14,'Jetmar',			'20231216 21:00:00',34,12000,'Emp45678'),
('20231215 10:30:00',15,'Turil',			'20231216 12:00:00',30,500,'Lucas123'),
('20231215 10:30:00',16,'Cita',				'20231216 12:00:00',44,800,'Diego123'),
('20231215 10:30:00',17,'Nunez',			'20231216 16:00:00',24,900,'Eddy1234'),
('20231215 10:30:00',18,'Copsa',			'20231216 14:00:00',43,400,'Emp34567'),
('20231215 11:00:00',1,'Turil',				'20231216 19:00:00',33,10000,'Lucas123'),
('20231215 10:30:00',19,'Cita',				'20231216 18:00:00',45,700,'Emp23456'),
('20231215 10:30:00',20,'Expreso Minuano',	'20231216 20:00:00',50,500,'Emp12345'),
('20231215 10:30:00',21,'Buquebus',			'20231216 19:00:00',48,1500,'Diego123'),
('20231215 10:30:00',22,'Jetmar',			'20231216 08:00:00',49,12000,'Lucas123'),
('20231215 10:30:00',23,'Nunez',			'20231216 07:00:00',50,900,'Emp78912'),
('20231215 10:30:00',21,'Ega',				'20231216 21:00:00',50,10000,'Eddy1234'),
('20231215 10:30:00',24,'Turil',			'20231216 19:00:00',45,700,'Emp23456'),
('20231215 10:30:00',25,'Cita',				'20231216 15:00:00',47,900,'Emp34567'),
('20231215 10:30:00',26,'Expreso Minuano',	'20231216 18:00:00',42,400,'Lucas123'),
('20231215 10:30:00',27,'Nunez',			'20231216 19:00:00',45,800,'Emp56789'),
('20231215 10:30:00',28,'Intertur',			'20231216 20:00:00',45,500,'Eddy1234'),
('20231215 10:30:00',29,'Copsa',			'20231216 12:00:00',38,900,'Emp67891'),
('20231215 10:30:00',30,'Jetmar',			'20231216 20:00:00',45,12000,'Lucas123'),
('20231215 10:30:00',31,'Turil',			'20231216 20:30:00',33,700,'Diego123'),
('20231215 10:30:00',32,'Colonia Express',	'20231216 12:30:00',45,1500,'Emp12345'),
('20231215 10:30:00',33,'Cita',				'20231216 17:00:00',45,500,'Diego123'),
('20231215 10:30:00',34,'Expreso Minuano',	'20231216 19:30:00',45,400,'Diego123'),
('20231215 10:30:00',35,'Buquebus',			'20231216 16:00:00',42,900,'Diego123'),
('20231215 11:00:00',2,'Nunez',				'20231216 17:30:00',50,800,'Diego123'),
('20231215 11:00:00',3,'Cita',				'20231216 12:30:00',45,500,'Eddy1234'),
('20231215 11:00:00',4,'Jetmar',			'20231216 14:30:00',45,12000,'Emp45678'),
('20231215 11:00:00',5,'Buquebus',			'20231216 19:30:00',33,900,'Lucas123'),
('20231215 11:00:00',6,'Copsa',				'20231216 12:30:00',50,800,'Diego123'),
('20231215 11:00:00',7,'Nunez',				'20231216 09:30:00',45,700,'Emp23456'),
('20231215 11:00:00',8,'Turil',				'20231216 07:30:00',33,500,'Emp78912'),
('20231215 11:00:00',9,'Jetmar',			'20231216 06:00:00',42,900,'Emp56789'),
('20231215 11:00:00',10,'Expreso Minuano',	'20231216 05:00:00',45,400,'Diego123'),
('20231215 11:00:00',11,'Copsa',			'20231216 00:00:00',50,800,'Emp34567'),
('20231215 11:00:00',12,'Ega',				'20231216 23:00:00',45,10000,'Eddy1234'),
('20231215 11:00:00',13,'Jetmar',			'20231216 22:00:00',34,12000,'Lucas123'),
('20231215 11:00:00',14,'Buquebus',			'20231216 21:00:00',45,1500,'Emp12345'),
('20231215 11:00:00',15,'Cita',				'20231216 20:00:00',38,400,'Diego123'),
('20231215 11:00:00',16,'Copsa',			'20231216 19:00:00',45,900,'Diego123'),
('20231215 11:00:00',17,'Turil',			'20231216 18:00:00',33,400,'Emp23456'),
('20231215 11:00:00',18,'Expreso Minuano',	'20231216 17:00:00',38,600,'Diego123'),
('20231215 11:00:00',19,'Nunez',			'20231216 15:00:00',45,600,'Emp12345'),
('20231215 11:00:00',20,'Colonia Express',	'20231216 11:00:00',45,1500,'Emp67891'),
('20231215 11:00:00',21,'Cita',				'20231216 10:00:00',34,500,'Diego123'),
('20231215 11:00:00',22,'Jetmar',			'20231216 09:00:00',50,900,'Lucas123'),
('20231215 11:00:00',23,'Intertur',			'20231216 08:00:00',38,800,'Emp78912'),
('20231215 11:00:00',24,'Colonia Express',	'20231216 22:00:00',45,1500,'Eddy1234'),
('20231215 11:00:00',25,'Buquebus',			'20231216 00:00:00',45,1500,'Emp12345'),
('20231215 11:00:00',26,'Copsa',			'20231216 15:30:00',33,900,'Emp23456'),
('20231215 11:00:00',27,'Cita',				'20231216 14:30:00',42,900,'Diego123'),
('20231215 11:00:00',28,'Jetmar',			'20231216 19:30:00',34,12000,'Lucas123'),
('20231215 11:00:00',29,'Ega',				'20231216 12:30:00',50,10000,'Emp56789'),
('20231215 11:00:00',35,'Expreso Minuano',	'20231216 12:00:00',34,700,'Eddy1234')
go

insert into ViajeTerminal(CodigoInterno, CodigoTerminal, NroParada) values
(1,'Paynor',1),
(1,'DurCen',2),
(1,'MinLav',3),
(1,'FloCen',4),
(1,'Castil',5),
(2,'Talita',1),
(2,'LaPalo',2),
(2,'Tranqu',3),
(2,'BelUni',4),
(3,'DurCen',1),
(3,'MinLav',2),
(3,'FloCen',3),
(3,'Castil',4),
(3,'Rochas',5),
(4,'Rochas',1),
(5,'PteMal',1),
(6,'RioBco',1),
(7,'BelUni',1),
(8,'Guicho',1),
(9,'PasTor',1),
(10,'SanGPo',1),
(11,'CiuCos',1),
(12,'Rivera',1),
(13,'Tacmbo',1),
(14,'Sorian',1),
(15,'SanCar',1),
(16,'Youngs',1),
(17,'SanLuc',1),
(18,'JuanLA',1),
(19,'Talita',1),
(20,'LaPalo',1),
(21,'Tranqu',1),
(22,'PayNor',1),
(23,'FloCen',1),
(24,'DurCen',1),
(25,'LaPazC',1),
(26,'FloCen',1),
(27,'Castil',1),
(28,'DolMer',1),
(29,'FryBns',1),
(30,'Rochas',1),
(31,'PteMal',1),
(32,'RioBco',1),
(33,'BelUni',1),
(34,'Guicho',1),
(35,'PasTor',1),
(36,'CiuCor',1),
(37,'CiuCos',1),
(38,'Rivera',1),
(39,'Tacmbo',1),
(40,'Sorian',1),
(41,'SgoChi',1),
(42,'Youngs',1),
(43,'SanLuc',1),
(44,'JuanLA',1),
(45,'Talita',1),
(46,'LaPalo',1),
(47,'Tranqu',1),
(48,'LaPazC',1),
(49,'AsuPar',1),
(50,'FloCen',1),
(51,'FloCen',1),
(52,'AsuPar',1),
(53,'PtoAle',1),
(54,'FloCen',1),
(55,'FloCen',1),
(56,'LimaPe',1),
(57,'Cambor',1),
(58,'SanGPo',1),
(59,'SanLuc',1),
(60,'Youngs',1),
(61,'Rivera',1),
(62,'Tranqu',1),
(63,'Castil',1),
(64,'PteMal',1),
(65,'BsAirs',1),
(66,'FloCen',1)
go


---------------------------Stored Procedures-------------------------------------------------------------



--Alta y Eliminar Compania--
create proc AltaCompania
@nom varchar (50),
@dir Varchar(100),
@tel varchar(15),
@ret int output
as
begin 
	if exists (select * from Companias where NombreComp = @nom)
		begin
			set @ret = -1
			return
		end
		
	insert Companias(NombreComp,Direccion,Telefono) values (@nom,@dir,@tel) 
		set @ret = 1
end
go


create proc EliminarCompania
@nom varchar(50),
@ret int output
as
begin 
	if exists(select * from Viajes where NombreComp = @nom)
		begin
			set @ret = -1
			return
		end
	
	if not exists(select * from Companias where NombreComp = @nom)
		begin
			set @ret = -2
			return
		end
	
	delete from Companias where NombreComp = @nom
		set @ret = 1
				
end 
go
		


--Alta y Eliminar Terminal --
create proc AltaTerminal
@cod varchar (6),
@ciudad varchar(50),
@pais varchar(50),
@ret int output
as
begin 
	if exists (select * from Terminales where Codigo = @cod)
		begin
			set @ret = -1
			return
		end
	
	insert Terminales (codigo,ciudad,pais)values(@cod,@ciudad,@pais)
		set @ret = 1
			
end
go


create proc EliminarTerminal
@cod varchar (6),
@ret int output
as
begin 
	if not exists (select * from Terminales  where Codigo = @cod)
		begin
			set @ret = -1
			return
		end
	
	if exists(select * From ViajeTerminal Where CodigoTerminal=@cod)
		begin
			set @ret = -2
			return
		end			
							
				
	delete from Terminales where Codigo = @cod
			set @ret = 1

end
go
