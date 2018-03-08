# Netherlands border traffic
Project to visualise traffic inflows and outflows across 12 major highways into and out of the Netherlands from Belgium and Germand, from Mar-2017 till Oct-2017. Data were obtained from induction coils and visualisation done in Tableau.

## Project partners:
**Rijkswaterstaat (RWS):** Rijkswaterstaat is responsible for the design, construction, management and maintenance of the main infrastructure facilities in the Netherlands. Its role is the practical execution of the public works and water management, including the construction and maintenance of waterways and roads, and flood protection and prevention.

**CS Research:** we help organisations apply machine learning and artificial intelligence to problems that have a social impact. We are data scientists, computer scientists, economists, geographers and consultants working at the interface between research and industry. We work with private organizations, governments and NGOs to make an impact on problems that matter through Data Science and Artificial Intelligence.

## Project scope:
A. What are the inflows and outflows from Germany and Belgium over the normal and the holiday period?

B. What is the mix of vehicles and what are the daily pattern of vehicles (inflow-outflow) and the characteristics of traffic at different times, during regular and holiday period?

C. What is the relationship between the in-outflow and the incidents on the road highway?

D. How can the data and the results be presented so that non-technical uses can explore traffic data, relationship with incidents and holiday/vacation times?

## Project phases:
The project will include the following phases
1.	Gather data for the 12 main highway interfaces between Netherlands, Belgium and Germany from NDW. The data will focus on a set of loops on the immediate proximity of the border, for both directions of flow. The data will concern a period of 6 consecutive months in 2017. 
2.	Collect incident data for the 12 highways indicated above for the same period of time in 2017.
3.	Compile the main list holiday and festivity data for the 6 months of the study for Germany, Belgium and the Netherlands.
4.	Model the traffic data (flow, speed and vehicle type) to harmonize across the various border crossings and create a reference dataset for review and analysis.
5.	Define the key indicators to analyse the data, specifically for flow, type of vehicles, speed, and derived indicators that provide insights on the nature and type of traffic flowing in and out of the country.
6.	Calculate all indicators for every day in the period and for specific time blocks within each day (e.g. night, morning rush 7am-10am, midday, evening rush 4pm -7pm, evening). 
7.	Produce interactive dashboards in tableau or other to analyse the relationship between traffic characteristics, holiday/festivity dates and incidents.

## Project pipeline:
### 0: DATA TRANSFER
0.0: scp data to instance
`scp -i ~/path/to/pem.pem /path/to/interfaces wgrimes@dssg-europe.westeurope.cloudapp.azure.com:/data/rwstraffic/data/raw/`
`scp -i ~/path/to/pem.pem /path/to/incidents wgrimes@dssg-europe.westeurope.cloudapp.azure.com:/data/rwstraffic/data/raw/`

### 1: DATA CLEANING 
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

### 2: CREATE DATABASE AND SCHEMAS
```
`psql -f sql/00_create_database_and_schemas.sql`
```

### 3: CREATE RAW TABLES
`psql -f sql/01_create_rws_raw_tables.sql`

### 4: PUSH DATA TO DATABASE
4.0: copy intensiteite data
`cat 12_interfaces_April-October2017_intensiteit_all.csv | psql -c "\copy rwstraffic.interfaces_intensiteit from stdin with csv header;"`

4.1: copy snelheid data
`cat 12_interfaces_April-October2017_snelheid_all.csv | psql -c "\copy rwstraffic.interfaces_snelheid from stdin with csv header;"`

4.2: copy incidents data
`cat incidents_allTypes_April-Oct2017.csv | psql -c "\copy rwstraffic.incidents from stdin delimiter ';' csv header;"`
