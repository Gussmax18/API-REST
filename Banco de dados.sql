use restapi;

CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Cliente VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Contas (
    ID_Conta INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Saldo DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE Transacoes (
    ID_Transacao INT AUTO_INCREMENT PRIMARY KEY,
    ID_Conta INT NOT NULL,
    Tipo_Conta ENUM('Corrente', 'Poupança', 'Salário', 'Mista', 'Digital', 'Universitária', 'Conjunta', 'Solidária') NOT NULL,
    Tipo_Transacao ENUM('Crédito', 'Débito') NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Data_Transacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Conta) REFERENCES Contas(ID_Conta) ON DELETE CASCADE
);

CREATE TABLE Notificacoes (
    ID_Notificacao INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Mensagem TEXT NOT NULL,
    Data_Notificacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE Administradores (
    ID_Administrador INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Idade INT NOT NULL,
    Senha VARCHAR(255) NOT NULL
);
