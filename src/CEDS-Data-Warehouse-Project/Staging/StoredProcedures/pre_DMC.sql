CREATE PROCEDURE [Staging].[pre_DMC]
	@submissionYear int = NULL
AS
BEGIN

    SET NOCOUNT ON;

		PRINT 'Run any setup scripts prior to executing RUNDMC'

		--Reset the Membership date in toggle so it comes after the RecordStartDateTime of the Organizations
		update tr
		set ResponseValue = '10/21/' + CAST(@submissionYear - 1 AS VARCHAR)
		from App.ToggleResponses tr 
		inner join app.ToggleQuestions tq
			on tr.ToggleQuestionId = tq.ToggleQuestionId	
			and tq.EmapsQuestionAbbrv = 'MEMBERDTE'

		

	SET NOCOUNT OFF;

END

GO

