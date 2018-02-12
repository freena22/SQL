## USE BIGQUERY DATASETS 

import bq_helper   # python BigQuery package

# create a helper object for our bigquery dataset
hacker_news = bq_helper.BigQueryHelper(active_project= "bigquery-public-data", 
                                       dataset_name = "hacker_news")
                                       
# Check out the structure of your dataset
# print a list of all the tables in the hacker_news dataset
hacker_news.list_tables()

# print information on all the columns in the "full" table
hacker_news.table_schema("full")

# preview the first couple lines of the "full" table
hacker_news.head("full")
# preview the first ten entries in the by column of the full table
hacker_news.head("full", selected_columns="by", num_rows=10)


# Check the size of your query before you run it
query = """SELECT score
            FROM `bigquery-public-data.hacker_news.full`
            WHERE type = "job" """

# check how big this query will be
hacker_news.estimate_query_size(query)

# 0.15188 -- Running this query will take around 150 MB

# Actually run a query

