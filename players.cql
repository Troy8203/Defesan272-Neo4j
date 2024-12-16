CREATE (rob: Person{name: 'Roberto'}),
    (isidro: Person{name: 'Isidro'}),
    (tony: Person{name: 'Antonio'}), 
    (nora: Person{name: 'Nora'}),
    (lily: Person{name: 'Lilian'}),
    (freddy: Person{name: 'Alfredo'}),
    (lucas: Person{name: 'Lucas'}),
    (mau: Person{name: 'Mauricio'}),
    (alb:Person{name: 'Albina'}),
    (reg: Person{name: 'Regina'}),
    (j: Person{name: 'Joaquín'}),
    (julian: Person{name: 'Julián'})

CREATE (rob)-[:Friendswith]->(isidro),
    (rob)-[:Friendswith]->(tony),
    (rob)-[:Friendswith]->(reg),
    (rob)-[:Friendswith]->(mau),
    (rob)-[:Friendswith]->(julian),
    (tony)-[:Friendswith]->(reg),
    (tony)-[: Friendswith]->(j),
    (alb)-[:Friendswith]->(reg),
    (lily)-[:Friendswith]->(isidro),
    (lily)-[:Friendswith]->(j),
    (mau)-[:Friendswith]->(lucas),
    (lucas)-[:Friendswith]->(nora),
    (freddy)-[: Friendswith]->(nora);

MATCH friendships=()-[:Friendswith]-()
RETURN friendships

MATCH (n)-[:Friendswith*2]-(fof)
WHERE n. Name = 'Roberto'
RETURN n.Name, fof. Name