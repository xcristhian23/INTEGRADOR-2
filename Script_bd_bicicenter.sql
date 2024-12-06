create database bd_bicicenter;
use bd_bicicenter;

CREATE TABLE bicicleta (
  idbicicleta int(2) NOT NULL,
  idMarca int(2) DEFAULT NULL,
  idModelo int(2) DEFAULT NULL,
  idUsuario int(3) DEFAULT NULL,
  Aro int(3) DEFAULT NULL,
  Color varchar(40) DEFAULT NULL,
  estado tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla bicicleta
--

INSERT INTO bicicleta (idbicicleta, idMarca, idModelo, idUsuario, Aro, Color, estado) VALUES
(5, 1, 2, 51, 29, 'Verde', 1),
(6, 4, 4, 51, 28, 'Marron', 1),
(7, 6, 6, 88, 26, 'Celeste', 1),
(8, 5, 5, 89, 27, 'Rosado', 1),
(9, 8, 8, 88, 28, 'Naranja', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla citas
--

CREATE TABLE citas (
  idCita int(3) NOT NULL,
  fecha date NOT NULL,
  hora varchar(10) DEFAULT NULL,
  servicio varchar(40) DEFAULT NULL,
  comentario varchar(60) DEFAULT NULL,
  estado tinyint(1) NOT NULL,
  idUsuario int(3) NOT NULL,
  idBicicleta int(2) NOT NULL,
  tecnico varchar(50) DEFAULT NULL,
  atendido tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla citas
--

INSERT INTO citas (idCita, fecha, hora, servicio, comentario, estado, idUsuario, idBicicleta, tecnico, atendido) VALUES
(5, '2023-10-24', '18:50', 'Reparacion', '', 0, 51, 5, 'Miguel Chauca', 1),
(6, '2023-10-19', '18:00', 'Mantenimiento y limpieza', 'Mejorar el aspecto de mi bicicleta', 1, 51, 5, 'Luis Mendez', 0),
(7, '2023-10-27', '12:05', 'Mantenimiento y limpieza', 'Quiero pintar mi bicicleta', 0, 51, 6, 'Miguel Chauca', 0),
(10, '2023-11-27', '15:28', 'ReparaciÃ³n', 'Deseo hacer la reparaciÃ³n de mi bicicleta. Gracias ', 1, 51, 6, 'Miguel Chauca', NULL),
(12, '2023-11-28', '19:00', 'Mantenimiento y limpieza', 'Hola', 1, 88, 7, 'Eduardo Caceres', NULL),
(13, '2023-11-15', '19:00', 'Pintura', 'Deseo cambio el color de la bicicleta', 1, 88, 9, 'Miguel Chauca', NULL),
(14, '2023-11-03', '09:20', 'Montaje y/o desmontaje', 'RevisiÃ³n general', 0, 88, 7, 'Carlos Sanchez', 0),
(15, '2023-11-25', '13:30', 'Frenos', 'Limpieza de frenos', 1, 88, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla marca
--

CREATE TABLE marca (
  idMarca int(2) NOT NULL,
  Marca varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla marca
--

INSERT INTO marca (idMarca, Marca) VALUES
(1, 'Trek'),
(2, 'Rose'),
(3, 'Specialized'),
(4, 'Giant'),
(5, 'Cannondale'),
(6, 'BMC'),
(7, 'Cervelo'),
(8, 'Pinarello'),
(9, 'Wilier Triestina'),
(10, 'Colnago'),
(11, 'Scott'),
(12, 'Orbea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla modelos
--

CREATE TABLE modelos (
  idModelo int(2) NOT NULL,
  nombreModelo varchar(50) DEFAULT NULL,
  idMarca int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla modelos
--
INSERT INTO modelos (idModelo, nombreModelo, idMarca) VALUES
(1, 'Émonda', 1),
(2, 'Domane', 1),
(3, 'X-Lite', 2),
(4, 'Xeon', 2),
(5, 'Tarmac', 3),
(6, 'Allez', 3),
(7, 'Contend', 4),
(8, 'Contend AR', 4),
(9, 'Synapse', 5),
(10, 'SuperSix EVO', 5),
(11, 'Roadmachine', 6),
(12, 'Timemachine', 6),
(13, 'R5', 7),
(14, 'Caledonia', 7),
(15, 'Dogma F', 8),
(16, 'Grevil F', 8),
(17, 'Filante SLR', 9),
(18, 'Cento10PRO', 9),
(19, 'V3RS', 10),
(20, 'C64', 10),
(21, 'Addict', 11),
(22, 'Foil', 11),
(23, 'Orca', 12),
(24, 'Avant', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla roles
--

CREATE TABLE roles (
  idRol int(2) NOT NULL,
  nombreRol varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla roles
--

INSERT INTO roles (idRol, nombreRol) VALUES
(1, 'Administrador'),
(2, 'Tecnico'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla servicios
--

CREATE TABLE servicios (
  idServicio int(2) NOT NULL,
  nombreServicio varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla servicios
--

INSERT INTO servicios (idServicio, nombreServicio) VALUES
(1, 'Reparacion'),
(2, 'Mantenimiento y limpieza'),
(3, 'Montaje y/o desmontaje'),
(4, 'Pintura'),
(5, 'Frenos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla tipo_documentos
--

CREATE TABLE tipo_documentos (
  idTipoDocumento int(1) NOT NULL,
  documento varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla tipo_documentos
--

INSERT INTO tipo_documentos (idTipoDocumento, documento) VALUES
(1, 'DNI'),
(2, 'CE'),
(3, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla usuarios
--

CREATE TABLE usuarios (
  idUsuario int(3) NOT NULL,
  idRol int(2) DEFAULT NULL,
  idTipoDocumento int(1) DEFAULT NULL,
  documento int(10) DEFAULT NULL,
  telefono int(9) DEFAULT NULL,
  nombre varchar(30) DEFAULT NULL,
  apellidos varchar(50) DEFAULT NULL,
  correo varchar(50) DEFAULT NULL,
  password varchar(8) DEFAULT NULL,
  direccion varchar(40) DEFAULT NULL,
  Estado tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla usuarios
--

INSERT INTO usuarios (idUsuario, idRol, idTipoDocumento, documento, telefono, nombre, apellidos, correo, password, direccion, Estado) VALUES
(1, 1, 1, 45159490, 992763823, 'Frank.', 'Tapia', 'ftapia@hotmail.com', 'Lima01@1', 'Urb Sol de Paraiso - San luis', 1),
(51, 3, 1, 22334455, 987666666, 'Yaritza', 'Adriano', 'yadriano@gmail.com', 'Lima01@2', 'Miraflores', 1),
(86, 2, 1, 45159488, 981112223, 'Edilberto', 'Gutierrez', 'egutierrez@gmail.com', 'Lima01@3', 'SMP', 1),
(87, 3, 3, 22446688, 980002222, 'Silvia', 'Chambi', 'silviaChambi@gmail.com', 'Ls@m1234', 'Lince ', 1),
(88, 3, 3, 22113344, 987111111, 'Juan', 'Mendez', 'jmendez123@gmail.com', 'Ls@m7777', 'Villa el Salvador', 1),
(89, 3, 3, 33445566, 987123456, 'Maria', 'Zarate', 'mzarate12@gmail.com', 'M@sw1111', 'Av. Arequipa 1245 - Lince', 1),
(92, 2, 1, 22110000, 987555555, 'Willy', 'Guillen', 'willyGuillen@utp.edu.pe', 'Lima01@4', 'Lince', 0),
(93, 2, 1, 22134567, 987000111, 'luis', 'Sanchez', 'luis.sanchez123@hotmail.com', 'Lima01@5', 'Miraflores', 1),
(94, 2, 1, 33110000, 999222331, 'Eduardo', 'Caceres', 'eduardo.s21@gmail.com', 'Lima01@6', 'San Juan de Lurigancho', 1);


-- Índices para tablas volcadas


-- Indices de la tabla bicicleta
--
ALTER TABLE bicicleta
  ADD PRIMARY KEY (idbicicleta),
  ADD KEY idMarca (idMarca),
  ADD KEY idTipoModelo (idModelo),
  ADD KEY idUsuario (idUsuario);

--
-- Indices de la tabla citas
--
ALTER TABLE citas
  ADD PRIMARY KEY (idCita),
  ADD KEY idUsuario (idUsuario),
  ADD KEY idBicicleta (idBicicleta);

--
-- Indices de la tabla marca
--
ALTER TABLE marca
  ADD PRIMARY KEY (idMarca);

--
-- Indices de la tabla modelos
--
ALTER TABLE modelos
  ADD PRIMARY KEY (idModelo),
  ADD KEY idMarca (idMarca);

--
-- Indices de la tabla roles
--
ALTER TABLE roles
  ADD PRIMARY KEY (idRol);

--
-- Indices de la tabla servicios
--
ALTER TABLE servicios
  ADD PRIMARY KEY (idServicio);

--
-- Indices de la tabla tipo_documentos
--
ALTER TABLE tipo_documentos
  ADD PRIMARY KEY (idTipoDocumento);

--
-- Indices de la tabla usuarios
--
ALTER TABLE usuarios
  ADD PRIMARY KEY (idUsuario),
  ADD KEY idRol (idRol),
  ADD KEY idTipoDocumento (idTipoDocumento);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla bicicleta
--
ALTER TABLE bicicleta
  MODIFY idbicicleta int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla usuarios
--
ALTER TABLE usuarios
  MODIFY idUsuario int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla bicicleta
--
ALTER TABLE bicicleta
  ADD CONSTRAINT bicicleta_ibfk_1 FOREIGN KEY (idModelo) REFERENCES modelos (idModelo) ON UPDATE CASCADE,
  ADD CONSTRAINT bicicleta_ibfk_2 FOREIGN KEY (idMarca) REFERENCES marca (idMarca) ON UPDATE CASCADE,
  ADD CONSTRAINT bicicleta_ibfk_3 FOREIGN KEY (idUsuario) REFERENCES usuarios (idUsuario) ON UPDATE CASCADE;

--
-- Filtros para la tabla citas
--
ALTER TABLE citas
  ADD CONSTRAINT citas_ibfk_1 FOREIGN KEY (idUsuario) REFERENCES usuarios (idUsuario) ON UPDATE CASCADE,
  ADD CONSTRAINT citas_ibfk_2 FOREIGN KEY (idBicicleta) REFERENCES bicicleta (idbicicleta) ON UPDATE CASCADE;

--
-- Filtros para la tabla usuarios
--
ALTER TABLE usuarios
  ADD CONSTRAINT usuarios_ibfk_1 FOREIGN KEY (idRol) REFERENCES roles (idRol) ON UPDATE CASCADE,
  ADD CONSTRAINT usuarios_ibfk_2 FOREIGN KEY (idTipoDocumento) REFERENCES tipo_documentos (idTipoDocumento) ON UPDATE CASCADE;

-- SP Insertar Usuario
CREATE PROCEDURE insertar_usuario(
    IN p_nombre VARCHAR(50),
    IN p_apellidos VARCHAR(100),
    IN p_idTipoDocumento INT,
    IN p_documento INT,
    IN p_correo VARCHAR(100),
    IN p_password VARCHAR(8),
    IN p_telefono INT,
    IN p_idRol INT,
    IN p_direccion VARCHAR(255),
    IN p_estado BOOLEAN
)
BEGIN
    INSERT INTO usuarios (nombre, apellidos, idTipoDocumento, documento, correo, password, telefono, idRol, direccion, estado) 
    VALUES (p_nombre, p_apellidos, p_idTipoDocumento, p_documento, p_correo, p_password, p_telefono, p_idRol, p_direccion, p_estado);
end;
