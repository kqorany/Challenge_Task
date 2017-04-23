Some Technical Details
======================

GRAPH
=====

* The social network problem is a typical problem of the undirected unweighted graph (vertices, edges). 
To implement the graph, I used two hashs: PEOPLE and FRIENDSHIPS. The PEOPLE hash is used to save the 
vertices, where the key of the hash is the person name and the value is an index of this name. 
Whereas, I used the FRIENDSHIPs hash to save the edges, where the key is the index and the value is an 
array to save the friends' indexes of this index. This method is known as an Adjacency list style.

* Example, assume we have a small network such as the following:
```
        KHALED_ABDELFADEEL,AMR_HASSAN
	ADAM_SHABIB,OMER_FAROUQ
	KHALED_ABDELFADEEL,OMER_FAROUQ
		.
		.
		.
		.
```
The PEOPLE and FRIENDSHIPS, in this case, will save the following: 
```
PEOPLE =
	[   
	KHALED_ABDELFADEEL => '0',
	AMR_HASSAN => '1',
	ADAM_SHABIB => '2', 
	OMER_FAROUQ => '3',
		.
		.
		.
		.
	]	
```
```
FRIENDSHIPS =
	[   
	'0' => ['1','3'],
	'1' => ['0'],
	'2' => ['3'], 
	'3' => ['0','3'],
		.
		.
		.
		.
	]	
```
MINIMUM TIES
============

* The minimum ties between two persons in a network is a typical problem of the shortest path problems. 
I used the Breadth First Search (BFS) method to solve this problem, which is known to solve this
type of problem in ```O(|V|+|E|)``` time, where ```|V|``` is the vertex set and ```|E|``` is the edge set.  

* For more information about this technique:
	https://en.wikipedia.org/wiki/Breadth-first_search
	
