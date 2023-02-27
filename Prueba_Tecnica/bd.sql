CREATE TABLE `bd_usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_documento` varchar(45) DEFAULT NULL,
  `primer_nombre` varchar(45) DEFAULT NULL,
  `segundo_nombre` varchar(45) DEFAULT NULL,
  `primer_apellido` varchar(45) DEFAULT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

