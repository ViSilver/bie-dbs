<img src="https://cdn3.iconfinder.com/data/icons/movie-video/512/Icon_8-512.png" width="110" align="left"/> <img src="https://cdn4.iconfinder.com/data/icons/simplus-entertainment-icons/211/Layer_11-01-512.png" width="150" align="right"/> 
</br>
</br>
</br>
</br>
 Turcanu Victor
 ========
 [turcavic@fit.cvut.cz]
 
## Description

>There is a **movie shop** system. Each shop has one or more **managers**, **shop assistants** and **customers**. In order to perform a better management of movie **loan/shoppings**, there is a database of **movies** (of the products).

>Each **shop** is identified by a movie shop id number (**MAID**). It has its name and address, which are mandatory attributes.

>Each **Manager** is identified by his id number (**MAID**). A manager has a name, a surname - both this attributes are mandatory. 

>Each **Movie Shop** has one or more **Shop Assistants**. Each Shop Assistant is identified by its id number (**SHAID**). As with Managers, Shop Assistant has 2 attributes: name, surname. 

>There is also a **Customer**, which is identified by his id number (**CUID**). Each customer must have a name and a surname.

>In order to perform a better search of a specific movie, we must have a new entity **Movie**, which must be identified by a unique id number (**MOID**). It must have a name, year of realease, an optional list of awards for the movie and also two mandatory lists of actors which play in it and of the genres of the movie. 

>The list of **actors** will be stored in another entity - Movie_Actors. This one will make the relationship between the movie and the actor which in it. each relation is identified by an id (MoActID). Its attributes are the ids of the movie and of the actor. We create a similar entity for the genres: id number - MoGeID, the ids of the movie and of the genre. The same is for the list of awards: Each relation is identified by a unique id number (MoAwID). Its attributes are the ids of the movie and of the awards. 

 
 [turcavic@fit.cvut.cz]:http://daringfireball.net/
 





