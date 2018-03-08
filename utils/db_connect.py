"""
Function to run sql query from python using psycopg2
requires environment_variables with database parameters
set.
"""
import os
import sys
import pandas as pd
import psycopg2

def query(sql_query):
    """ connect to PostgreSQL database server with psycopg2 and run query """

    conn = None

    try:
        conn = psycopg2.connect(dbname = os.environ['PGDATABASE'],
                                host = os.environ['PGHOST'],
                                user = os.environ['PGUSER'],
                                password = os.environ['PGPASSWORD']
                                )
        cur = conn.cursor()
        cur.execute(sql_query)
        colnames = [desc[0] for desc in cur.description]
        rows = cur.fetchall()
        data = pd.DataFrame(rows, columns=colnames)
        cur.close()
        return data
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

if __name__ == '__main__':
    # run queries from command line taking query as argument
    data = query(sys.argv[1])
    print(data)
