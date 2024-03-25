CREATE VIEW [RDS].[vwAccessibleEducationMaterialAssignments]
  AS 
  
    SELECT 
        rfaema.SchoolYearId
      , rfaema.CountDateId
      , rfaema.K12StudentId
      , rfaema.SeaId
      , rfaema.IeuId
      , rfaema.LeaId
      , rfaema.K12SchoolId
      , rfaema.AccessibleEducationMaterialProviderId
      , rfaema.AccessibleEducationMaterialStatusId
      , rfaema.DataCollectionId
      , rfaema.AgeId
      , rfaema.DisabilityStatusId
      , rfaema.EconomicallyDisadvantagedStatusId
      , rfaema.EnglishLearnerStatusId
      , rfaema.EntryGradeLevelId
      , rfaema.FosterCareStatusId
      , rfaema.HomelessnessStatusId
      , rfaema.IdeaStatusId
      , rfaema.ImmigrantStatusId
      , rfaema.K12CourseId
      , rfaema.K12DemographicId
      , rfaema.K12EnrollmentStatusId
      , rfaema.MigrantStatusId
      , rfaema.MilitaryStatusId
      , rfaema.RaceId
      , rfaema.RuralStatusId
      , rfaema.PrimaryIdeaDisabilityTypeId
      , rfaema.SecondaryIdeaDisabilityTypeId
      , rfaema.ScedCodeId
	    , rddEnrollmentEntryDate.DateValue AS EnrollmentEntryDate
	    , rddEnrollmentExitDate.DateValue AS EnrollmentExitDate
	    , rddIssuedDate.DateValue AS LearningResourceIssuedDate
	    , rddOrderedDate.DateValue AS LearningResourceOrderedDate
	    , rddReceivedDate.DateValue AS LearningResourceReceivedDate
	    , rddCourseEntryDate.DateValue AS CourseSectionEntryDate
	    , rddCourseExitDate.DateValue AS CourseSectionExitDate
	    , rfaema.AssignmentCount
    FROM [RDS].FactK12AccessibleEducationMaterialAssignments rfaema
    LEFT JOIN RDS.DimDates rddEnrollmentEntryDate
      ON rfaema.EnrollmentEntryDateId = rddEnrollmentEntryDate.DimDateId
    LEFT JOIN RDS.DimDates rddEnrollmentExitDate
      ON rfaema.EnrollmentExitDateId = rddEnrollmentExitDate.DimDateId
    LEFT JOIN RDS.DimDates rddIssuedDate
      ON rfaema.LearningResourceIssuedDateId = rddIssuedDate.DimDateId
    LEFT JOIN RDS.DimDates rddOrderedDate
      ON rfaema.LearningResourceOrderedDateId = rddOrderedDate.DimDateId
    LEFT JOIN RDS.DimDates rddReceivedDate
      ON rfaema.LearningResourceReceivedDateId = rddReceivedDate.DimDateId
    LEFT JOIN RDS.DimDates rddCourseEntryDate
      ON rfaema.CourseSectionStartDateId = rddCourseEntryDate.DimDateId
    LEFT JOIN RDS.DimDates rddCourseExitDate
      ON rfaema.CourseSectionEndDateId = rddCourseExitDate.DimDateId
      
