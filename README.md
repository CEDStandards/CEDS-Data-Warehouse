![CEDS Data Warehouse Logo](/res/CEDS-Data-Warehouse-Logo-Full-Medium.png "CEDS Data Warehouse")

# CEDS Data Warehouse
Modeled for longitudinal storage and reporting of P-20W data, the Common Education Data Standards (CEDS) Data Warehouse implements star schema data warehouse normalization techniques for improved query performance.

## Getting Started

### Fresh Installation

To create a new instance of the CEDS Data Warehouse on your SQL Server, perform the following steps.

1. Open the database creation script at /src/ddl/CEDS-Data-Warehouse.sql using your preferred SQL client. 
2. Connect to the server on which you want to create the CEDS Data Warehouse instance.
3. Find and replace the existing database name in the script (i.e. CEDS-Data-Warehouse-7_0_0_0) with the database name of your choice.
4. Run the script. 

The database is empty by default.  Proceed with the following instructions to load CEDS Element metadata and CEDS Option Set values into the reference tables.

## Contributing

Please read [Contributing.md](/Contributing.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use a customized version of [Explicit Versioning](https://github.com/exadra37-versioning/explicit-versioning) for versioning.  To keep the various CEDS Open Source projects in alignment with the CEDS Elements, we are replacing the concept of "disruptive" releases with "alignment" releases.  These releases ensure that the data models are in sync with the official, community approved list of CEDS Elements.  For the versions available, see the [tags on this repository](https://github.com/CEDStandards/CEDS-Data-Warehouse/tags). 

## Authors

See the list of [contributors](/Contributors.md) who participated in this project.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.
