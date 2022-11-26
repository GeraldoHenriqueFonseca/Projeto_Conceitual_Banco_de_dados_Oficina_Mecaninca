show databases;
use oficina_mecanica;
show tables;

-- Inserindo registros na tabela de clientes
INSERT INTO `oficina_mecanica`.`cliente_pf` (`Nome`, `CPF`, `Data_Nasc`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES ('Daniel Alves', '12345678901', '76-11-06', '20-12-28', '319857412', 'dani_alves@gmail.com', 'r. Rolando Lero, 171', 'Belo Horizonte', 'MG');
INSERT INTO `oficina_mecanica`.`cliente_pf` (`Nome`, `CPF`, `Data_Nasc`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES ('Richarlisson Pombo', '98765432109', '86-04-21', '19-09-09', '379562345', 'ric_pombo_sem_asa@gmail.com', 'r. Cidade Conversa, 666', 'Itaúna', 'MG');

INSERT INTO `oficina_mecanica`.`cliente_pj` (`Razão_Social`, `Nome_Fantasia`, `CNPJ`, `Responsavel`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES ('Getech Informática Ltda', 'Getech', '12345678901234', 'Getulio', '21-11-26', '3199236589', 'getech@gmail.com', 'r. Dona Florinda, 704', 'Belo Horizonte', 'MG');
INSERT INTO `oficina_mecanica`.`cliente_pj` (`Razão_Social`, `Nome_Fantasia`, `CNPJ`, `Responsavel`, `Data Cadastro`, `Telefone`, `E-mail`, `Endereço`, `Cidade`, `Estado`) VALUES ('Kalafrio', 'Kalafrio', '98765432101234', 'Rafael', '22-11-07', '3732418521', 'kalafrio@gmail.com', 'av. São João, 1800', 'Itaúna', 'MG');

-- Inserindo registros na tabela de veículos --
INSERT INTO `oficina_mecanica`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Sedã', 'oro2005', 'Renault', 'Logan', '2017', '115.000',1,NULL);
INSERT INTO `oficina_mecanica`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Hatch', 'kfc1206', 'Fiat', 'Argo', '2021', '10.000',NULL,2);
INSERT INTO `oficina_mecanica`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Perua', 'dah1006', 'Fiar', 'Fiorino', '2008', '240.000',2,NULL);
INSERT INTO `oficina_mecanica`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Picape', 'dog5807', 'Volkswagen', 'Amarok', '2021', '50.000',2,NULL);
INSERT INTO `oficina_mecanica`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Minivan', 'dtl2150', 'Nissan', 'Gran Livina', '2014', '70.000',NULL,2);
INSERT INTO `oficina_mecanica`.`veiculo` (`Tipo de Veiculo`, `Placa`, `Marca`, `Modelo`, `Ano`, `KM`, `fk_idCliente_PJ`, `fk_idCliente_PF`) VALUES ('Sedã', 'pfb2698', 'Chevrolet', 'Cobalt', '2018', '94.000',1,NULL);

-- Inserindo resgistro na tabela de Orcamentos --
INSERT INTO `oficina_mecanica`.`Orcamento` (`Numero_Orcamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES ('1254', 'SIM', '22-09-20', '1520', '90 dias', '1','100');
INSERT INTO `oficina_mecanica`.`Orcamento` (`Numero_Orcamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES ('789', 'SIM', '22-11-10', '1750', '90 dias', '2','100');
INSERT INTO `oficina_mecanica`.`Orcamento` (`Numero_Orcamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES ('414', 'NÃO', '22-10-26', '1456', '90 dias', '3','101');
INSERT INTO `oficina_mecanica`.`Orcamento` (`Numero_Orcamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES ('302', 'SIM', '22-10-15', '810', '90 dias', '4','101');
INSERT INTO `oficina_mecanica`.`Orcamento` (`Numero_Orcamento`, `Aprovado`, `Data`, `Valor`, `Validade`, `fk_idVeiculo`,`Cod_Funcionário`) VALUES ('2082', 'SIM', '22-11-15', '930', '60 dias', '5','100');

-- Inserindo registros na tabela equipe --
INSERT INTO `oficina_mecanica`.`equipe` (`Num_Func`, `Equipe`) VALUES ('5', 'A');
INSERT INTO `oficina_mecanica`.`equipe` (`Num_Func`, `Equipe`) VALUES ('5', 'B');
INSERT INTO `oficina_mecanica`.`equipe` (`Num_Func`, `Equipe`) VALUES ('5', 'ADM');

-- Inserindo registros na tabela funcionario --
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('1', '3', 'Neymar', '12395175385', '81-10-20', 'av. Alvarenga, 1500', 'Mecânico', 'Mecânica', '20-01-01', '31998632587', 'ney@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('1', '2', 'Didi R.', '96325874125', '85-02-13', 'r. Lajotas, 234', 'Auxiliar', 'Mecânica', '21-10-12', '31998874598', 'didi@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('1', '1', 'Dedé S.', '95175385296', '79-12-25', 'av. Cacildis, 345', 'Lider', 'Mecânica', '19-01-10', '31998652354', 'dede@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('1', '4', 'Mussum C.', '74187498765', '81-06-12', 'av. Cumpadi', 'Eletricista Automotivo', 'Elétrica', '20-02-02', '31998875874', 'cacildis@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('1', '5', 'Zacarias S.', '96385274185', '86-04-01', 'r. Conceição', 'Mecânico', 'Hidráulica', '21-01-10', '31999698596', 'zaca@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('2', '6', 'Ricardo A.', '95175385777', '81-01-12', 'av. Afonso Pena, 1500', 'Mecânico', 'Mecânica', '20-01-01', '31998632511', 'ric@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('2', '7', 'Humberto P.', '95175385666', '85-02-13', 'av. Cumadre, 12', 'Auxiliar', 'Mecânica', '21-10-12', '31989632533', 'humberto@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('2', '8', 'Gabriela O.', '95175385667', '79-03-25', 'r São Pedro, 444', 'Gerente', 'Mecânica', '20-02-02', '31996832599', 'gabriela@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('2', '9', 'Maria H.', '95175385456', '86-04-15', 'r. Guaicurus, 150', 'Mecânica', 'Elétrica', '21-01-10', '31989632588', 'mariah@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('2', '10', 'Elizabeth A.', '95175385123', '86-05-10', 'av. Cupertino, 100', 'Mecânica', 'Hidráulica', '21-10-12', '31979632577', 'elizabeth@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('3', '100', 'Alexandra Y.', '95175385998', '00-06-15', 'r. Zarati, 222', 'Atendimento', 'Técnico RH', '21-01-10', '31998632777', 'lele@mecanicashow.com');
INSERT INTO `oficina_mecanica`.`funcionario` (`fk_idEquipe`, `Código`, `Nome`, `CPF`, `data_nasc`, `Endereço`, `Cargo`, `Especialidade`, `Contratação`, `Telefone`, `E-mail`) VALUES ('3', '101', 'Branca N.', '95175385326', '00-07-19', 'av. Afonso Pena, 333', 'Atendimento', 'Técnico Administrativo', '21-10-12', '31999632258', 'branca@mecanicashow.com');

-- Inserindo Registros na tabela equipe_Orcamento --
INSERT INTO `oficina_mecanica`.`equipe_Orcamento` (`fk_idEquipe`, `fk_idOrcamento`) VALUES ('1', '1');
INSERT INTO `oficina_mecanica`.`equipe_Orcamento` (`fk_idEquipe`, `fk_idOrcamento`) VALUES ('1', '2');
INSERT INTO `oficina_mecanica`.`equipe_Orcamento` (`fk_idEquipe`, `fk_idOrcamento`) VALUES ('1', '3');
INSERT INTO `oficina_mecanica`.`equipe_Orcamento` (`fk_idEquipe`, `fk_idOrcamento`) VALUES ('2', '4');
INSERT INTO `oficina_mecanica`.`equipe_Orcamento` (`fk_idEquipe`, `fk_idOrcamento`) VALUES ('2', '5');

-- Inserindo Registros na tabela peca --
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Disco de Freio', 'Disco ventilado', '20', '306');
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Pastilhas', 'Pastilhas Jogo', '100', '110');
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Reparo Amortecedor', 'Conjunto', '150', '700');
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Bandeja', 'Conjunto dir/esq', '100', '400');
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Amortecedor dianteiro', 'Conjunto', '100', '800');
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Cabo de vela', 'Jogo', '100', '200');
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Vela', 'Jogo', '100', '300');
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Óleo Motor', '1Litro', '150', '30');
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Óleo Cambio', '1Litro', '100', '200');
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Pneu ', '185/65r15', '100', '300');
INSERT INTO `oficina_mecanica`.`peca` (`Nome_peca`, `Descrição`, `Quantidade_Disponível`, `Valor_Unitário`) VALUES ('Revisão', 'somente revisão', '0', '0');

-- Inserindo Registros na tabela Servico --
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Revisão', 'Revisão Basica', '1', 'Revisão de 15 itens', '80');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Revisão', 'Revisão Completa', '2', 'Revisão de 25 itens', '120');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Troca de Disco', '1', 'Troca do par de discos', '150');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Freios', '1', 'Troca conjuto de pastilhas', '100');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'rep_Suspensão', '2', 'Reparo do conjunto de amortecedores dianteiros', '150');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Bandeja', '1', 'Reparo do conjunto de bandeja dianteira', '200');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Amortecedores', '3', 'Troca dos amortecedores dianteiros', '200');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'cabos', '1', 'troca do conjunto de cabos', '50');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Óleo Motor', '1', 'Troca de óleo motor', '80');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Óleo Cambio', '1', 'Troca do óleo Cambio', '150');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Pneu', '1', 'Troca pneu por unidade', '50');
INSERT INTO `oficina_mecanica`.`Servico` (`Tipo do Servico`, `Nome_Servico`, `Duração`, `Descrição`, `Mão_de_Obra`) VALUES ('Manutenção', 'Vela_elétrica', '1', 'Troca do conjunto de velas', '50.00');

-- Inserindo Registros na tabela Servico_peca --
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('1', '2','11','1','1');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('1','11','10','4','4');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('2', '8', '6','1','1');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('2','12', '7','1','1');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('2', '9', '8','4','1');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('2','10', '9','4','1');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('3', '3', '1','1','1');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('3', '7', '5','1','1');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('4', '4', '2','1','1');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('4', '6', '4','1','1');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('5', '5', '3','1','1');
INSERT INTO `oficina_mecanica`.`Servico_peca` (`fk_idOrcamento`, `fk_idServico`, `fk_idpeca`,`Qtd_peca`,`Qtd_Servico`) VALUES ('5', '1','11','1','1');

-- Inserindo registros na OS --
INSERT INTO `oficina_mecanica`.`OS` (`Numero`, `Data_Emissão`, `Desconto`, `Data_Conclusão`, `fk_idOrcamento`, `Forma_Pagamento`) VALUES ('12345', '2022-10-20', '10', '2022-10-21', '1', 'Dinheiro');
INSERT INTO `oficina_mecanica`.`OS` (`Numero`, `Data_Emissão`, `Desconto`, `Data_Conclusão`, `fk_idOrcamento`, `Forma_Pagamento`) VALUES ('12356', '2022-10-21', '5', '2022-10-21', '2', 'Crédito');
INSERT INTO `oficina_mecanica`.`OS` (`Numero`, `Data_Emissão`, `Desconto`, `Data_Conclusão`, `fk_idOrcamento`, `Forma_Pagamento`) VALUES ('12378', '2022-10-19', '10', '2022-10-19', '4', 'Débito');
INSERT INTO `oficina_mecanica`.`OS` (`Numero`, `Data_Emissão`, `Desconto`, `Data_Conclusão`, `fk_idOrcamento`, `Forma_Pagamento`) VALUES ('12389', '2022-10-21', '5', '2022-10-22', '5', 'Crédito');

