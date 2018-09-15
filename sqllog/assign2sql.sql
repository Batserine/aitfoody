********* 7 **********
create table my_stocks (
symbol
varchar(20) not null,
n_shares
integer not null,
date_acquired
date not null
);

********* 7.1 **********
COPY  my_stocks FROM STDIN with delimiter E'\t';

********* 7.2 **********
select * from my_stocks;

********* 8 **********
create table stock_prices AS select symbol, current_date as quote_date,31.45 as price from my_stocks;

********* 8.1 **********
select * from stock_prices;

********* 8.2 **********
create table newly_acquired_stocks (
symbol
varchar(20) not null,
n_shares
integer not null,
date_acquired
date not null
);
********* 8.3 **********
insert into newly_acquired_stocks select * from my_stocks where n_shares>100;
********* 8.4 **********
select * from newly_acquired_stocks;

********* 9 **********
select my_stocks.symbol,my_stocks.n_shares,stock_prices.price,stock_prices.quote_date from my_stocks JOIN stock_prices ON my_stocks.symbol=stock_prices.symbol;

********* 10 **********
insert into my_stocks values('nyse',105,'2017-05-08');

********* 10.1 **********
select my_stocks.symbol,my_stocks.n_shares,stock_prices.price,stock_prices.quote_date from my_stocks JOIN stock_prices ON my_stocks.symbol=stock_prices.symbol;

********* 10.2 **********
select my_stocks.symbol,my_stocks.n_shares,stock_prices.price,stock_prices.quote_date from my_stocks FULL OUTER JOIN stock_prices ON my_stocks.symbol=stock_prices.symbol;

********* 11 **********
create or replace function sym (string varchar)
returns integer as $$
declare
ascii_total integer := 0;
chars varchar[];
c varchar;
begin
select regexp_split_to_array(string, '') into chars;
foreach c in array chars
loop
ascii_total = ascii_total + ascii(c);
end loop;
return ascii_total;
end;
$$ LANGUAGE plpgsql;

********* 11.1 **********
select sym(symbol) from my_stocks;
********* 11.2 **********
update stock_prices set price=sym(symbol);
********* 11.3 **********
select * from stock_prices;
********* 11.4 **********
CREATE OR REPLACE Function portfolio_value ()
RETURNS NUMERIC
AS $$
DECLARE
c1 CURSOR FOR SELECT * FROM my_stocks NATURAL LEFT OUTER JOIN stock_prices;
total_val NUMERIC DEFAULT 0;
stk_val NUMERIC DEFAULT 0;
stk RECORD;
BEGIN
OPEN c1;
LOOP
FETCH c1 INTO stk;
IF stk IS NOT NULL THEN
IF stk.price>0 THEN
stk_val := (stk.n_shares * stk.price);
total_val := total_val + stk_val;
ELSE
stk_val := 0;
END IF;
RAISE NOTICE 'Value of: % = %', stk.symbol,stk_val;
END IF;
EXIT WHEN NOT FOUND;
END LOOP;
CLOSE c1;
RETURN total_val;
END;
$$ LANGUAGE plpgsql;
********* 11.5 **********
select portfolio_value();

********* 12 **********
SELECT AVG(price) FROM stock_prices ;
********* 12.1 **********
INSERT INTO my_stocks 
select symbol, n_shares, NOW() from my_stocks NATURAL JOIN stock_prices, (SELECT AVG(price) as avgp FROM stock_prices) as avg_price WHERE stock_prices.price > avg_price.avgp;
********* 12.2 **********
select * from my_stocks ;
********* 12.3 **********
select * from my_stocks NATURAL FULL OUTER JOIN  stock_prices ;
********* 12.4 **********
SELECT my_stocks.symbol, SUM(n_shares) total_shares_held, MAX(date_acquired) date_acquired from my_stocks group by my_stocks.symbol;
********* 12.5 **********
SELECT my_stocks.symbol, SUM(n_shares) total_shares_held, MAX(date_acquired) date_acquired, stock_prices.price, (SUM(n_shares)*stock_prices.price) total_value_held FROM my_stocks NATURAL FULL OUTER JOIN stock_prices group by my_stocks.symbol, stock_prices.price ;
********* 12.6 **********
select my_stocks.symbol, SUM(n_shares) total_shares_held, MAX(date_acquired) date_acquired, stock_prices.price, (SUM(n_shares)*stock_prices.price) total_value_held from my_stocks NATURAL FULL OUTER JOIN stock_prices group by my_stocks.symbol, stock_prices.price having count(symbol)>1;

********* 13 **********
CREATE VIEW stocks_i_like AS
select my_stocks.symbol, SUM(n_shares) total_shares_held, MAX(date_acquired) date_acquired, stock_prices.price, (SUM(n_shares)*stock_prices.price) total_value_held from my_stocks NATURAL FULL OUTER JOIN stock_prices group by my_stocks.symbol, stock_prices.price having count(symbol)>1;
********* 13.1 **********
select * from stocks_i_like ;
