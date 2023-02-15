
    INSERT INTO clientes (nome, lealdade)
    VALUES ('Georgia', 0);

    INSERT INTO pedidos (status, cliente_id)
    VALUES ('Recebido', (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia'));

    INSERT INTO produtos_pedidos (pedido_id, produto_id)
    VALUES 
    ((SELECT pedidos.id FROM pedidos WHERE pedidos.id = (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')), 
    (SELECT produtos.id FROM produtos WHERE produtos.nome = 'Big Serial') 
    ),  
    ((SELECT pedidos.id FROM pedidos WHERE pedidos.id = (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')),
    (SELECT produtos.id FROM produtos WHERE produtos.nome = 'Varchapa')
    ),
    ((SELECT pedidos.id FROM pedidos WHERE pedidos.id = (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')),
	(SELECT produtos.id FROM produtos WHERE produtos.nome = 'Fritas')
	),
	((SELECT pedidos.id FROM pedidos WHERE pedidos.id = (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')),
	(SELECT produtos.id FROM produtos WHERE produtos.nome = 'Coca-Cola')
    ),
	((SELECT pedidos.id FROM pedidos WHERE pedidos.id = (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')),
	(SELECT produtos.id FROM produtos WHERE produtos.nome = 'Coca-Cola')
	);

    SELECT c.id, c.nome, c.lealdade, pedidos.id, pedidos.status, cliente_id, produto_id, p.nome, p.tipo, p.preço, p.pts_de_lealdade
    FROM pedidos  
        JOIN produtos_pedidos pp ON pedidos.id = pp.pedido_id
        JOIN produtos p ON pp.produto_id = p.id
        JOIN clientes c ON pedidos.cliente_id = c.id
    WHERE c.nome = 'Georgia';

    UPDATE clientes c
    SET lealdade = (SELECT sum(p.pts_de_lealdade) FROM pedidos
        JOIN produtos_pedidos pp ON pedidos.id = pp.pedido_id
        JOIN produtos p ON pp.produto_id = p.id
        JOIN clientes c ON pedidos.cliente_id = c.id 
    WHERE c.nome = 'Georgia')
    WHERE c.nome = 'Georgia'
    RETURNING *;

    DELETE FROM clientes c WHERE c.nome = 'Marcelo'
    RETURNING *;


