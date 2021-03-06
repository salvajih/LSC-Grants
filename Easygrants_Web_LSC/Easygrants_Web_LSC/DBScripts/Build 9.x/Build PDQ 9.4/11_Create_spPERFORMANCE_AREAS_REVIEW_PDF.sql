
CREATE PROCEDURE [dbo].[spPERFORMANCE_AREAS_REVIEW_PDF]
(
		@WfTaskAssignmentID INT,
        @Year INT
)
AS


--drop table #initialtable

CREATE TABLE #initialtable
 (type varchar(50),
  designator char(10),
  description varchar(max),
  pa_sort int,
  cr_sort char(10),
  score varchar(5),
  inq_sort int,
  inq_id int,
  subinq_sort char(10),
  strongelm_sort int,
  weakelm_sort int,
  checked nvarchar(5),
  comment varchar(max),
  stng_ele_id_1 int,
  stng_ele_id_2 int,
  weak_ele_id_1 int,
  weak_ele_id_2 int,
  score_checked nvarchar(15))


-- Performance Area
INSERT  #initialtable (type, designator,  pa_sort)
      SELECT  'PA' type , 
              sort_order desgn, 
--              'PA' + CAST(pa.sort_order AS varchar(10)) description, 
			  sort_order pa_sort
      FROM lsc_a_review_performance_area pa
              --JOIN vwfta_competition_year y on y.time_period_id = pa.time_period_id
      --WHERE wfta_year = 2011
      WHERE time_period_id = 16 


---Criterion
INSERT  #initialtable (type, designator, description, pa_sort, cr_sort)
		SELECT  'CR' type,
				 c.abbr desgn,
				    --row_number() over(order by c.id) desgn,
				 c.description description,
				 pa.sort_order pa_sort,
					--row_number() over(order by c.id) cr_sort,
				 c.abbr cr_sort
        FROM lsc_a_review_criterion c 
						JOIN lsc_a_review_performance_area pa ON pa.id = c.lsc_review_performance_area_id
        WHERE pa.time_period_id = 16



--Inquiry

INSERT  #initialtable (type, designator, description, pa_sort, cr_sort, inq_sort, inq_id)
		SELECT  'INQ' type,
				 --row_number() over(order by ri.id) desi
				 ri.abbr desgn,
				 ri.description, 
				 pa.sort_order pa_sort,
				 --row_number() over(order by c.id) cr_sort,
				 c.abbr cr_sort,
				 ri.sort_order inq_sort,
                 ri.id inq_id
		FROM lsc_a_review_inquiry ri
				JOIN lsc_a_review_criterion c ON c.id = ri.lsc_review_criterion_id
				JOIN lsc_a_review_performance_area pa ON pa.id = c.lsc_review_performance_area_id
		WHERE pa.time_period_id = 16;	
          
--Updating with scores and comments
WITH x (score, comment, InquiryID)
	as (SELECT ris.abbr, rai.comment, rai.lsc_review_inquiry_id 
                FROM LSC_REVIEW_ASSIGNMENT_INQUIRY rai
							JOIN LSC_c_REVIEW_INQUIRY_SCORE ris ON rai.lsc_review_inquiry_score_id = ris.id
							JOIN #initialtable temp ON temp.inq_id = rai.lsc_review_inquiry_id
				WHERE rai.wf_task_assignment_id = @WfTaskAssignmentID)
   UPDATE #initialtable
		SET score = x.score,
            comment = x.comment,
            score_checked = 'Score ' +x.score
		FROM #initialtable temp
			JOIN x ON temp.inq_id = x.InquiryID
		


--SubInquiry
Insert  #initialtable (type, designator, description, pa_sort, cr_sort, inq_sort, subinq_sort)
		SELECT  'SubInq' type,
				 s.abbr desgn,
				 s.description, 
				 pa.sort_order pa_sort,
				 c.abbr cr_sort,
				 ri.sort_order inq_sort,
				 s.abbr subinq_sort
		FROM LSC_a_REVIEW_SUBTOPIC s
				JOIN lsc_a_review_inquiry ri ON ri.id = s.lsc_review_inquiry_id
				JOIN lsc_a_review_criterion c ON c.id = ri.lsc_review_criterion_id
				JOIN lsc_a_review_performance_area pa ON pa.id = c.lsc_review_performance_area_id	
		WHERE pa.time_period_id = 16


---STRONG elements associated with Inquiry

INSERT  #initialtable (type, designator, description, pa_sort, cr_sort, inq_sort, strongelm_sort, stng_ele_id_1)
		SELECT   'Strong Element' Type,
				 'S',
--				 e.description,
				 REPLACE(REPLACE(REPLACE(REPLACE(e.description,'<li>', nchar(8226)), '</li>', ''), '<ul>', ''),'</ul>', ''),
				 pa.sort_order pa_sort,
				 c.abbr cr_sort,
				 ri.sort_order inq_sort,
				 e.sort_order  strongelm_sort,
                 e.id
		FROM  dbo.LSC_a_REVIEW_ELEMENT AS e 
                   INNER JOIN dbo.lsc_a_review_inquiry AS ri ON ri.id = e.lsc_review_inquiry_id
                   JOIN lsc_a_review_criterion c ON c.id = ri.lsc_review_criterion_id
	               JOIN lsc_a_review_performance_area pa ON pa.id = c.lsc_review_performance_area_id
		WHERE pa.time_period_id = 16 
                    AND e.lsc_review_element_type_id = 1; 
                    

WITH x (checked, elementID)
	as (SELECT case when rae.checked = 0 then nchar(9723) Else nchar(9745) end, rae.lsc_review_element_id
              FROM LSC_REVIEW_ASSIGNMENT_ELEMENT rae
							JOIN #initialtable temp ON temp.stng_ele_id_1 = rae.lsc_review_element_id
			  WHERE rae.wf_task_assignment_id = @WfTaskAssignmentID)
   UPDATE #initialtable
		SET checked = x.checked,
			score_checked = x.checked
		FROM #initialtable temp
			JOIN x ON temp.stng_ele_id_1 = x.elementID



---STRONG elements associated with Sub - Inquiry

INSERT  #initialtable (type, designator, description, pa_sort, cr_sort, inq_sort, subinq_sort, strongelm_sort, stng_ele_id_2)
		SELECT 'Strong Element' Type,
				'S',
--				e.description,
				REPLACE(REPLACE(REPLACE(REPLACE(e.description,'<li>', nchar(8226)), '</li>', ''), '<ul>', ''),'</ul>', ''),
				pa.sort_order pa_sort,
				c.abbr cr_sort,
				ri.sort_order inq_sort,
				s.abbr subinq_sort,
				e.sort_order  strongelm_sort,
                e.id
		FROM LSC_a_REVIEW_ELEMENT e
				INNER JOIN dbo.LSC_a_REVIEW_SUBTOPIC AS s ON s.id = e.lsc_review_subtopic_id
				JOIN lsc_a_review_inquiry ri ON ri.id = s.lsc_review_inquiry_id
				JOIN lsc_a_review_criterion c ON c.id = ri.lsc_review_criterion_id
				JOIN lsc_a_review_performance_area pa ON pa.id = c.lsc_review_performance_area_id
		WHERE pa.time_period_id = 16 
                    AND e.lsc_review_element_type_id = 1;


WITH x (checked, elementID)
	as (SELECT case when rae.checked = 0 then nchar(9723) Else nchar(9745) end, rae.lsc_review_element_id
              FROM LSC_REVIEW_ASSIGNMENT_ELEMENT rae
							JOIN #initialtable temp ON temp.stng_ele_id_2 = rae.lsc_review_element_id
			  WHERE rae.wf_task_assignment_id = @WfTaskAssignmentID)
   UPDATE #initialtable
		SET checked = x.checked,
            score_checked = x.checked
		FROM #initialtable temp
			JOIN x ON temp.stng_ele_id_2 = x.elementID



---Weak elements  associated with Inquiry

INSERT  #initialtable (type, designator, description, pa_sort, cr_sort, inq_sort, weakelm_sort, weak_ele_id_1)
		SELECT   'Weak Element',
				 'W',
--				 e.description,
				 REPLACE(REPLACE(REPLACE(REPLACE(e.description,'<li>', nchar(8226)), '</li>', ''), '<ul>', ''),'</ul>', ''),
				 pa.sort_order pa_sort,
				 c.abbr cr_sort,
				 ri.sort_order inq_sort,
				 e.sort_order  strongelm_sort,
                 e.id
		FROM  dbo.LSC_a_REVIEW_ELEMENT AS e 
                   INNER JOIN dbo.lsc_a_review_inquiry AS ri ON ri.id = e.lsc_review_inquiry_id
                   JOIN lsc_a_review_criterion c ON c.id = ri.lsc_review_criterion_id
	               JOIN lsc_a_review_performance_area pa ON pa.id = c.lsc_review_performance_area_id
		WHERE pa.time_period_id = 16 
                   AND e.lsc_review_element_type_id = 2;
                 
WITH x (checked, elementID)
	as (SELECT case when rae.checked = 0 then nchar(9723) Else nchar(9745) end, rae.lsc_review_element_id
              FROM LSC_REVIEW_ASSIGNMENT_ELEMENT rae
							JOIN #initialtable temp ON temp.weak_ele_id_1 = rae.lsc_review_element_id
			  WHERE rae.wf_task_assignment_id = @WfTaskAssignmentID)
   UPDATE #initialtable
		SET checked = x.checked,
            score_checked = x.checked
		FROM #initialtable temp
			JOIN x ON temp.weak_ele_id_1 = x.elementID


---Weak elements  associated with Sub - Inquiry

INSERT  #initialtable (type, designator, description, pa_sort, cr_sort, inq_sort, subinq_sort, weakelm_sort, weak_ele_id_2 )
		SELECT 'Weak Element' ,
			   'W',
--			    e.description,
				REPLACE(REPLACE(REPLACE(REPLACE(e.description,'<li>', nchar(8226)), '</li>', ''), '<ul>', ''),'</ul>', ''),
				pa.sort_order pa_sort,
				c.abbr cr_sort,
				ri.sort_order inq_sort,
				s.abbr subinq_sort,
				e.sort_order  strongelm_sort,
                e.id
		 FROM LSC_a_REVIEW_ELEMENT e
				INNER JOIN dbo.LSC_a_REVIEW_SUBTOPIC AS s ON s.id = e.lsc_review_subtopic_id
				JOIN lsc_a_review_inquiry ri ON ri.id = s.lsc_review_inquiry_id
				JOIN lsc_a_review_criterion c ON c.id = ri.lsc_review_criterion_id
				JOIN lsc_a_review_performance_area pa ON pa.id = c.lsc_review_performance_area_id
		WHERE pa.time_period_id = 16 
                AND e.lsc_review_element_type_id = 2;
				

WITH x (checked, elementID)
	as (SELECT case when rae.checked = 0 then nchar(9723) Else nchar(9745) end, rae.lsc_review_element_id
              FROM LSC_REVIEW_ASSIGNMENT_ELEMENT rae
							JOIN #initialtable temp ON temp.weak_ele_id_2 = rae.lsc_review_element_id
			  WHERE rae.wf_task_assignment_id = @WfTaskAssignmentID)
   UPDATE #initialtable
		SET checked = x.checked,
            score_checked = x.checked
		FROM #initialtable temp
			JOIN x ON temp.weak_ele_id_2 = x.elementID






--SELECT  * FROM #initialtable
--ORDER BY pa_sort, cr_sort, inq_sort, designator

SELECT
    case type
         when 'PA' then 'Performance Area' + ' ' + cast(pa_sort as varchar)
         when 'CR' then 'Criterion' + ' ' + cast(rtrim(cr_sort) as varchar) + ' - '
         when 'INQ' then 'PA'+cast(pa_sort as varchar)+ ' ' +'C'+ cast(rtrim(cr_sort) as varchar)+ ' ' + 'Inquiry' + ' ' + cast(inq_sort as varchar) + ' - '
		 when 'SubInq' then rtrim(subinq_sort) + ' - '
		 when 'Strong Element' then 'Strong Element' + ' ' + cast(strongelm_sort as varchar) + ' - ' 
		 when 'Weak Element' then 'Weak Element' + ' ' + cast(weakelm_sort as varchar) + ' - '
    end + ISNULL(description, '') type,
designator,
description,
pa_sort,
cr_sort,
'Score ' + score score,
inq_sort,
subinq_sort,
strongelm_sort,
weakelm_sort,
--case checked when 'Yes' then nchar(9745) else nchar(9746)  end checked,
checked,
'Comment - ' + comment comment,
score_checked
FROM #initialtable
ORDER BY pa_sort, cr_sort, inq_sort, designator



drop table #initialtable















