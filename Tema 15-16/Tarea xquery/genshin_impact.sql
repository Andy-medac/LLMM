-- Crear la base de datos
DROP DATABASE IF EXISTS genshin_impact;
CREATE DATABASE genshin_impact;
USE genshin_impact;

-- Tabla Personajes
CREATE TABLE personajes (
    id_personaje INT PRIMARY KEY,
    nombre VARCHAR(100),
    elemento VARCHAR(50),
    arma VARCHAR(50),
    raridad INT,
    constelacion VARCHAR(100),
    region VARCHAR(100)
);

-- Tabla Armas
CREATE TABLE armas (
    id_arma INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    raridad INT,
    efecto TEXT
);

-- Tabla Sets de Artefactos
CREATE TABLE sets_de_artefactos (
    id_set INT PRIMARY KEY,
    nombre VARCHAR(100),
    bonificacion_2p VARCHAR(255),
    bonificacion_4p VARCHAR(255)
);

-- Tabla Misiones
CREATE TABLE misiones (
    id_mision INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    recompensa VARCHAR(100),
    dificultad INT
);

-- Tabla intermedia Personajes_Armas (muchos a muchos)
CREATE TABLE personajes_armas (
    id_personaje INT,
    id_arma INT,
    PRIMARY KEY (id_personaje, id_arma),
    FOREIGN KEY (id_personaje) REFERENCES personajes(id_personaje),
    FOREIGN KEY (id_arma) REFERENCES armas(id_arma)
);

-- Tabla intermedia Personajes_Sets (muchos a muchos)
CREATE TABLE personajes_sets (
    id_personaje INT,
    id_set INT,
    PRIMARY KEY (id_personaje, id_set),
    FOREIGN KEY (id_personaje) REFERENCES personajes(id_personaje),
    FOREIGN KEY (id_set) REFERENCES sets_de_artefactos(id_set)
);

-- Tabla intermedia Personajes_Misiones (muchos a muchos)
CREATE TABLE personajes_misiones (
    id_personaje INT,
    id_mision INT,
    PRIMARY KEY (id_personaje, id_mision),
    FOREIGN KEY (id_personaje) REFERENCES personajes(id_personaje),
    FOREIGN KEY (id_mision) REFERENCES misiones(id_mision)
);

-- Insertar datos en la tabla Personajes
INSERT INTO personajes (id_personaje, nombre, elemento, arma, raridad, constelacion, region) VALUES
(1, 'Amber', 'Pyro', 'Arco', 4, 'Seveth', 'Mondstadt'),
(2, 'Lumine', 'Anemo', 'Espada', 5, 'Vigil', 'Teyvat'),
(3, 'Diluc', 'Pyro', 'Espada', 5, 'Pheonix', 'Mondstadt'),
(4, 'Zhongli', 'Geo', 'Lanza', 5, 'Noctilus', 'Liyue');

-- Insertar datos en la tabla Armas
INSERT INTO armas (id_arma, nombre, tipo, raridad, efecto) VALUES
(1, 'Arco de Ámbar', 'Arco', 4, 'Aumenta el daño de Pyro en 20%.'),
(2, 'Espada de Luz', 'Espada', 5, 'Incrementa la recarga de energía en 10%.'),
(3, 'Espada de Fuego', 'Espada', 5, 'Aumenta el daño de ataque en 30%'),
(4, 'Lanza del Guerrero', 'Lanza', 5, 'Aumenta el daño físico en 25%.');

-- Insertar datos en la tabla Sets de Artefactos
INSERT INTO sets_de_artefactos (id_set, nombre, bonificacion_2p, bonificacion_4p) VALUES
(1, 'Gladiador', 'Aumenta el ATK en 18%', 'Aumenta el daño de habilidades en 35%'),
(2, 'Maestro del Viento', 'Aumenta la velocidad de movimiento en 10%', 'Aumenta el daño de Anemo en 20%');

-- Insertar datos en la tabla Misiones
INSERT INTO misiones (id_mision, nombre, descripcion, recompensa, dificultad) VALUES
(1, 'Protege Mondstadt', 'Defiende Mondstadt de los enemigos', 'Exp 1000', 2),
(2, 'Recoge flores de Qingce', 'Recolecta flores raras en la región de Liyue', 'Artefacto raro', 3);

-- Insertar datos en la tabla Personajes_Armas
INSERT INTO personajes_armas (id_personaje, id_arma) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insertar datos en la tabla Personajes_Sets
INSERT INTO personajes_sets (id_personaje, id_set) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2);

-- Insertar datos en la tabla Personajes_Misiones
INSERT INTO personajes_misiones (id_personaje, id_mision) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2);
