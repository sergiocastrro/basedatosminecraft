drop database if exists bd_minecraft;
create database bd_minecraft;
use bd_minecraft;

create table inventario (
id_obj int not null,
nom_obj varchar(20) not null,
tipo_obj varchar(20) not null,
descripcion varchar(100) not null,
primary key (id_obj));
create table jugadores (
id_jug int not null,
nombre varchar(30) not null,
modo_juego varchar(30) not null,
logros varchar(50) not null,
id_obj int not null,
primary key (id_jug));
create table servidor (
id_servidor int not null,
nombre varchar(30) not null,
direccion_ip int not NULL,
jugadores_max int not null,
version varchar(30) not null,
id_mundo int not null,
primary key (id_servidor));
create table mundos (
id_mundo int not null,
nombre varchar(10) not null,
tamaño int not null,
nivel_difi varchar(10) not null,
primary key (id_mundo));
create table jugadores_servidor(
id_servidor int not null,
id_jug int not null,
num_jugadores int not null,
primary key (id_servidor, id_jug));
create table biomas (
id_bio int not null,
nombre varchar(10) not null,
tipo varchar(10) not null,
recursos varchar(30) not null,
num_bloques int not null,
primary key (id_bio));
create table mundos_biomas (
id_mundo int not null,
id_bio int not null,
num_biomas int not null,
primary key (id_mundo, id_bio)
);
create table bloques (
id_bloque int not null,
nombre varchar(20) not null,
tipo varchar(20) not null,
materiales varchar(20) not null,
primary key (id_bloque));
create table mundos_bloques (
id_mundo int not null,
id_bloque int not null,
num_bloques int not null,
primary key (id_mundo, id_bloque));
create table armas (
id_arma int not null,
nombre varchar(30) not null,
tipo varchar(30) not null,
daño int not null,
id_encant int not null,
primary key (id_arma));
create table armas_mundos (
id_arma int not null,
id_mundo int not null,
primary key (id_arma, id_mundo)
);
create table encantamientos (
id_encant int not null,
nombre varchar(30) not null,
tipo varchar(30) not null,
niv_nec int not null, 
primary key (id_encant));

alter table jugadores_servidor
add constraint fk_idjug1 foreign key (id_jug) references jugadores (id_jug),
add constraint fk_idserv1 foreign key (id_servidor) references servidor (id_servidor);

alter table armas_mundos
add constraint fk_idmundo6 foreign key (id_mundo) references mundos (id_mundo),
add constraint fk_idarma foreign key (id_arma) references armas (id_arma);

alter table jugadores
add constraint fk_idobj2 foreign key (id_obj) references inventario (id_obj);

alter table mundos_biomas
add constraint fk_idmun2 foreign key (id_mundo) references mundos (id_mundo),
add constraint fk_bio1 foreign key (id_bio) references biomas (id_bio);

alter table mundos_bloques
add constraint fk_mundo4 foreign key (id_mundo) references mundos (id_mundo),
add constraint fk_bloque1 foreign key (id_bloque) references bloques (id_bloque);

alter table armas
add constraint fk_idencant foreign key (id_encant) references encantamientos (id_encant);

alter table servidor 
add constraint fk_mundo1 foreign key (id_mundo) references mundos (id_mundo);


insert into inventario (id_obj, nom_obj, tipo_obj, descripcion)
values (1, 'Espada', 'Arma', 'Una espada de acero inoxidable'),
       (2, 'Pico', 'Herramienta', 'Un pico de diamante'),
       (3, 'Manzana dorada', 'Comida', 'Una manzana que restaura la salud y otorga efectos beneficiosos'),
       (4, 'Ladrillo de piedra', 'Bloque', 'Un bloque de piedra para construir'),
       (5, 'Ender Pearl', 'Objeto', 'Un objeto que permite al jugador teletransportarse');

insert into mundos (id_mundo, nombre, tamaño, nivel_difi)
values (11, 'Mundo1', 100, 'Fácil'),
       (22, 'Mundo2', 200, 'Medio'),
       (33, 'Mundo3', 300, 'Difícil'),
       (44, 'Mundo4', 400, 'Experto'),
       (55, 'Mundo5', 500, 'Maestro');
              
insert into biomas (id_bio, nombre, tipo, recursos, num_bloques)
values (1010, 'Bosque', 'Vegetación', 'Madera, manzanas', 300),
       (2020, 'Desierto', 'Arido', 'Arena, cactus', 500),
       (3030, 'Montaña', 'Rocoso', 'Piedra, hierro', 800),
       (4040, 'Océano', 'Acuático', 'Peces, algas', 1000),
       (5050, 'Tundra', 'Frío', 'Hielo, nieve', 400);

insert into bloques (id_bloque, nombre, tipo, materiales)
values (1001, 'Piedra', 'Mineral', 'Pico de hierro'),
       (2002, 'Madera', 'Bloque', 'Hacha de madera'),
       (3003, 'Hierro', 'Mineral', 'Pico de hierro'),
       (4004, 'Ladrillo', 'Bloque', 'Horno'),
       (5005, 'Diamante', 'Mineral', 'Pico de diamante');
           
insert into mundos_biomas (id_mundo, id_bio, num_biomas)
values (11, 1010, 5),
       (22, 2020, 7),
       (33, 3030, 3),
       (44, 4040, 8),
       (55, 5050, 6);

insert into servidor (id_servidor, nombre, direccion_ip, jugadores_max, version,id_mundo)
values (101, 'Java edition', 192168102, 100, '1.16.5', 11),
       (202, 'Bedrock', 192168002, 50, '1.17.1', 22),
       (303, 'Dungeons', 192168003, 200, '1.15.2', 33),
       (404, 'Java edition II', 192168004, 75, '1.14.4', 44),
       (505, 'Pocket edition', 192168005, 150, '1.12.2', 55);
             
insert encantamientos (id_encant, nombre, tipo, niv_nec)
values (100, 'Afilado', 'Daño', 5),
	   (200, 'Protección', 'Defensa', 3),
	   (300, 'Inquebrantable', 'Durabilidad', 4),
       (400, 'Empalamiento', 'Distancia', 5),
       (500, 'Filo', 'Daño', 2);
       
insert into armas (id_arma, nombre, tipo, daño, id_encant)
values (111, 'Espada de diamante', 'Cuerpo a cuerpo', 7, 100),
	   (222, 'Arco de hierro', 'A distancia', 2, 200),
       (333, 'Pistola', 'A distancia', 8, 300),
       (444, 'Hacha de piedra', 'Cuerpo a cuerpo', 5, 400),
       (555, 'Bastón de fuego', 'Mágica', 10, 500);
       
insert into mundos_bloques (id_mundo, id_bloque, num_bloques) 
values (11, 1001, 100),
	   (22, 2002, 50),
       (33, 3003, 200),
	   (44, 4004, 150),
       (55, 5005, 300);
       
insert into jugadores (id_jug, nombre, modo_juego, logros, id_obj)
values (10, 'Juan', 'Supervivencia', 'Ganador de la partida', 1),
       (20, 'Maria', 'Creativo', 'Construyó una casa gigante', 2),
       (30, 'Pedro', 'Aventura', 'Derrotó al dragón', 3),
       (40, 'Ana', 'Supervivencia', 'Sobrevivió 100 días', 4),
       (50, 'Luis', 'Creativo', 'Construyó una ciudad entera', 5);

insert into jugadores_servidor (id_servidor, id_jug, num_jugadores)
values (101, 10, 300),
	   (202, 20, 578),
       (303, 30, 2934),
       (404, 40, 478),
       (505, 50, 987);