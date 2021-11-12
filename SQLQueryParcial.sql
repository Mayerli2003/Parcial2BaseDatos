create database VeterinariaBD;

/*Mayerli Azucena Montalvo Martinez */

use VeterinariaBD;
/*---------------------------------------------------------------------------------------------*/
create table DueñoMascota(
dmId  int primary key identity (1,1) not null,
NumIdentidad int not null unique,
nombre varchar (50) not null,
apellido varchar (50) not null,
direccion int foreign key references direccion(dirId) not null,
telefono int
);
insert into DueñoMascota values(123, 'Carla ','Lopez ',1,1233565);
insert into DueñoMascota values(234,'Fredy','Perez' ,2,3456765);
insert into DueñoMascota values(345,'Enma', 'Monterroza ',2,34576955);
insert into DueñoMascota values(456,'Carlos','Montalvo' ,3,4565683);
insert into DueñoMascota values(567,'Kevin','Cerrano',4,5673437);
insert into DueñoMascota values(678, 'Cesia ','Castillo ',5,67838457);



create table direccion(
dirId int primary key identity(1,1) not null,
direccion varchar (50) not null,
departamentoN int foreign key references departamento(depId) not null,
codigoPostal int not null
);
insert into direccion values( 'Calle poniente ',1,123);
insert into direccion values('Frende a la despensa',6 ,234);
insert into direccion values('Entre el banco y el pollo campero' ,2,345);
insert into direccion values('Calle numero 3' ,3,456);
insert into direccion values( 'Kilometro 74 ',4,567);
insert into direccion values( 'Calle poniente kilometro 10 ',5,678);



create table departamento(
depId int primary key identity(1,1) not null,
departamentoN varchar (50) not null unique, 
municipioN int foreign key references municipio(munId) not null,
);
insert into departamento values( 'Chalatenango',1);
insert into departamento values('Ahuachapan ',6 );
insert into departamento values('San Salvador' ,2);
insert into departamento values('La union  ' ,3);
insert into departamento values( 'Cabañas ',4);
insert into departamento values( 'San Miguel ',5);

create table municipio(
munId int primary key identity(1,1) not null,
municipioN varchar (50) not null unique
);
insert into municipio values( 'Chalatenango');
insert into municipio values('Agua Caliente' );
insert into municipio values('Concepcion' );
insert into municipio values('La nueva ' );
insert into municipio values( 'San Isidro ');
insert into municipio values( 'Upatoro ');


/*---------------------------------------------------------------------------------------------*/


drop table Mascota 
create table Mascota(
masId int primary key identity(1,1) not null,
niMascota varchar(50) not null,
nombre varchar(50) not null,
tipoMascota int foreign key references TIpoMascota(tmId) not null,
raza int foreign key references raza(razaId) not null,
Observacion varchar (225) not null

);
insert into Mascota values('24-67','lii',1,1, 'Alergico a los analgesicos ');
insert into  Mascota values('6-790', 'liou',2,2, 'Alergico a la penicilina');
insert into Mascota values('6-769', 'Lopez',3,3, 'Alergica a los analgesicos');
insert into Mascota values('35-89', 'Pirulin',4,4, 'Alergico a anticonvulsivos');
insert into Mascota values('5-569', 'Rodri',5,5,'Alergico a la aspirina');
insert into Mascota values('4-890', 'Momo',6,6, 'Alergico a la ibuprofeno');

insert into Mascota values('480-5', 'Monta',5,1, 'Alergico al mani');
insert into Mascota values('14-34', 'Fufu',4,3, 'Alergico al naproxeno');
insert into Mascota values('36-890', 'Cale',3,4, 'Alergico a los medicamentos de quimioterapia');
insert into Mascota values('34-78', 'Cici',2,5, 'Alergico a la anestesia');
insert into Mascota values('346-0', 'Asti',1,2, 'Alergico a anticonvulsivos');
insert into Mascota values('25-58', 'Ato',2,2, 'Alergico a anticonvulsivos');
insert into Mascota values('36-89', 'Nuni',3,4, 'Alergico a anticonvulsivos');







create table raza(
razaId int primary key identity(1,1) not null,
Raza varchar (50)  not null,
);
insert into raza values( 'Puro ingles');
insert into raza values('Arabe' );
insert into raza values('Shire' );
insert into raza values('Poodle' );
insert into raza values( 'Labrador ');
insert into raza values( 'Golden retriver ');


create table TipoMascota(
tmId int primary key identity(1,1) not null, 
tipoMacotaN varchar (50) not null,
);

insert into TipoMascota values( 'Cabra');
insert into TipoMascota values( 'Caballo');
insert into TipoMascota values( 'Vaca');
insert into TipoMascota values( 'Conejo');
insert into TipoMascota values( 'Perro albino');
insert into TipoMascota values( 'Gato');

/*---------------------------------------------------------------------------------------------*/

Create table Veterinario(
CodigoIdentificacionVeterinario int primary key identity(1,1) not null,
Nombre varchar(20) not null,
Apellido varchar(20) not null,
Cargo varchar (20) not null,
 
);
insert into Veterinario values( 'Rigoberto', 'Montalvo','Asistente');
insert into Veterinario values( 'Ricardo', 'Martinez','Especialista');
insert into Veterinario values( 'Karla', 'Lopez','Especialista');
insert into Veterinario values( 'Lila', 'Perez','Asistente');
insert into Veterinario values( 'Judith', 'Rodrigues','Especialista');

select* from Veterinario




create table ingreso(
id int primary key identity (1,1) not null,
Motivo varchar (20) not null,
fechaDeIngreso date not null,
observaciones  varchar(50) not null,
veterinario int foreign key references Veterinario(CodigoIdentificacionVeterinario) not null,
Dueño int foreign key references DueñoMascota (dmId) not null, 
Mascota int foreign key references Mascota (masId) not null,

)
insert into ingreso values('Fiebre','14-06-16',  'Alergico al mani',11,2,1);
insert into ingreso values('Respiratoria ','14-04-17','Alergico al naproxeno',12,2,2);
insert into ingreso values('Fiebre','30-08-19', 'Alergico a los medicamentos de quimioterapia',13,3,3);
insert into ingreso values('Fiebre','30-09-21','Alergico a la anestesia',14,4,4);
insert into ingreso values('Fiebre','30-09-21',  'Alergico a anticonvulsivos',15,5,5);
insert into ingreso values('Fiebre ','30-09-21',  'Alergico a anticonvulsivos',13,5,6);

insert into ingreso values('Respiratorio','14-06-16',  'Alergico al mani',11,1,1);
insert into ingreso values('Respiratoria ','14-02-17','Alergico al naproxeno',12,3,2);
insert into ingreso values('Fiebre','30-04-19', 'Alergico a los medicamentos de quimioterapia',13,4,3);
insert into ingreso values('Fiebre','30-09-21','Alergico a la anestesia',14,4,4);
insert into ingreso values('Fiebre','30-03-21',  'Alergico a anticonvulsivos',15,5,6);
insert into ingreso values('Fiebre ','30-01-21',  'Alergico a anticonvulsivos',13,1,6);

insert into ingreso values('Fiebre','20-03-21',  'Alergico a anticonvulsivos',15,4,6);
insert into ingreso values('Fiebre ','01-01-21',  'Alergico a anticonvulsivos',11,1,6);



