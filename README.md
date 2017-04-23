Software Challenge Task implementation in Perl
==============================================

Description
===========

The program determines the total number of people in  a social network, in addition, determining the minimum 
ties between two members of the network.

Usage
=====

This program takes three arguments as inputs::

* The first argument is the social netwrok input file as a txt file. Each line in the file should provides the names (without any spaces inbetween) of two people who are friends. The names of friends should be seperated by comma.
Example of the network file:
```
        KHALED_ABDELFADEEL,AMR_HASSAN
	ADAM_SHABIB,OMER_FAROUQ
		.
		.
		.
		.
```

* The second and third are the names of the persons you would like to check the minimum ties between them.

* Example of how to run the program
```bash
$ perl challenge_task.pl file.txt NAME_1 NAME_2
```

* Note: the second and the third arguments are not compulsory unlike the first argument. In case the user wouldn't provide these names, the program will use the default persons who are STACEY_STRIMPLE and RICH_OMLI.
```bash
$ perl challenge_task.pl
```

Output
======

* The program will create an OUT file, from the same folder you are calling the program, to save the outputs in addition printing summery of the results on the terminal.
