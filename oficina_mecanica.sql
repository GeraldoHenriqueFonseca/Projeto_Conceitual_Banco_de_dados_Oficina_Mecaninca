-- -----------------------------------------------------
-- Schema oficina_mecanica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina_mecanica` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `oficina_mecanica`;

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `Tipo do Servico` ENUM('Manutenção', 'Revisão') NOT NULL DEFAULT 'Revisão',
  `Nome_Servico` VARCHAR(45) NOT NULL,
  `Duração` INT NOT NULL,
  `Descrição` VARCHAR(255) NOT NULL,
  `Mão_de_Obra` FLOAT NOT NULL,
  PRIMARY KEY (`idServico`),
  UNIQUE INDEX `idServico_UNIQUE` (`idServico` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`Peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`Peca` (
  `idPeca` INT NOT NULL AUTO_INCREMENT,
  `Nome_Peca` VARCHAR(45) NOT NULL,
  `Descrição` VARCHAR(45) NOT NULL,
  `Quantidade_Disponível` INT NOT NULL,
  `Valor_Unitário` FLOAT NOT NULL,
  PRIMARY KEY (`idPeca`),
  UNIQUE INDEX `idEstoque_UNIQUE` (`idPeca` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`Equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`Equipe` (
  `idEquipe` INT NOT NULL AUTO_INCREMENT,
  `Num_Func` INT NOT NULL COMMENT 'Numero de Funcionários.',
  `Equipe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEquipe`),
  UNIQUE INDEX `idEquipes_UNIQUE` (`idEquipe` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`Cliente_PJ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`Cliente_PJ` (
  `idCliente_PJ` INT NOT NULL AUTO_INCREMENT,
  `Razão_Social` VARCHAR(45) NOT NULL,
  `Nome_Fantasia` VARCHAR(45) NOT NULL,
  `CNPJ` CHAR(14) NOT NULL,
  `Responsavel` VARCHAR(45) NOT NULL,
  `Data Cadastro` DATE NOT NULL,
  `Telefone` VARCHAR(11) NOT NULL,
  `E-mail` VARCHAR(45) NULL,
  `Endereço` VARCHAR(255) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` CHAR(2) NOT NULL,
  PRIMARY KEY (`idCliente_PJ`),
  UNIQUE INDEX `idCliente PJ_UNIQUE` (`idCliente_PJ` ASC) VISIBLE,
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`Cliente_PF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`Cliente_PF` (
  `idCliente_PF` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `Data_Nasc` DATE NOT NULL,
  `Data Cadastro` DATE NOT NULL,
  `Telefone` VARCHAR(11) NOT NULL,
  `E-mail` VARCHAR(45) NULL,
  `Endereço` VARCHAR(255) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` CHAR(2) NOT NULL,
  PRIMARY KEY (`idCliente_PF`),
  UNIQUE INDEX `idCliente PF_UNIQUE` (`idCliente_PF` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `Tipo de Veiculo` VARCHAR(45) NOT NULL,
  `Placa` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Ano` INT NOT NULL,
  `KM` VARCHAR(7) NOT NULL,
  `fk_idCliente_PJ` INT NULL,
  `fk_idCliente_PF` INT NULL,
  PRIMARY KEY (`idVeiculo`),
  UNIQUE INDEX `idVeiculo_UNIQUE` (`idVeiculo` ASC) VISIBLE,
  UNIQUE INDEX `Placa_UNIQUE` (`Placa` ASC) VISIBLE,
  INDEX `fk_Veiculo_Cliente_ PJ1_idx` (`fk_idCliente_PJ` ASC) VISIBLE,
  INDEX `fk_Veiculo_Cliente_PF1_idx` (`fk_idCliente_PF` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Cliente_ PJ1`
    FOREIGN KEY (`fk_idCliente_PJ`)
    REFERENCES `oficina_mecanica`.`Cliente_PJ` (`idCliente_PJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veiculo_Cliente_PF1`
    FOREIGN KEY (`fk_idCliente_PF`)
    REFERENCES `oficina_mecanica`.`Cliente_PF` (`idCliente_PF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`Orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`Orcamento` (
  `idOrcamento` INT NOT NULL AUTO_INCREMENT,
  `Numero_Orcamento` VARCHAR(45) NOT NULL,
  `Aprovado` ENUM('SIM', 'NÃO') NOT NULL DEFAULT 'NÃO' COMMENT 'Aprovado pelo Cliente',
  `Valor` FLOAT NOT NULL COMMENT 'Valor total do Orcamento Peca + mão de obra',
  `Data` DATE NOT NULL COMMENT 'Data do Orcamento.',
  `Validade` VARCHAR(45) NOT NULL,
  `fk_idVeiculo` INT NOT NULL,
  `Cod_Funcionário` INT NOT NULL COMMENT 'Código do funcionário que emitiu o Orcamento',
  PRIMARY KEY (`idOrcamento`, `fk_idVeiculo`),
  UNIQUE INDEX `idOrcamento_UNIQUE` (`idOrcamento` ASC) VISIBLE,
  UNIQUE INDEX `Numero do Orcamento_UNIQUE` (`Numero_Orcamento` ASC) VISIBLE,
  INDEX `fk_Orcamento_Veiculo1_idx` (`fk_idVeiculo` ASC) VISIBLE,
  CONSTRAINT `fk_Orcamento_Veiculo1`
    FOREIGN KEY (`fk_idVeiculo`)
    REFERENCES `oficina_mecanica`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- -----------------------------------------------------
-- Table `oficina_mecanica`.`OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`OS` (
  `idOrdem` INT NOT NULL AUTO_INCREMENT,
  `Numero` INT NOT NULL,
  `Data_Emissão` DATE NOT NULL,
  `Desconto` FLOAT NOT NULL DEFAULT 2.0 COMMENT 'Desconto padrão 2%, à vista 10%.',
  `Data_Conclusão` DATE NOT NULL,
  `Obs` VARCHAR(255) NULL,
  `fk_idOrcamento` INT NOT NULL,
  `Forma_Pagamento` ENUM('Crédito', 'Débito', 'Dinheiro') NOT NULL DEFAULT 'Débito',
  PRIMARY KEY (`idOrdem`, `fk_idOrcamento`),
  INDEX `fk_Ordem de Servico_Orcamento1_idx` (`fk_idOrcamento` ASC) VISIBLE,
  UNIQUE INDEX `idOrdem_UNIQUE` (`idOrdem` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Servico_Orcamento1`
    FOREIGN KEY (`fk_idOrcamento`)
    REFERENCES `oficina_mecanica`.`Orcamento` (`idOrcamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`Funcionario` (
  `idFunc` INT NOT NULL AUTO_INCREMENT,
  `fk_idEquipe` INT NOT NULL,
  `Código` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `data_nasc` DATE NOT NULL COMMENT 'data do nascimento.',
  `Endereço` VARCHAR(45) NOT NULL,
  `Cargo` VARCHAR(45) NOT NULL,
  `Especialidade` VARCHAR(45) NOT NULL,
  `Contratação` DATE NOT NULL COMMENT 'data da contratação',
  `Telefone` VARCHAR(11) NOT NULL,
  `E-mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFunc`, `fk_idEquipe`),
  INDEX `fk_Funcionarios_Equipes1_idx` (`fk_idEquipe` ASC) VISIBLE,
  UNIQUE INDEX `idFunc_UNIQUE` (`idFunc` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionarios_Equipes1`
    FOREIGN KEY (`fk_idEquipe`)
    REFERENCES `oficina_mecanica`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`Equipe_Orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`Equipe_Orcamento` (
  `fk_idEquipe` INT NOT NULL,
  `fk_idOrcamento` INT NOT NULL,
  PRIMARY KEY (`fk_idEquipe`, `fk_idOrcamento`),
  INDEX `fk_Equipe_has_Orcamento_Orcamento1_idx` (`fk_idOrcamento` ASC) VISIBLE,
  INDEX `fk_Equipe_has_Orcamento_Equipe1_idx` (`fk_idEquipe` ASC) VISIBLE,
  CONSTRAINT `fk_Equipe_has_Orcamento_Equipe1`
    FOREIGN KEY (`fk_idEquipe`)
    REFERENCES `oficina_mecanica`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipe_has_Orcamento_Orcamento1`
    FOREIGN KEY (`fk_idOrcamento`)
    REFERENCES `oficina_mecanica`.`Orcamento` (`idOrcamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `oficina_mecanica`.`Servico_Peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina_mecanica`.`Servico_Peca` (
  `fk_idOrcamento` INT NOT NULL,
  `fk_idServico` INT NOT NULL,
  `fk_idPeca` INT NOT NULL,
  `Qtd_Peca` INT NOT NULL,
  `Qtd_Servico` INT NOT NULL,
  PRIMARY KEY (`fk_idOrcamento`, `fk_idServico`, `fk_idPeca`),
  INDEX `fk_Servico_has_Peca_Peca1_idx` (`fk_idPeca` ASC) VISIBLE,
  INDEX `fk_Servico_has_Peca_Servico1_idx` (`fk_idServico` ASC) VISIBLE,
  INDEX `fk_Servico_Peca_Orcamento1_idx` (`fk_idOrcamento` ASC) VISIBLE,
  CONSTRAINT `fk_Servico_has_Peca_Servico1`
    FOREIGN KEY (`fk_idServico`)
    REFERENCES `oficina_mecanica`.`Servico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico_has_Peca_Peca1`
    FOREIGN KEY (`fk_idPeca`)
    REFERENCES `oficina_mecanica`.`Peca` (`idPeca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico_Peca_Orcamento1`
    FOREIGN KEY (`fk_idOrcamento`)
    REFERENCES `oficina_mecanica`.`Orcamento` (`idOrcamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
