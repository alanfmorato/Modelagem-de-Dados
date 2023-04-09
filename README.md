# Modelagem-de-Dados

![image](https://user-images.githubusercontent.com/102003274/230799368-cc83d9aa-7a07-4d42-8604-adc16cfb0fbc.png)

Os livros podem ter devoluções parciais, ou seja, um aluno pode pegar emprestado 3 livros diferentes e devolver apenas um.
1. **Listar o nome da pessoa do empréstimo de número 1.**
    1. select e.emp_cod, p.pes_nome from Emprestimo e
    left join Pessoa p
    on e.pes_cod = p.pes_cod
    where e.emp_cod = 1
    
-------------------------------------------------------------------------------------------------------------------------------------
2. **Listar todas as editoras ordenadas por ordem alfabética.**
    1. select edi_descricao from editora
    order by edi_descricao asc
-------------------------------------------------------------------------------------------------------------------------------------

3. **Exibir os títulos dos livros que começam com a letra A.**
    1. select liv_titulo from livro where liv_titulo like "a%”
-------------------------------------------------------------------------------------------------------------------------------------

4. **Exibir os títulos dos livros que começam com a letra A e que tenham o ano de publicação maior que 2013.**
    1. select liv_titulo, anopublicacao from livro
    where liv_titulo like 'a%' and anopublicacao > 2013
-------------------------------------------------------------------------------------------------------------------------------------

5. **Exibir a quantidade de telefones que possuem DDD igual a 12**
    1. select count(tel_ddd) as quantidade_ddd from telefone
    where tel_ddd = 12
-------------------------------------------------------------------------------------------------------------------------------------

6. **Listar a quantidade de empréstimo por aluno. (exiba: - pes_nro_matricula e - quantidade).**
    1. select a.PES_NRO_MATRICULA, count(e.EMP_COD) as quantidade from emprestimo e
    left join aluno a
    on e.pes_cod = a.pes_cod
    group by a.PES_NRO_MATRICULA
    order by quantidade desc
-------------------------------------------------------------------------------------------------------------------------------------

7. **Listar as editoras e os seus livros. (exiba: - edi_cod,edi_descricao, - liv_cod).**
    1. select e.EDI_COD, e.EDI_DESCRICAO, l.liv_cod  from editora e
    left join livro l
    on e.EDI_COD = l.EDI_COD
-------------------------------------------------------------------------------------------------------------------------------------

8. **Listar os códigos dos exemplares (exe_cod), a descrição (exe_descricao) do empréstimo realizado em uma determinada data.**
    1. select e.EXE_COD, e.EXE_DESCRICAO, P.EMP_DATA_EMPRESTIMO from exemplar e
    left join item_emprestimo i
    on e.EXE_COD = i.EXE_COD
    left join emprestimo p
    on i.EXE_COD = p.EMP_COD
    WHERE EMP_DATA_EMPRESTIMO = '03-NOV-15'
 -------------------------------------------------------------------------------------------------------------------------------------

9. **Listar os livros que possuam mais de 3 exemplares.**
    1. SELECT * FROM (SELECT L.LIV_COD, COUNT(L.LIV_COD) AS QUANTIDADE FROM LIVRO L
    LEFT JOIN EXEMPLAR E
    ON L.LIV_COD = E.LIV_COD
    GROUP BY L.LIV_COD)
    WHERE QUANTIDADE > 3
 -------------------------------------------------------------------------------------------------------------------------------------

10. **Listar os professores (nome e titulação) com seus respectivos telefones. OBS: Listar também os professores que não tenham telefone. Realizar duas resoluções uma com a sintaxe ANSI e outra com a sintaxe ORACLE.**
    1. SELECT P.PES_COD, P.TITULACAO, T.TEL_NUMERO FROM PROFESSOR P
    LEFT JOIN PESSOA A
    ON P.PES_COD = A.PES_COD
    LEFT JOIN TELEFONE T
    ON A.PES_COD = T.PES_COD
 -------------------------------------------------------------------------------------------------------------------------------------

11. **Listar o livro (liv_titulo) mais antigo da biblioteca**
    1. select * from (SELECT LIV_COD, LIV_TITULO, EDICAO, ANOPUBLICACAO, EDI_COD FROM LIVRO
    ORDER BY ANOPUBLICACAO )
    where rownum = 1
 -------------------------------------------------------------------------------------------------------------------------------------

12. **Exibir o nome da pessoa que mais emprestou livro na biblioteca.**
    1. SELECT P.PES_COD, P.PES_NOME, COUNT(P.PES_COD) AS QUANTIDADE FROM PESSOA P
    LEFT JOIN EMPRESTIMO E
    ON P.PES_COD = E.PES_COD
    GROUP BY P.PES_COD
-------------------------------------------------------------------------------------------------------------------------------------

13. **Listar a quantidade de exemplares por livro.**
    1. SELECT L.LIV_COD, COUNT(L.LIV_COD) AS QUANTIDADE FROM LIVRO L
    LEFT JOIN EXEMPLAR E
    ON L.LIV_COD = E.LIV_COD
    GROUP BY L.LIV_COD
 -------------------------------------------------------------------------------------------------------------------------------------

14. **Listar os livros (liv_titulo) que começam com A e possuem ano de publicação maior que 2011.**
    1. SELECT L.LIV_COD, L.LIV_TITULO, L.ANOPUBLICACAO FROM LIVRO L
    WHERE LIV_TITULO LIKE 'A%' AND L.ANOPUBLICACAO > 2011
-------------------------------------------------------------------------------------------------------------------------------------

15. **Listar os livros emprestados pela pessoa de código 1 (Listar liv_titulo)**
    1. SELECT P.PES_COD, P.PES_NOME, L.LIV_COD, L.LIV_TITULO
    FROM PESSOA P
    LEFT JOIN EMPRESTIMO E
    ON P.PES_COD = E.PES_COD
    LEFT JOIN ITEM_EMPRESTIMO I
    ON E.EMP_COD = I.EMP_COD
    LEFT JOIN EXEMPLAR EX
    ON I.EXE_COD = EX.EXE_COD
    LEFT JOIN LIVRO L
    ON EX.LIV_COD = L.LIV_COD
    WHERE P.PES_COD = 1
