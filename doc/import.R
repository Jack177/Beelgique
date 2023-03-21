# Installer les librairies
#install.packages("RODBC")
#install.packages("memisc")

# Charger les librairies
library(RODBC)
library(sqldf)
library(memisc)

# Créer une connexion à la base de données Access
# Pour la configuration du fichier .mdb voir README_IMPORT_DB.Rmd
con <- odbcConnect("DATA-SAPOLL")

# Réaliser la requête SQL et récupérer le résultat dans une data frame R
SpecCondStat <- sqlQuery(con, "
SELECT
  PROJECT.CODE,
  SPEC.*,
  COND.*,
  STAT.*
FROM
  PROJECT
INNER JOIN
  (
    STAT
    INNER JOIN
      (
        COND
        INNER JOIN SPEC ON COND.COND_ID = SPEC.COND_ID
      ) ON STAT.STAT_ID = COND.STAT_ID
  ) ON PROJECT.PROJECT_ID = STAT.PROJECT_ID
")

# # Exécuter la requête SQL
# my_update <- sqlQuery(con, "
#   UPDATE SPEC
#   SET REC = 'BENREZKALLAH J'
#   WHERE REC = 'JB';
# 
#   UPDATE SPEC
#   SET DET = 'BENREZKALLAH J'
#   WHERE DET = 'JB';
# 
#   UPDATE SPEC
#   SET REC = 'SANTERRE R'
#   WHERE REC ='RS';
# 
#   UPDATE SPEC
#   SET DET = 'SANTERRE R'
#   WHERE DET = 'RS';
# 
#   UPDATE SPEC
#   SET AUCT = 'SANTERRE R'
#   WHERE AUCT = 'RS';
#   ")

#Fermer la connexion à la base de données
odbcClose(con)




