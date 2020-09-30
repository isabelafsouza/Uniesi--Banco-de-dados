use world;

-- Mostre os nomes dos países e seus continentes.
select Name, Continent from country;

-- Mostre os nomes dos países, região e a população dos países do continente ‘Europe’.
select Name, Region, Population from country 
where country.Continent='Europe';

-- Mostre a expectativa de vida das pessoas do continente ‘Asia'.
select LifeExpectancy from country 
where country.Continent='Asia';

-- Crie uma view que mostre os nomes dos países, seu presidente (HeadOfState), tipos de
-- governo (GovernmentForm) e a população dos países do continente ‘South America’ e com
-- população maior que 2000000.

create view vw_InfoPaises as
select co.Name as Paises, co.HeadOfState as Presidente, co.GovernmentForm as Tipo_Governo,
co.Population as Populacao from country co 
where co.Continent='South America' and 
co.Population>2000000;
select * from vw_InfoPaises;

-- Crie uma view que mostre os nomes dos países, tamanho da sua área (surfaceArea) e seu
-- idioma. Exibir somente os países com idioma ‘English’ como oficial. Ordenar pelo tamanho da
-- área (da menor para maior). Mostre também como usar a View.

create view vw_TerritorioPaises as
select co.Name as Paises, co.SurfaceArea as Area, cl.Language as Idioma from country co, countrylanguage cl
where cl.countryCode= co.Code and 
cl.language='English' and cl.IsOfficial= 'T' order by co.SurfaceArea asc;

select * from vw_TerritorioPaises;

-- Altere a view do exercício anterior para incluir a porcentagem de pessoas que falam o idioma
-- ‘English’ como oficial. Mostre também como usar a View.
alter view vw_TerritorioPaises as
select cl.percentage as Porcentagem, co.Name as Paises, co.SurfaceArea as Area, cl.Language as Idioma from country co, countrylanguage cl
where cl.countryCode= co.Code and 
cl.language='English' and cl.IsOfficial= 'T' order by co.SurfaceArea asc;

select * from vw_TerritorioPaises;