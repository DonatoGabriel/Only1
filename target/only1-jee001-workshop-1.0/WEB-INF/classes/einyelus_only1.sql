-- drop database einyelus_only1;
create database einyelus_only1;
use einyelus_only1;

create table if not exists usuario(
    id 	bigint not null auto_increment,
    nombre varchar(50) not null,
    username varchar(20) not null unique,
    emailOrPhone varchar(50) not null unique,
    usuarioPass varchar(15) not null,
    imagen blob, -- Cambiar para almacenar ruta
    activo boolean default true, -- Eliminado lógico
    tipo tinyint(1) default 2, -- 1 = Admin, 2 = Normal
    primary key(id)
);

create table if not exists tipo_contenido(
    id int not null auto_increment,
    tipo varchar(15),
    primary key(id)
);

create table if not exists contenido(
    id bigint not null auto_increment,
    descripcion varchar(200),
    reproducciones double default 0,
    tipo_contenido_id int not null,
    usuario_id bigint not null,
    primary key(id),
    constraint FK_tipo_contenido foreign key (tipo_contenido_id) references tipo_contenido(id) on delete cascade,
    constraint FK_usuario_contenido foreign key (usuario_id) references usuario(id) on delete cascade
    
);

create table if not exists comentario(
    id int not null auto_increment,
    comentario varchar(200) not null,
    usuario_id bigint not null,
    contenido_id bigint not null,
    primary key(id),
    constraint FK_usuario foreign key (usuario_id) references usuario(id),
    constraint FK_contenido foreign key (contenido_id) references contenido(id)
);

create table if not exists seguidor(
    id bigint not null auto_increment,
    usuario_id 	bigint not null,
    seguidor_id bigint not null,
    primary key(id),
    constraint FK_usuario_seguido foreign key (usuario_id) references usuario(id) on delete cascade,
    constraint FK_usuario_seguidor foreign key (seguidor_id) references usuario(id) on delete cascade
);

create table if not exists likes(
    id bigint not null,
    usuario_id bigint not null,
    contenido_id bigint not null,
    primary key(id),
    constraint FK_like_usuario foreign key (usuario_id) references usuario(id) on delete cascade,
    constraint FK_like_contenido foreign key (contenido_id) references contenido(id) on delete cascade
);



-- -------------------------------- INSERT-------------------------------- --

insert into tipo_contenido (`tipo`) values ('Audio'), ('Imagen'), ('Video');

insert into usuario (`nombre`, `username`, `emailOrPhone`, `usuarioPass`, `imagen`, `tipo`) 
values ('Donato Gabriel', 'g.donato', 'e.donatogabriel@gmail.com', '123', null, 1);


-- -------------------------------- CONSULTAS -------------------------------- --
select * from usuario;
