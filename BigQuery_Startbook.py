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

BigQueryHelper.query_to_pandas(query) # This method takes a query and returns a Pandas dataframe.
BigQueryHelper.query_to_pandas_safe(query, max_gb_scanned=1)
# This method takes a query and returns a Pandas dataframe only if the size of the query is less than the upperSizeLimit (1 gigabyte by default).

# only run this query if it's less than 100 MB
hacker_news.query_to_pandas_safe(query, max_gb_scanned=0.1)

# check out the scores of job postings (if the 
# query is smaller than 1 gig)
job_post_scores = hacker_news.query_to_pandas_safe(query)

# average score for job posts
job_post_scores.score.mean()  # 2.1562956775944873

