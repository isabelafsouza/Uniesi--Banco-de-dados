use bdnp;

-- Mostre a média de salários da folha de pagamento.
select avg(salario) from Funcionarios;

-- Mostre os nomes, a função dos funcionários e o departamento que ele trabalha. Agrupando
-- pelo nome do departamento.
select f.primeiro_Nome, f.funcao, d.nome from Funcionarios f, Departamentos d
where d.codigo_Depto=f.codigo_Depto 
group by d.nome;

-- Mostre os nomes, o endereço, RG e CPF dos funcionários que trabalham no departamento de TI
select f.primeiro_Nome, f.endereco,f.rg, f.cpf, d.nome from Funcionarios f, Departamentos d
where d.codigo_Depto=f.codigo_Depto and
d.nome= 'TI';

-- Mostre o nome e os salários dos funcionários que nasceram entre 01/01/1980 a 31/12/1990.
select primeiro_Nome, salario from Funcionarios 
where data_nasc>'1980-01-01' and
data_nasc<'1990-12-30';

