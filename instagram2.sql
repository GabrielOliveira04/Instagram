CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,             
    nome VARCHAR(100) NOT NULL,        
    seguidores INT DEFAULT 0,          
    engajamento DECIMAL(5,2) DEFAULT 0 
);

CREATE TABLE Postagem (
    id SERIAL PRIMARY KEY,             
    usuario_id INT NOT NULL,           
    conteudo TEXT NOT NULL,            
    data_postagem TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    curtidas INT DEFAULT 0,            
    comentarios INT DEFAULT 0,         
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) 
);

CREATE TABLE Interacao (
    id SERIAL PRIMARY KEY,             
    usuario_id INT NOT NULL,           
    postagem_id INT NOT NULL,          
    tipo VARCHAR(20) NOT NULL,         
    comentario TEXT,                   
    data_interacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),  
    FOREIGN KEY (postagem_id) REFERENCES Postagem(id) 
);

-- Inserção de dados nas tabelas
INSERT INTO Usuario (nome, seguidores, engajamento) VALUES 
('João', 1500, 12.5),
('Maria', 3000, 22.8),
('Ana', 1200, 15.0);

INSERT INTO Postagem (usuario_id, conteudo, curtidas, comentarios) VALUES 
(1, 'Foto de um pôr do sol', 200, 15),
(2, 'Viagem para a praia', 350, 30),
(3, 'Receita de bolo de cenoura', 120, 8);

INSERT INTO Interacao (usuario_id, postagem_id, tipo, comentario) VALUES 
(1, 2, 'curtida', NULL),
(3, 1, 'comentário', 'Que lindo pôr do sol!'),
(2, 3, 'compartilhamento', NULL);
