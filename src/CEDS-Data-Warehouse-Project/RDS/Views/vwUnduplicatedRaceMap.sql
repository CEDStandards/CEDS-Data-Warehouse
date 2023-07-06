CREATE VIEW [RDS].[vwUnduplicatedRaceMap] 
AS 
    SELECT 
        StudentIdentifierState
        , LeaIdentifierSeaAccountability
	    , SchoolIdentifierSea
        , RaceMap
        , SchoolYear
    FROM (
        SELECT 
            StudentIdentifierState
            , LeaIdentifierSeaAccountability
            , SchoolIdentifierSea
            , CASE 
                WHEN COUNT(InputCode) > 1 
                    THEN (select max(inputcode)
                                   from staging.SourceSystemReferenceData
                                   where TableName = 'refRace'
                                   and schoolyear = spr.SchoolYear
                                   and outputcode = 'TwoOrMoreRaces'
                            )
                    ELSE max(sssrd.InputCode)
            END as RaceMap
            , spr.SchoolYear
        FROM staging.K12PersonRace spr
        JOIN Staging.SourceSystemReferenceData sssrd
            ON spr.RaceType = sssrd.InputCode
            AND spr.SchoolYear = sssrd.SchoolYear
            AND sssrd.TableName = 'RefRace'
        GROUP BY
            StudentIdentifierState
            , LeaIdentifierSeaAccountability
            , SchoolIdentifierSea
            , spr.SchoolYear
    ) stagingRaces

GO

