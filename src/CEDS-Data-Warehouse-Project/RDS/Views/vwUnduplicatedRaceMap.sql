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
                    THEN (SELECT MAX(InputCode)
                                   FROM Staging.SourceSystemReferenceData
                                   where TableName = 'refRace'
                                   and SchoolYear = spr.SchoolYear
                                   and OutputCode = 'TwoOrMoreRaces'
                            )
                    ELSE max(sssrd.InputCode)
            END as RaceMap
            , spr.SchoolYear
        FROM Staging.K12PersonRace spr
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

