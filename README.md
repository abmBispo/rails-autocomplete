# Rails Autocomplete with ElasticSearch and SearchKick

### Intention
My intention to build this repo was to share my brief knowledge about this subject: full-text search, or just **FTS**. As you will see I've made some tests and research to reach that conclusion, some links in the last section could help anyone who wants to understand what I've read and (why not?) even help and make some contributions to this very repository (PR's are appreciated).

This repository contains a Rails 6.X API that uses the [SearchKick gem](https://github.com/ankane/searchkick) to produce great recommendations (by FTS) based on user's input. It's a simple tiny HTTP API that lets you create posts with title and body fields (as you will see later) and make searches that approaches to real good recommendations, not only simples string comparison. For that purpose I will begin investigating if there are other solutions to the FTS approach besides ElasticSearch.

### ElasticSearch x PostgreSQL x MySQL
A simple "googling" can bring to you a bunch of ways to perform FTS in more common DBMS like MySQL or PostgreSQL. It's almost always better to choose a more tested and spread alternative against a "new" - *even ElasticSearch isn't that young* - technology concerning the community and software reliability. So why not choose the old silver-bullet between PostgreSQL and MySQL?

There are a couple of ways we can have FTS in MySQL: Natural Language search and Boolean search. Language search is clearer for our comprehension because it is simply searching word-by-word comparing the query against the fields you specify. The rows that have more correspondences with your query string will score more and be ranked by this very score. Zero score means no correspondence and that rows don't are returned in MySQL FTS. Check this example (*obfuscated parts that could be sensitive*):
```SQL
SELECT CASE WHEN LENGTH(content) > 140
          THEN CONCAT(SUBSTRING(content, 1, 140), '...')
          ELSE content
       END AS adapted_content,
       MATCH(content) AGAINST ('lei' IN NATURAL LANGUAGE MODE) AS score
FROM posts;
```
![MySQL Example](https://raw.githubusercontent.com/abmBispo/rails-autocomplete/master/docs/example_mysql.jpeg)

In the **boolean approach** you can use some other tools that can change the "score" for each word individually. Using the natural language mode you could find some good matches and it's easy to implement, mainly if we compare to the boolean mode. But this doesn't cover use cases when the user types the input incorrectly. So it expects from the user **great accurate way of writing** - and this's never the truth. The same case for PostgreSQL: there are some ways you can do FTS, but . Here we have a problem we can solve only by *analyzing the string deeper*. Look when we just change 'lei' to 'le' (remove 'i'), that happens to our score:
![MySQL Example](https://raw.githubusercontent.com/abmBispo/rails-autocomplete/master/docs/example_2_mysql.jpeg)

In order to solve this issue ElasticSearches implemented it's FTS with [Java Lucene Engine](https://www.tutorialspoint.com/lucene/lucene_standardanalyzer.htm). It brings to us a bunch of tools like misspellings interpretation, stemming and special characteres - *como acentos na minha língua pátria!* - and others. All this stuff can be really complex to develop by our own, so it's extremely justifiable use ElasticSearch if you seek for those tools.

### Dependencies
* Ruby version: **2.6.0**
* ElasticSearch version: **7.6.2**
* PostgreSQL version: **12.1**
* MySQL version: **14.14**

### Setup
```bash
  $ git clone git@github.com:abmBispo/rails-autocomplete.git
  $ cd rails-autocomplete
  $ bundle install
```

### Database setup
```bash
  $ rails db:create db:migrate db:seed
```

### Iniciar aplicação
```bash
  $ rails s
```
### Documentation
### Links
* [Java Lucene Engine](https://www.tutorialspoint.com/lucene/lucene_standardanalyzer.htm)
* [SearchKick gem](https://github.com/ankane/searchkick)
* [Postgres FTS](https://www.postgresql.org/docs/10/functions-textsearch.html)
* [MySQL FTS](https://www.w3resource.com/mysql/mysql-full-text-search-functions.php)
