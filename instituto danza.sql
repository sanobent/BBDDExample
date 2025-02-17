/*creacion schema*/
CREATE schema IF NOT EXISTS InstitutoDanza2;
use institutodanza2;
/*Tabla ALUMNOS */
CREATE TABLE IF NOT EXISTS	ALUMNOS (
IDalumnos int not null primary key auto_increment,
nombre varchar(255) not null,
apellido varchar(255) not null,
email varchar(255) not null,
edad varchar(255) not null,
telefono varchar(255) not null );

/*Tabla ESPECIALIDAD */
alter table especialidad change nombre tipo varchar(255) not null;
 CREATE TABLE IF NOT EXISTS ESPECIALIDAD (
 IDespecialidad int not null primary key auto_increment,
nombre varchar(255) not null);
 INSERT INTO ESPECIALIDAD (IDespecialidad,Nombre) values
 ('1','Contemporaneo'),
 ('2','Jazz'),('3','Breakdance'),('4','Hiphop'),('5','Clasico'),('6','DanceHall'),('7','Arabe'),('8','Reggeaton'),('9','Fusion'),('10','Acrodance'),('11','Heels'),('12','Urban');
 
 /*Tabla GENERODANZA */
 CREATE TABLE IF NOT EXISTS GENERODANZA (
IDgenerodanza int not null primary key auto_increment,
nombre varchar(255) not null  );
INSERT INTO GENERODANZA (IDgenerodanza,Nombre) values
 ('1','Contemporaneo'),
 ('2','Jazz'),('3','Breakdance'),('4','Hiphop'),('5','Clasico'),('6','DanceHall'),('7','Arabe'),('8','Reggeaton'),('9','Fusion'),('10','Acrodance'),('11','Heels'),('12','Urban');
 /*Tabla SEDES */
CREATE TABLE IF NOT EXISTS SEDES (
IDsedes int not null primary key auto_increment,
Direccion varchar(255) not null,
Calles varchar(250) not null );

 /*Tabla cuotamensual */
drop table cuotamensual;
 CREATE TABLE IF NOT EXISTS CUOTAMENSUAL (
 IDcuotamensual INT NOT NULL primary key auto_increment,
PRECIO varchar(255)  not null,
DuracionClase text not null,
IDgenerodanza int not null,
 FOREIGN KEY (IDgenerodanza) references  GENERODANZA(IDgenerodanza) );
 INSERT INTO CUOTAMENSUAL (IDcuotamensual,PRECIO,DuracionClase,IDgenerodanza) value
('13','2000','100hs','3'),
('2','2500','130hs','2'),
('3','2300','100hs','3'),
('4','2500','130hs','4'),
('5','3000','200hs','5'),
('6','2300','100hs','6'),
('7','2500','130hs','7'),
('8','2500','130hs','8'),
('9','2300','100hs','9'),
('10','3000','200hs','10'),
('11','2300','100hs','11'),
('12','2500','130hs','12');

 /*Tabla horarios */
insert into horarios(IDhorarios,dias,Idgenerodanza) value
('1','lunes','1'),
('2','martes','2'),('3','miercoles','3'),
('4','jueves','4'),('5','viernes','5'),
('6','Sabado','6'),('7','lunes','7'),
('8','martes','8'),('9','miercoles','9'),
('10','jueves','10'),('11','viernes','11'),
('12','sabado','12'),('13','lunes','1'),
('14','martes','6'),('15','miercoles','8'),
('16','jueves','3'),('17','viernes','9'),
('18','sabado','11'),('19','miercoles','5'),('20','viernes','8') ;

 /*Tabla LOCALIDAD */
CREATE TABLE IF NOT EXISTS LOCALIDAD (
IDlocalidad int not null primary key auto_increment,
Ciudad varchar(255)not null,
Direccion varchar(255)not null,
Calles varchar(255) not null ,
IDsedes int not null,
foreign key (IDsedes) references SEDES(IDsedes) );
INSERT INTO LOCALIDAD(IDlocalidad,Ciudad,Direccion,Calles,IDsedes) values
('1','Temperley','96611 Di Loreto Avenue','Northfield','1'),
('2','Banfield','0542 Cardinal Point','Farmco','2'),
('3','Lanus','9214 Sunfield Center','Forest Run','3'),
('4','Caba','99 Dwight Crossing','Sheridan','4'),
('5','Banfield','84668 Pankratz Alley','Ilene','5');

 /*Tabla PROFESOR*/
drop table profesor;
CREATE TABLE IF NOT EXISTS PROFESOR (
IDprofesor int not null primary key auto_increment,
Nombre text(255) not null,
Apellido text(255) not null,
email varchar(255) not null,
Sexo enum('Masculino','Femenino','No binario','otros'),
telefono varchar(255) not null,
IDhorarios int not null,
Idespecialidad int not null,
IDsedes int not NULL ,
foreign key (IDhorarios) references Horarios(IDhorarios),
foreign key (IDespecialidad) references Especialidad(IDespecialidad),
foreign key (IDsedes) references SEDES(IDsedes) );
INSERT INTO PROFESOR (IDprofesor,Nombre,Apellido,email,Sexo,telefono,IDhorarios,IDespecialidad,IDsedes) value
('6','Curcio','Griffin','cgriffin5@bloomberg.com','otros','7171435740','6','6','2'),
('7','Danila','Wannell','dwannell6@histats.com','Femenino','6158631585','7','7','4'),
('8','Laverna','Cuschieri','lcuschieri7@mayoclinic.com','Masculino','8317404004','8','8','3'),
('9','Elmore','Kenner','ekenner8@quantcast.com','Masculino','6403755953','9','9','5'),
('10','Dalia','Laurenty','dlaurenty9@theatlantic.com','No binario','2522119164','10','10','1'),
(11,'Papageno','Corstorphine','pcorstorphinea@va.gov','Otros','9145928835',11,11,5),
(12,'Webster','Bris','wbrisb@blogtalkradio.com','Masculino','2344924741',12,12,3),
(13,'Fredek','Maxwell','fmaxwellc@cloudflare.com','Otros',8689782144,1,1,2),
(14,'Elnore','Venneur','evenneurd@census.gov','Femenino','6806063758',2,2,1),
(15,'Ferdie','Sacco','fsaccoe@psu.edu','Masculino','2197468138',3,3,4),
(16,'Vasily','Ambrosoni','vambrosonif@fotki.com','Masculino',8439020875,4,4,4),
(17,'Arnoldo','Manders','amandersg@merriam-webster.com','Masculino',2212114628,5,5,3),
(18,'Orton','Marshal','omarshalh@a8.net','Femenino',3659428704,6,6,2),
('19','Udell','Garbert','ugarberti@nationalgeographic.com','Femenino',1947072687,7,7,1),
(20,'Erik','Neeson','eneesonj@g.co','Masculino',3474494267,8,8,5),
(21,'Carleen','Coppins','ccoppinsk@livejournal.com','Femenino',2315472312,9,9,3),
(22,'Piggy','Emmot','pemmotl@tamu.edu','No binario',1992542514,10,10,2),
(23,'Manolo','Apperley','mapperleym@telegraph.co.uk','Masculino',2019701868,11,11,1),
(24,'Chicky','Corbyn','ccorbynn@bloglines.com','otros',9832061474,12,12,5),
(25,'Erinn','Iohananof','eiohananofo@opensource.org','Femenino',7162990927,7,9,3),
(26,'Staford','Giovanetti','sgiovanettip@utexas.edu','Masculino',1599288585,7,2,4),
(27,'Katina','Paddy','kpaddyq@addthis.com','Femenino',9869534512,12,9,2),
(28,'Orton','Zuppa','ozuppar@fotki.com','Masculino',7072501097,3,2,1),
(29,'Ivette','Tynnan','itynnans@rambler.ru','otros',8503835598,8,7,5),
(30,'Saundra','Kindleside','skindlesidet@yolasite.com','No binario','1085789210','2','4','4');

 /*Tabla CLASESDANZA*/
CREATE TABLE IF NOT EXISTS CLASESDANZA (
IDhorarios int ,
IDprofesor int ,
IDespecialidad int,
IDsedes int ,
foreign key (IDhorarios) references horarios(IDhorarios),
foreign key (IDprofesor) references PROFESOR(IDprofesor),
foreign key (IDespecialidad) references ESPECIALIDAD(IDespecialidad),
foreign key (IDsedes) references SEDES(IDsedes) );
INSERT INTO clasesdanza(IDhorarios,IDprofesor,IDespecialidad,IDsedes) value
('1','1','1','1'),
('2','2','2','2'),
('3','3','3','3'),
('4','4','4','4'),
('5','5','5','5'),
('6','6','6','1'),
('7','7','7','2'),
('8','8','8','3'),
('9','9','9','4'),
('10','10','10','5'),
('11','11','11','1'),
('12','12','12','2'),
('13','13','1','3'),
('14','14','2','4'),
('15','15','3','5'),
('16','16','4','1'),
('17','17','5','2'),
('18','18','6','3'),
('19','19','7','4'),
('1','20','8','5');

/*VISTA DURACION_CLASES_DANZA*/
create view Duracion_Clases_Danza
as select idcuotamensual,precio,duracionclase
from cuotamensual;

/*VISTA vistas_Profesores*/
create view vistas_Profesores
as select IDprofesor,Nombre,Apellido,Sexo
from profesor
limit 15;

/*VISTA Especialidad_Profesores*/
CREATE OR REPLACE VIEW Especialidad_Profesores as
select profesor.nombre,profesor.apellido,profesor.sexo,profesor.telefono,es.tipo
from profesor 
inner join especialidad as es
on  profesor.IDprofesor = es.IDespecialidad;

/*VISTA vista_Clasesdanza */
CREATE OR REPLACE VIEW vista_Clasesdanza as
select p.nombre,p.apellido,es.tipo,h.dias,s.direccion
from horarios as h
inner join profesor as p
on   h.IDhorarios = p.IDprofesor
inner join especialidad as es
on h.IDhorarios = es.IDespecialidad
inner join sedes as s
on  h.IDhorarios = s.IDsedes;

/*FUNCTIONS*/
/*Funcion PROMEDIO_DANZA*/
drop function promedio_danza
DELIMITER $$
CREATE FUNCTION promedio_danza (p_idgenerodanza int)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE genero_danza INT;
    
    
    SET genero_danza = (select count(*)  from generodanza WHERE p_idgenerodanza = p_idgenerodanza);
   
    RETURN genero_danza;
    
END
$$
select nombre,  promedio_danza(IDgenerodanza) as count_generodanza
 from generodanza;
 
 /*Funcion precio_clases*/
 drop function precio_clases;
 DELIMITER $$
CREATE FUNCTION precio_clases (p_idcuotamensual int)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
	case
     when p_idcuotamensual <= 2000 then return 'PRECIO SEGUN HORARIO';
     when p_idcuotamensual <= 2300 then return 'PRECIO SEGUN HORARIO';
     when p_idcuotamensual <= 2500 then return 'PRECIO SEGUN HORARIO';
     when p_idcuotamensual <= 3000 then return 'PRECIO SEGUN HORARIO';
     
    end case ;
END
$$

/*STORED PROCEDURES*/
/*SP SEDES_DANZA*/
DELIMITER //
CREATE PROCEDURE Sedes_danza
(OUT Ciudad INTEGER)
BEGIN
    SELECT COUNT(*) INTO Ciudad FROM sedes;
END //
SET @CIudad = 0;
CALL Sedes_danza( @Ciudad );
select @Ciudad;

/*SP PROFESORAS_F*/
drop procedure Profesoras_F;
DELIMITER $$
CREATE PROCEDURE Profesoras_F(IDprofesor int)
BEGIN
    	IF IDprofesor >=2 then 
   (SELECT IDprofesor,Nombre,Apellido,Email,sexo FROM profesor where sexo like 'femenino' Order by Nombre Desc);
    End if;
END$$
call Profesoras_F();

/*TRIGGER*/
/*TRIGGER ActualizarPrecioClase*/
DELIMITER $$
CREATE TRIGGER actualizarPrecioClase
BEFORE UPDATE ON cuotamensual
FOR EACH ROW
BEGIN
  IF NEW.precio <> OLD.precio
    THEN
      SET NEW.precio = NEW.precio * 2;
  END IF ;
END$$
DELIMITER ;
UPDATE cuotamensual SET precio = 2000 WHERE idcuotamensual = 1;
SELECT * FROM cuotamensual;

/*TRIGGER Actualizar_Edad_Alumnos*/
DELIMITER $$
CREATE TRIGGER Actualizar_Edad_Alumnos
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
  IF NEW.edad <> OLD.edad
    THEN
      SET NEW.edad = NEW.edad + 1;
  END IF ;
END$$
update alumnos set edad = 40 where idAlumnos =1;
select * from alumnos