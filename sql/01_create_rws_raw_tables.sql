/*Creates tables for raw data in schema rws_raw,
table for incidents, intensiteit (flow), and
snelheid (speed). This raw scheme is seperate from
rws_agg for aggregate and summary tables*/

CREATE TABLE rws_raw.incidents (
	inc_id VARCHAR NOT NULL, 
	road_name VARCHAR NOT NULL, 
	lat DECIMAL NOT NULL, 
	lon DECIMAL NOT NULL, 
	inc_start VARCHAR NOT NULL, 
	inc_type VARCHAR NOT NULL
);

CREATE TABLE rws_raw.interfaces_intensiteit (
        measurementsitereference VARCHAR NOT NULL, 
        measurementsiteversion DECIMAL NOT NULL, 
        index VARCHAR NOT NULL, 
        periodstart VARCHAR NOT NULL, 
        periodend VARCHAR NOT NULL, 
        numberofincompleteinputs BOOLEAN, 
        numberofinputvaluesused DECIMAL, 
        minutesused BOOLEAN NOT NULL, 
        computationalmethod BOOLEAN, 
        standarddeviation DECIMAL, 
        suppliercalculateddataquality DECIMAL, 
        scdq_low BOOLEAN, 
        scdq_sd BOOLEAN, 
        number_of_scdq BOOLEAN, 
        dataerror BOOLEAN, 
        traveltimetype BOOLEAN, 
        avgvehicleflow DECIMAL NOT NULL, 
        avgvehiclespeed BOOLEAN, 
        avgtraveltime BOOLEAN, 
        computationmethod VARCHAR NOT NULL, 
        measurementequipmenttypeused VARCHAR NOT NULL, 
        measurementsitename1 VARCHAR NOT NULL, 
        measurementsitename2 BOOLEAN, 
        measurementsitenumberoflanes DECIMAL NOT NULL, 
        measurementsiteidentification BOOLEAN, 
        measurementside VARCHAR, 
        accuracy DECIMAL NOT NULL, 
        period DECIMAL NOT NULL, 
        specificlane VARCHAR NOT NULL, 
        specificvehiclecharacteristics VARCHAR NOT NULL, 
        startlocatiefordisplaylat DECIMAL NOT NULL, 
        startlocatiefordisplaylong DECIMAL NOT NULL, 
        locationcountrycode DECIMAL NOT NULL, 
        locationtablenumber DECIMAL NOT NULL, 
        locationtableversion VARCHAR NOT NULL, 
        alertcdirectioncoded VARCHAR NOT NULL, 
        specificlocation DECIMAL NOT NULL, 
        offsetdistance DECIMAL NOT NULL, 
        loc_type VARCHAR NOT NULL, 
        loc_des VARCHAR NOT NULL, 
        roadnumber VARCHAR NOT NULL, 
        roadname VARCHAR, 
        first_name VARCHAR NOT NULL, 
        secnd_name VARCHAR, 
        messagetype VARCHAR NOT NULL, 
        publicationtime VARCHAR, 
        deducednotrafficminutes BOOLEAN, 
        carriageway VARCHAR NOT NULL, 
        aandachtsoordeel VARCHAR NOT NULL, 
        aandachtsoordeelcategorieen VARCHAR NOT NULL, 
        generatedsitename VARCHAR NOT NULL, 
        voorganger BOOLEAN, 
        opvolger BOOLEAN, 
        reasonfordataerror VARCHAR, 
        openlrcoordinatelatitude BOOLEAN, 
        openlrcoordinatelongitude BOOLEAN, 
        openlrsideofroad BOOLEAN, 
        openlrorientation BOOLEAN, 
        openlrpositiveoffset BOOLEAN, 
        openlrreferencepointcoordinatelatitudes BOOLEAN, 
        openlrreferencepointcoordinatelongitudes BOOLEAN, 
        openlrreferencepointfunctionalroadclasses BOOLEAN, 
        openlrreferencepointformofways BOOLEAN, 
        openlrreferencepointbearings BOOLEAN, 
        openlrreferencepointlowestfrctonextlrpoints BOOLEAN, 
        openlrreferencepointdistancetonextlrpoints BOOLEAN, 
        measurementtimedefault VARCHAR NOT NULL, 
        measurementorcalculationtime VARCHAR, 
        referencevaluetype BOOLEAN, 
        referenceavgvehicleflow BOOLEAN, 
        referenceavgvehiclespeed BOOLEAN, 
        referenceavgtraveltime BOOLEAN, 
        referencedataerror BOOLEAN, 
        referencereasonfordataerror BOOLEAN
);

CREATE TABLE rws_raw.interfaces_snelheid (
        measurementsitereference VARCHAR NOT NULL, 
        measurementsiteversion DECIMAL NOT NULL, 
        index VARCHAR NOT NULL, 
        periodstart TIMESTAMP WITHOUT TIME ZONE, 
        periodend TIMESTAMP WITHOUT TIME ZONE, 
        numberofincompleteinputs DECIMAL, 
        numberofinputvaluesused DECIMAL, 
        minutesused BOOLEAN NOT NULL, 
        computationalmethod BOOLEAN, 
        standarddeviation DECIMAL, 
        suppliercalculateddataquality DECIMAL, 
        scdq_low BOOLEAN, 
        scdq_sd BOOLEAN, 
        number_of_scdq BOOLEAN, 
        dataerror BOOLEAN, 
        traveltimetype BOOLEAN, 
        avgvehicleflow BOOLEAN, 
        avgvehiclespeed DECIMAL NOT NULL, 
        avgtraveltime BOOLEAN, 
        computationmethod VARCHAR NOT NULL, 
        measurementequipmenttypeused VARCHAR NOT NULL, 
        measurementsitename1 VARCHAR NOT NULL, 
        measurementsitename2 BOOLEAN, 
        measurementsitenumberoflanes DECIMAL NOT NULL, 
        measurementsiteidentification BOOLEAN, 
        measurementside VARCHAR, 
        accuracy DECIMAL NOT NULL, 
        period DECIMAL NOT NULL, 
        specificlane VARCHAR NOT NULL, 
        specificvehiclecharacteristics VARCHAR NOT NULL, 
        startlocatiefordisplaylat DECIMAL NOT NULL, 
        startlocatiefordisplaylong DECIMAL NOT NULL, 
        locationcountrycode DECIMAL NOT NULL, 
        locationtablenumber DECIMAL NOT NULL, 
        locationtableversion VARCHAR NOT NULL, 
        alertcdirectioncoded VARCHAR NOT NULL, 
        specificlocation DECIMAL NOT NULL, 
        offsetdistance DECIMAL NOT NULL, 
        loc_type VARCHAR NOT NULL, 
        loc_des VARCHAR NOT NULL, 
        roadnumber VARCHAR NOT NULL, 
        roadname VARCHAR, 
        first_name VARCHAR NOT NULL, 
        secnd_name VARCHAR, 
        messagetype VARCHAR NOT NULL, 
        publicationtime TIMESTAMP WITHOUT TIME ZONE, 
        deducednotrafficminutes BOOLEAN, 
        carriageway VARCHAR NOT NULL, 
        generatedsitename VARCHAR NOT NULL, 
        voorganger BOOLEAN, 
        opvolger BOOLEAN, 
        reasonfordataerror VARCHAR, 
        openlrcoordinatelatitude BOOLEAN, 
        openlrcoordinatelongitude BOOLEAN, 
        openlrsideofroad BOOLEAN, 
        openlrorientation BOOLEAN, 
        openlrpositiveoffset BOOLEAN, 
        openlrreferencepointcoordinatelatitudes BOOLEAN, 
        openlrreferencepointcoordinatelongitudes BOOLEAN, 
        openlrreferencepointfunctionalroadclasses BOOLEAN, 
        openlrreferencepointformofways BOOLEAN, 
        openlrreferencepointbearings BOOLEAN, 
        openlrreferencepointlowestfrctonextlrpoints BOOLEAN, 
        openlrreferencepointdistancetonextlrpoints BOOLEAN, 
        measurementtimedefault TIMESTAMP WITHOUT TIME ZONE, 
        measurementorcalculationtime TIMESTAMP WITHOUT TIME ZONE, 
        referencevaluetype BOOLEAN, 
        referenceavgvehicleflow BOOLEAN, 
        referenceavgvehiclespeed BOOLEAN, 
        referenceavgtraveltime BOOLEAN, 
        referencedataerror BOOLEAN, 
        referencereasonfordataerror BOOLEAN
);

CREATE TABLE rws_raw.holidays (
        country VARCHAR NOT NULL, 
        year DECIMAL NOT NULL, 
        month VARCHAR NOT NULL, 
        day DECIMAL NOT NULL, 
        weekday VARCHAR NOT NULL, 
        holiday VARCHAR NOT NULL, 
        comments VARCHAR, 
        holiday_type VARCHAR NOT NULL
);

CREATE TABLE rws_raw.holiday_type (
        number DECIMAL NOT NULL, 
        holiday_type VARCHAR NOT NULL
);
