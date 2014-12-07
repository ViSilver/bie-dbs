1) List all release years of all movies.

select year 
from movie;

2) Select the titles of the movies which were sold.

select distinct title 
from movie mo, copy co, sale s
where mo.MOID=co.moid and s.coid=co.coid;

3) Find the name of the shop assistant, the name of the customer and the date when the "Titanic" movie was sold.

select shap.name "Shop assistant", cust.name "Customer", date1
from customer cust, sale s, shop_assistant shap, copy co, movie mo
where cust.cuid=s.cuid and shap.shaid=s.shaid and co.coid=s.coid
	  and mo.moid=co.moid and mo.title='Titanic';

4) Find the coid which were not sold.

select coid
from copy
minus
select coid
from sale;

5) Find the coid which were not sold.

select coid 
from copy 
where coid not in ( select coid
					from sale)
order by coid;

6) Find the coid which were not sold.

select coid 
from copy co
where not exists (select *
				  from sale s
				  where co.coid=s.coid)
order by coid;

7) Find all 'Comedy' and 'Action' movies.

select title
from movie mo
where moid in (select moid
			  from movie_genres mg join genre g using(geid)
			  where g.name='Comedy'
			  intersect
			  select moid
			  from movie_genres mg join genre g using(geid)
			  where g.name='Action');

8) Find all 'Comedy' or 'Action' movies.

select title
from movie mo
where moid in (select moid
			  from movie_genres mg join genre g using(geid)
			  where g.name='Comedy'
			  union
			  select moid
			  from movie_genres mg join genre g using(geid)
			  where g.name='Action');

9) How many 'Drama' movies are registred in table "movie".

select count(title) "Nr movies"
from movie join movie_genres mg using(moid) join genre g on (mg.geid=g.geid) --using(geid)
where g.name='Drama';

10) Find the shop assistants (name, surname) who sold more than 3 copies of movies.

select name, surname
from shop_assistant shas
where 2 < ( select count(*)
			from sale s
			where s.shaid = shas.shaid);

11) What is the average release year of the movies?

select round(avg(year), 0) as "Average release year"
from movie;

12) Find the shop assistants (name, surname) who sold more than 3 copies of movies.

select name, surname
from shop_assistant join sale using(shaid)
group by name, surname
having count(*) >= 3;

13) For each genre find the number of movies it has. Include genres without movies.

select g.GEID, name "Genre", count(mg.geid) "Nr of movies"
from genre g left outer join movie_genres mg on (g.geid=mg.geid) 
			 join movie using (moid)
group by g.GEID, name;

14) For each genre find the number of movies it has. Include genres without movies.

select g.geid, g.name as "Genre",
	(select count(*) 
	 from movie_genres mg 
	 where g.geid = mg.geid) as "Nr of movies"
from genre g;

15) List the names of actors and the number of movies they acted in. Order the list descending by the nr. of movies.

select surname, name, count(distinct mac.MOID) as "Nr of movies"
from actor ac, movie_actor mac, movie mo
where ac.actid=mac.actid and mo.moid=mac.MOID 
group by surname, name
order by "Nr of movies" desc;

16) List the names of actors and the number of movies they acted in. Order the list descending by the nr. of movies. Hide actors with only one movie.

select surname, name, count(distinct mac.MOID) as "Nr of movies"
from actor ac, movie_actor mac, movie mo
where ac.actid=mac.actid and mo.moid=mac.MOID
group by surname, name
order by "Nr of movies" desc;
----------------------------------
select name, surname, nr_movies "Nr of movies"
from actor ac, (select count(distinct moid) as nr_movies, actid
				from movie_actor
				group by actid) nr_mact
where ac.ACTID=nr_mact.ACTID 
order by nr_movies desc;
----------------------------------

17) List the names of actors and the number of movies they acted in if the release year is more recent than 1980. Order the list descending by the nr. 
of movies. 

select surname, name, count(distinct mac.MOID) as "Nr of movies"
from actor ac, movie_actor mac, movie mo
where ac.actid=mac.actid and mo.moid=mac.MOID and mo.year > 1980
group by surname, name
order by "Nr of movies" desc;
----------------------------------
select name, surname, nr_movies "Nr of movies"
from actor ac, (select count(distinct moid) as nr_movies, ACTID 
				from movie_actor join movie
				using (moid)
				where movie.year > 2000
				group by actid) nr_mact
where ac.ACTID=nr_mact.ACTID 
order by nr_movies desc;

18) Create a view "Favourite_movies" (moid, title, year) which were sold more than 2 times.

create or replace view Favourite_movies as
	select mo.moid, title, year
	from movie mo, (select moid, count(moid) as nr_copies
					from copy co
					where exists (select *
						from sale s
						where s.coid = co.coid)
					group by moid) temp
	where mo.moid=temp.moid and  temp.nr_copies >= 2;

19) List the years of the favourite_movies.

select distinct year
from favourite_movies;

20) Cuid and name of the customer who was served by all the shop assistants.

select cu.cuid, cu.name
from customer cu
where not exists (select shas.shaid
				  from shop_assistant shas
				  where not exists (select s.shaid
									from sale s
									where s.shaid = shas.shaid and cu.cuid = s.cuid));

21) Genre id and name which doesn''t have a movie.

select g.geid, g.name
from genre g
where g.geid not in (select mog.geid
				  from movie_genres mog);

22) Delete movies which were never sold.

delete movie
where moid not in (select moid
				  from copy co 
				  where co.moid = mo.moid and exists (select 'X'
													  from sale s
													  where s.coid = co.coid));

23) Update the year = year + 1 to all movies.

update movie
set year = year - 1;

24) Find the name, address of the movie shop where works the shop assistant who has sold the max. nr. of copies.

select msh.name, msh.address
from movieshop msh join shop_assistant using(moshid)
where shaid = ( select shaid
                from (select count(coid) as nr_copies, shaid
                      from sale s
                      group by shaid
                      order by nr_copies desc)
                      where rownum = 1);
