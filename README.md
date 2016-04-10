# Irish Constituencies Neo4j Database
###### Alanna Curran, G00309741

## Introduction
In 2016 there was a general election in the Republic of Ireland. The country is divided into constituencies, with a number of seats available in each. A large number of candidates ran in each constituency.

I was required to submit a Neo4j graph database and three interesting Cypher queries that run on the database. I also had to submit supporting documentation, including references, and any relevant code I used to create my database.

My task was to represent information about each of the constituencies in a Neo4j database. My database had to store each constituency as a node, store each candidate as a node and have a relationship between constituencies and candidates showing who ran in which constituency. I had to then augment the database with information found from other sources, such as the Central Statistics Office and other governmental agencies.

## Database
My database holds 40 Constituency nodes, 15 Party nodes and 553 Candidate nodes.
The candidates have relationsips to the parties and constituencies. For example: Heather Humphry is a member of Fine Gael and belongs to the Cavan-Monaghan constituency. 
Creating the database was quite tedious as each of the 553 relationships had to be pasted in one by one. I checked places like stack overflow and neo4j's documentation for a quicker way, but was unsuccessful.

1. The Constituency nodes are created by copying and pasting all the code from CreateConstituencyNodes.txt
1. The Party nodes are created by copying and pasting all the code from CreatePartyNodes.txt
1. The Candidate node are created by importing the Candidates.csv file into neo4j.
1. Once all the nodes are created an index must be made for each one. this is dove quite simpilly by pasting these 3 lines into neo4j.
```cypher

CREATE INDEX ON :Constituency(Name);
CREATE INDEX ON :Party(Name);
CREATE INDEX ON :Candidate(Name);

```
1. As mentioned above I have to copy and paste each relationship into neo4j from CreateRelationships.txt. I will continue to search for a quicker and easier method to create the relationships.

## Queries
The first query searches and returns all candidates that got a seat in the elections.
The second query shows all the candidates from tipperary.
The third query counts the number of Candidates in the Green Party.

#### Query one title
This query searches and returns all candidates that got a seat in the elections.
```cypher
MATCH
	(candidate:Candidate {Elected: "Yes"})
RETURN
	candidate;
```

#### Query two title
This query shows all the candidates from tipperary.
```cypher
MATCH
	(candidate:Candidate)<-[:HAS]-(constituency:Constituency {Name:"Tipperary"})
RETURN
	candidate;
```

#### Query three title
This query counts the number of Candidates in the Green Party.
```cypher
MATCH
	(candidate:Candidate)-[:MEMBER_OF]->(party:Party {Name:"Green Party"})
RETURN
	count(candidate);
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.
