create database VeterinariaBD;

/*Mayerli Azucena Montalvo Martinez */

use VeterinariaBD;

create table DueñoMascota(
dmId  int primary key identity (1,1) not null,
NumIdentidad int not null unique,
nombre varchar (50) not null,
apellido varchar (50) not null,
direccion int foreign key references direccion(dirId) not null,
telefono int
);

create table direccion(
dirId int primary key identity(1,1) not null,
direccion varchar (50) not null,
departamentoN int foreign key references departamento(depId) not null,
codigoPostal int not null
);

create table departamento(
depId int primary key identity(1,1) not null,
departamentoN varchar (50) not null unique, 
municipioN int foreign key references municipio(munId) not null,
);

create table municipio(
munId int primary key identity(1,1) not null,
municipioN varchar (50) not null unique
);

create table Mascota(
masId int primary key identity(1,1) not null,
niMascota varchar(5) not null,
nombre varchar(50) not null,
tipoMascota varchar (50) not null,
raza int foreign key references raza(razaId) not null,
Observacion varchar (225) not null

);
create table raza(
razaId int primary key identity(1,1) not null, 
tipoMascotaN int foreign key references TipoMascota(tmId)  not null,
);
drop table Mascota
create table TipoMascota(
tmId int primary key identity(1,1) not null, 
tipoMacotaN varchar (50) not null,
);

Create table Veterinario(
CodigoIdentificacionVeterinario int primary key identity(1,1) not null,
Nombre varchar(50) not null,
Apellido varchar(50) not null,
Cargo int  foreign key references DetalleCargo(idCargo) not null ,
ingresos date foreign key references ingresos (fechaDeIngreso)

);

Create table DetalleCargo(
idCargo int primary key not null,
Cargo varchar(50) not null
);
drop table ingresos
Create table ingresos(
Motivo varchar(50) not null,
fechaDeIngreso date not null primary key,
observaciones  varchar(50) not null,
MacotaPaciente int foreign key references Mascota (masId) not null,

);


