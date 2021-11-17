-- Создание представлений
create view vw_goods            as select id_goods, id_categories, goods           from goods;
create view vw_goods_categories as select           id_categories, categories_name from goods_categories;

-- количество товаров по известным катекориям
select c.id_categories, count(id_goods) goods_cnt, categories_name
  from vw_goods_categories c inner join vw_goods g on c.id_categories = g.id_categories
group by c.id_categories, categories_name order by c.id_categories;

-- количество товаров по всем катекориям
select c.id_categories, count(id_goods) goods_cnt, categories_name
  from vw_goods_categories c left join vw_goods g on c.id_categories = g.id_categories
group by c.id_categories, categories_name order by c.id_categories;
