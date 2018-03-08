# Create RWS Netherlands Traffic Database

## 0: DATA TRANSFER
0.0: scp data to instance
`scp -i ~/path/to/pem.pem /path/to/interfaces wgrimes@dssg-europe.westeurope.cloudapp.azure.com:/data/rwstraffic/data/raw/`
`scp -i ~/path/to/pem.pem /path/to/incidents wgrimes@dssg-europe.westeurope.cloudapp.azure.com:/data/rwstraffic/data/raw/`

## 1: DATA CLEANING 
1.0: ssh into instance
`ssh -i ~/path/to/pem.pem wgrimes@dssg-europe.westeurope.cloudapp.azure.com:/data/rwstraffic/data/raw/`

1.1: unzip interfaces 
`unzip 12_interfaces_April-October2017_20180301T082524_939.zip -d ../`
`unzip incidents_allTypes_April-Oct2017.csv.zip -d ../`

1.2: move to data directory
`cd /data/rwstraffic/data/`

1.3: change encodings
```
for file in *.csv
do
    iconv -f ISO-8859-1 -t UTF-8 "$file" >"$file.new" &&
    mv -f "$file.new" "$file"
done
```

1.4: csvstack intensiteit data
`csvstack 12_interfaces_April-October2017_intensiteit_0000*.csv > 12_interfaces_April-October2017_intensiteit_all.csv`

1.5: csvstack data
`csvstack 12_interfaces_April-October2017_snelheid_0000*.csv > 12_interfaces_April-October2017_snelheid_all.csv`

## 2: CREATE DATABASE AND SCHEMAS
```
`psql -f sql/00_create_database_and_schemas.sql`
```

## 3: CREATE RAW TABLES
`psql -f sql/01_create_rws_raw_tables.sql`

## 4: PUSH DATA TO DATABASE
4.0: copy intensiteite data
`cat 12_interfaces_April-October2017_intensiteit_all.csv | psql -c "\copy rwstraffic.interfaces_intensiteit from stdin with csv header;"`

4.1: copy snelheid data
`cat 12_interfaces_April-October2017_snelheid_all.csv | psql -c "\copy rwstraffic.interfaces_snelheid from stdin with csv header;"`

4.2: copy incidents data
`cat incidents_allTypes_April-Oct2017.csv | psql -c "\copy rwstraffic.incidents from stdin delimiter ';' csv header;"`
