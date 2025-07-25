# 🎧 Spotify ETL Pipeline (Serverless with AWS & Snowflake)

An end-to-end data engineering project that extracts playlist data from Spotify, transforms it using AWS Lambda, stores it in S3, and auto-ingests it into Snowflake using Snowpipe.



## 📐 Architecture



![Architecture](architecture_diagram.jpeg)

### Steps:
- **Extract**: Spotify API called by AWS Lambda (triggered by CloudWatch) saves raw JSON to S3.
- **Transform**: Another Lambda triggered on S3 event transforms data into song, artist, and album CSVs.
- **Load**: Snowpipe auto-ingests transformed CSVs from S3 into Snowflake tables.



## 🔧 Tech Stack

- **Spotify API**
- **Python (spotipy, boto3, pandas)**
- **AWS Lambda**
- **Amazon S3**
- **Snowflake + Snowpipe**



## 🚀 How to Use

1. Clone this repo:

```bash
git clone https://github.com/git-varun-k/snowflake-aws-projekt29
cd snowflake-aws-projekt29
