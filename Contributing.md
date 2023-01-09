Contributing
============

Contributions are welcome from the community. Questions can be asked on the
[CEDS Community of Practice website](https://ceds.communities.ed.gov/#program).

# Submitting Code Changes

If you have direct contributions you would like considered for incorporation
into the project you can [fork this repository](https://help.github.com/articles/fork-a-repo/) and
[submit a pull request](https://help.github.com/articles/about-pull-requests/) for review.  Along with your pull request, please
create a [use case ticket](https://github.com/CEDStandards/CEDS-Data-Warehouse/issues/new?assignees=&labels=&template=ceds-integrated-data-store-and-data-warehouse-use-case.md&title=) that details the
parameters for your changes.

# Data Warehouse Design Guidelines

## Naming Conventions

It is important to apply a consistent naming standard so users know what to
expect when they use the data model.  Below are rules to use when creating objects
in the database.

* Use CEDS entity and technical element names when possible.
  * (Note: CEDS element names have parts to give full context when applicable. Name parts include entity, qualifier, property, and representation. See the naming conventions section in the CEDS Data Model Guide.)
  * A table name often includes the entity part and a column name often includes a property part. For example, in the IDS the "Name" column in the table “Financial Account” corresponds to the CEDS element "Financial Account Name."
* Use Pascal Case for all objects.
* Avoid abbreviations, except for the following:
  * PS = Postsecondary
* Use acronyms that are used in CEDS, such as:
  * SEA = State Education Agency
  * LEA = Local Education Agency
  * IEU = Intermediate Educational Unit
  * EL = Early Learning
* Acronyms should be treated as full words, with only the first letter uppercase and the remainder lowercase.

### Tables

* All tables names must be in plural form (eg. DimSchools).
* Dimension tables should be in this format "Dim[CEDS Entity/Element Name]".
* Fact tables should be in this format "Fact[Business Process or Line of Business]".

## Star Schema

The CEDS Data Warehouse is built as a pure Kimball star schema data model.  For
design techniques not covered below, please refer to the [Kimball website](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/) for
best practices.

### Dimensions

There are two main types of dimension tables leveraged in the CEDS Data Warehouse.

1. [Type 2 Slowly Changing Dimensions using "effective date" columns](https://en.wikipedia.org/wiki/Slowly_changing_dimension#Type_2:_add_new_row).
2. [Junk Dimensions](https://www.kimballgroup.com/2009/06/design-tip-113-creating-using-and-maintaining-junk-dimensions/).

Use these design techniques whenever possible.

#### Organization Dimensions

While Organizations in the CEDS IDS are heavily normalized, it is the opposite
in the CEDS Data Warehouse.  In order to provide flexibility for reporting, 
all organization types have been split into their own organization dimension, such as
DimSeas, DimIeus, DimLeas, DimSchools, and DimPsInstitutions.  This provides the
following benefits:

* Fact tables can apply organization granularity at multiple levels (e.g. SEA, LEA, IEU, and School).
* Student and staff can be tracked outside the normal school-LEA hierarchy. This is used for cases such as:
  * Students attending high school out of district.
  * Students who are reported at the LEA and SEA level only.

All organization dimensions are Type 2 Slowly Changing Dimensions with fields
named RecordStartDateTime and RecordEndDateTime to track effective dates
of the rows.  

### Fact Tables

Fact tables are designed as much as possible to be reusable for many reporting
use cases.  Use DimFactTypes to keep data used for different purposes separated within a fact table.  
When designing a new fact table, [consider the following](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/four-4-step-design-process/):

1. The business process or line of business being addressed.  
2. Declare the grain.
3. Identify the dimensions.  
4. Identify the facts. 

Fact tables should not be used to track entities directly, such as a table named FactStudent.  This information should be stored in Slowly Changing Dimensions.  Rather, fact tables should address some aspect of education, such as student graduation (FactK12Graduation).

### Bridge Tables

Use [bridge tables](https://www.kimballgroup.com/2012/02/design-tip-142-building-bridges/) to track many-to-many relationships that don't fit well into the existing fact/dimension structure, such as the relationship between a student and race codes. 

### Report tables

Use physical tables to store aggregated data for standardized reporting.  Each
fact table should have an associated report table with the word "Report" appended
to the table name.  Report tables should all contain the following fields.

* ReportCode--Allows for multiple uses of the same reporting table.
* ReportLevel--Organization levels listed above.
* ReportYear--The school year.
* CategorySet--A code that represents the way the data was sliced and diced when aggregated.
