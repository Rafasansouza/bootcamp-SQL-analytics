-- Criação da tabela Produto
CREATE TABLE Produto (
    cod_prod INT PRIMARY KEY,
    descricao VARCHAR(50) UNIQUE,
    qtde_disponivel INT NOT NULL DEFAULT 0
);

-- Inserção de produtos
INSERT INTO Produto VALUES (1, 'Basica', 10);
INSERT INTO Produto VALUES (2, 'Dados', 5);
INSERT INTO Produto VALUES (3, 'Verao', 15);

-- Criação da tabela RegistroVendas
CREATE TABLE RegistroVendas (
    cod_venda SERIAL PRIMARY KEY,
    cod_prod INT,
    qtde_vendida INT,
    FOREIGN KEY (cod_prod) REFERENCES Produto(cod_prod) ON DELETE CASCADE
);

-- Criando FUNCAO verifica_estoque
CREATE OR REPLACE FUNCTION verifica_estoque() 
RETURNS TRIGGER AS $$
DECLARE
	qtde_atual INTEGER;
BEGIN
	SELECT qtde_disponivel INTO qtde_atual
    FROM Produto WHERE cod_prod = NEW.cod_prod;
    IF qtde_atual < NEW.qtde_vendida THEN
        RAISE EXCEPTION 'Quantidade indisponivel em estoque';
    ELSE
        UPDATE Produto SET qtde_disponivel = qtde_disponivel - NEW.qtde_vendida
        WHERE cod_prod = NEW.cod_prod;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criando TRIGGER trg_verifica_estoque
CREATE TRIGGER trg_verifica_estoque
BEFORE INSERT ON RegistroVendas
FOR EACH ROW
EXECUTE FUNCTION verifica_estoque();

-- Tentativa bem-sucedida
INSERT INTO RegistroVendas (cod_prod, qtde_vendida) VALUES (1, 5);

SELECT * FROM REGISTROVENDAS;

-- Tentativa bem-sucedida
INSERT INTO RegistroVendas (cod_prod, qtde_vendida) VALUES (2, 5);

SELECT * FROM REGISTROVENDAS;

-- Tentativa falha
INSERT INTO RegistroVendas (cod_prod, qtde_vendida) VALUES (3, 16);

SELECT * FROM REGISTROVENDAS;
SELECT * FROM PRODUTO;
