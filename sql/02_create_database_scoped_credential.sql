CREATE DATABASE SCOPED CREDENTIAL cred_prateek
WITH   
    IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
WITH(
    LOCATION = 'https://awstoragedatalakeprateek.dfs.core.windows.net/silver',
    CREDENTIAL = cred_prateek
)
GO
CREATE EXTERNAL DATA SOURCE source_gold
WITH(
    LOCATION = 'https://awstoragedatalakeprateek.dfs.core.windows.net/gold',
    CREDENTIAL = cred_prateek
)
GO