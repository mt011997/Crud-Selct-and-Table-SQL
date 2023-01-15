-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
    SELECT pp.pedido_id, p.status, pp.produto_id, pr.nome, pr.tipo, pr.preço, pr.pts_de_lealdade as pontos_de_lealdade_do_produto
    FROM produtos_pedidos pp
    JOIN produtos pr ON pp.produto_id = pr.id
    JOIN pedidos p ON pp.pedido_id = p.id
    JOIN clientes c ON p.cliente_id = c.id;
-- 2)
    SELECT pp.pedido_id ID
    FROM produtos_pedidos pp
    JOIN produtos pr ON pp.produto_id = pr.id
    JOIN pedidos p ON pp.pedido_id = p.id
    JOIN clientes c ON p.cliente_id = c.id
    WHERE pr.nome = 'Fritas';
-- 3)
    SELECT c.nome gostam_de_Fritas
    FROM produtos_pedidos pp
    JOIN produtos pr ON pp.produto_id = pr.id
    JOIN pedidos p ON pp.pedido_id = p.id
    JOIN clientes c ON p.cliente_id = c.id
    WHERE pr.nome = 'Fritas';
-- 4)
    SELECT sum(p.preço)
    FROM pedidos
	JOIN produtos_pedidos pp on pedidos.id = pp.pedido_id
	JOIN produtos p on pp.produto_id = p.id
	JOIN clientes c on pedidos.cliente_id = c.id 
    WHERE c.nome = 'Laura';

-- 5)
    SELECT  p.nome, count(p.nome)
    FROM pedidos
    JOIN produtos_pedidos pp ON pedidos.id = pp.pedido_id
    JOIN produtos p ON pp.produto_id = p.id
    JOIN clientes c ON pedidos.cliente_id = c.id
    GROUP BY p.nome
    ORDER BY p.nome;
