DROP TABLE "collge_employer";

CREATE TABLE "schools_silver" as 
SELECT
a."Institution (entity) name (HD2020)" as Institution,
a."Institution open to the general public (HD2020)" as PublicFlag,
a."Postsecondary institution indicator (HD2020)" as PostSecondaryFlag,
a."Years of college-level work required (IC2020)" as YearsOfCollegeRequired,
a."Status of institution (HD2020)" as InstStatus,
a."Primarily postsecondary indicator (HD2020)" as PostSecondaryPrimary,
a."Institution is active in current year (HD2020)" as ActiveFlag,
a."OPE Title IV eligibility indicator code (HD2020)" as TitleIVEligible,
b."Admissions men (ADM2020)" as AdmissionsMen,
b."Admissions women (ADM2020)" as AdmissionsWomen,
b."Admissions total (ADM2020)" as AdmissionsTotal,
b."Applicants men (ADM2020)" as ApplicantsMen,
b."Applicants women (ADM2020)" as ApplicantsWomen,
b."Applicants total (ADM2020)" as ApplicantsTotal,
b."Enrolled  men (ADM2020)" as EnrolledMen,
b."Enrolled  women (ADM2020)" as EnrolledWomen,
b."Enrolled total (ADM2020)" as EnrolledTotal,
b."Full-time retention rate  2020 (EF2020D)" as RetentionRate_FullTime,
b."Part-time retention rate  2020 (EF2020D)" as RetentionRate_PartTime,
b."Student-to-faculty ratio (EF2020D)" as StudentToFacultyRatio,
c."Associate's degree (IC2020)" as AssociatesFlag,
c."Bachelor's degree (IC2020)" as BachelorsFlag,
c."Master's degree (IC2020)" as MastersFlag,
c."Doctor's degree - research/scholarship (IC2020)" as PHDResearchFlag,
c."Doctor's degree - professional practice (IC2020)" as PHDProFlag
FROM "Schools" a
INNER JOIN "Awards" c ON a.instnm=c.instnm
INNER JOIN "Admissions_and_Completions" b ON a.instnm=b.instnm;

CREATE TABLE "demographics_bronze" as
SELECT 
a."Institution (entity) name (HD2020)" as Institution,
b."Grand total (C2020_A  Bachelor's degree  First major  Grand tot" as GrandTotal_Bachelors,
b."Asian total (C2020_A  Bachelor's degree  First major  Grand tot" as Asian_Bachelors_Total,
b."White total (C2020_A  Bachelor's degree  First major  Grand tot" as White_Bachelors_Total,
b."Hispanic or Latino total (C2020_A  Bachelor's degree  First maj" as Hispanic_Bachelors_Total,
b."Black or African American total (C2020_A  Bachelor's degree  Fi" as Black_Bachelors_Total,
b."Race/ethnicity unknown total (C2020_A  Bachelor's degree  First" as UnknownEthnicity_Bachelors_Total,
b."Native Hawaiian or Other Pacific Islander total (C2020_A  Bache" as PacificIslander_Bachelors_Total,
b."American Indian or Alaska Native total (C2020_A  Bachelor's deg" as NativeAmerican_Bachelors_Total,
b."Grand total (C2020_A  Master's degree  First major  Grand total" as GrandTotal_Masters,
b."Asian total (C2020_A  Master's degree  First major  Grand total" as Asian_Masters_Total,
b."White total (C2020_A  Master's degree  First major  Grand total" as White_Masters_Total,
b."Hispanic or Latino total (C2020_A  Master's degree  First major" as Hispanic_Masters_Total,
b."Black or African American total (C2020_A  Master's degree  Firs" as Black_Masters_Total,
b."Race/ethnicity unknown total (C2020_A  Master's degree  First m" as UnknownEthnicity_Masters_Total,
b."Native Hawaiian or Other Pacific Islander total (C2020_A  Maste" as PacificIslander_Masters_Total,
b."American Indian or Alaska Native total (C2020_A  Master's degre" as NativeAmerican_Masters_Total,
b."Grand total (C2020_A  Doctor's degree - research/scholarship   " as GrandTotal_PHD,
b."Asian total (C2020_A  Doctor's degree - research/scholarship   " as Asian_PHD_Total,
b."White total (C2020_A  Doctor's degree - research/scholarship   " as White_PHD_Total,
b."Hispanic or Latino total (C2020_A  Doctor's degree - research/s" as Hispanic_PHD_Total,
b."Black or African American total (C2020_A  Doctor's degree - res" as Black_PHD_Total,
b."Race/ethnicity unknown total (C2020_A  Doctor's degree - resear" as UnknownEthnicity_PHD_Total,
b."Native Hawaiian or Other Pacific Islander total (C2020_A  Docto" as PacificIslander_PHD_Total,
b."American Indian or Alaska Native total (C2020_A  Doctor's degre" as NativeAmerican_PHD_Total
FROM "Schools" a
INNER JOIN "Awards" c ON a.instnm=c.instnm
INNER JOIN "Admissions_and_Completions" b ON a.instnm=b.instnm;

CREATE TABLE "demographics_silver" AS
SELECT
Institution,
CASE GREATEST(Asian_Bachelors_Total, White_Bachelors_Total, Hispanic_Bachelors_Total, Black_Bachelors_Total,UnknownEthnicity_Bachelors_Total,PacificIslander_Bachelors_Total,NativeAmerican_Bachelors_Total)
    WHEN Asian_Bachelors_Total THEN 'Asian'
    WHEN White_Bachelors_Total THEN 'White'
    WHEN Hispanic_Bachelors_Total THEN 'Hispanic'
    WHEN Black_Bachelors_Total THEN 'Black'
    WHEN UnknownEthnicity_Bachelors_Total THEN 'UnknownEthnicity'
    WHEN PacificIslander_Bachelors_Total THEN 'PacificIslander'
    WHEN NativeAmerican_Bachelors_Total THEN 'NativeAmerican'
    END AS PredominantDemo_Bachelors,
CASE GREATEST(Asian_Masters_Total,White_Masters_Total,Hispanic_Masters_Total,Black_Masters_Total,UnknownEthnicity_Masters_Total,PacificIslander_Masters_Total,NativeAmerican_Masters_Total)
    WHEN Asian_Masters_Total THEN 'Asian'
    WHEN White_Masters_Total THEN 'White'
    WHEN Hispanic_Masters_Total THEN 'Hispanic'
    WHEN Black_Masters_Total THEN 'Black'
    WHEN UnknownEthnicity_Masters_Total THEN 'UnknownEthnicity'
    WHEN PacificIslander_Masters_Total THEN 'PacificIslander'
    WHEN NativeAmerican_Masters_Total THEN 'NativeAmerican'
    END AS PredominantDemo_Masters,
CASE GREATEST(Asian_PHD_Total,White_PHD_Total,Hispanic_PHD_Total,Black_PHD_Total,UnknownEthnicity_PHD_Total,PacificIslander_PHD_Total,NativeAmerican_PHD_Total)
    WHEN Asian_PHD_Total THEN 'Asian'
    WHEN White_PHD_Total THEN 'White'
    WHEN Hispanic_PHD_Total THEN 'Hispanic'
    WHEN Black_PHD_Total THEN 'Black'
    WHEN UnknownEthnicity_PHD_Total THEN 'UnknownEthnicity'
    WHEN PacificIslander_PHD_Total THEN 'PacificIslander'
    WHEN NativeAmerican_PHD_Total THEN 'NativeAmerican'
    END AS PredominantDemo_PHD
FROM "demographics_bronze";
--GROUP BY Institution;

CREATE TABLE "scores_silver" AS
SELECT
a."Institution (entity) name (HD2020)" as Institution,
b."SAT Evidence-Based Reading and Writing 25th percentile score (A" as SAT25thPerReading,
b."SAT Evidence-Based Reading and Writing 75th percentile score (A" as SAT75thPerReading,
b."SAT Math 25th percentile score (ADM2020)" as SAT25thPerMath,
b."SAT Math 75th percentile score (ADM2020)" as SAT75thPerMath,
b."ACT Composite 25th percentile score (ADM2020)" as ACT25thPerComp,
b."ACT Composite 75th percentile score (ADM2020)" as ACT75thPerComp,
b."ACT English 25th percentile score (ADM2020)" as ACT25thPerEng,
b."ACT English 75th percentile score (ADM2020)" as ACT75thPerEng,
b."ACT Math 25th percentile score (ADM2020)" as ACT25thPerMath,
b."ACT Math 75th percentile score (ADM2020)" as ACT75thPerMath
FROM "Schools" a
INNER JOIN "Awards" c ON a.instnm=c.instnm
INNER JOIN "Admissions_and_Completions" b ON a.instnm=b.instnm;

CREATE TABLE "Instructors_Silver" AS
SELECT
 "instnm" as Institution,
 "Professors (S2020_SIS  All full-time instructional staff)" AS Professors,
 "Associate professors (S2020_SIS  All full-time instructional staff)" as AssociateProf,
 "Assistant professors (S2020_SIS  All full-time instructional staff)" as AssistantProf,
 "Intructors (S2020_SIS  All full-time instructional staff)" as Instructors,
 "Lecturers (S2020_SIS  All full-time instructional staff)" as Lecturers,
 "Level of institution (HD2020)" as InstLevel,
 "Control of institution (HD2020)" as InstControl,
 "Historically Black College or University (HD2020)" as HBCUFlag,
 "Tribal college (HD2020)" as TribalFlag,
 "Degree of urbanization (Urban-centric locale) (HD2020)" as DegOfUrbanization,
 "Institution size category (HD2020)" as InstSize,
 "Graduation rate - Bachelor degree within 4 years  total (DRVGR2020)" as GradRate4Yrs,
 "Graduation rate - Bachelor degree within 5 years  total (DRVGR2020)" as GradRate5Yrs,
 "Graduation rate - Bachelor degree within 6 years  total (DRVGR2020)" as GradRate6Yrs,
 "Transfer-out rate  total cohort (DRVGR2020)" as TransferRate,
 "Graduation rate  total cohort (DRVGR2020)" as GradRate,
 "Instructional FTE (DRVHR2020)" as InstructionalStaff,
 "Research FTE (DRVHR2020)" as ResearchStaff,
 "Public Service FTE (DRVHR2020)" as PublicServiceStaff,
 "Student and Academic Affairs and Other Education Services FTE (DRVHR2020)" as AcademicAffairStaff
FROM "Instructors";

DROP TABLE "Awards";
DROP TABLE "Instructors";
DROP TABLE "Schools";
DROP TABLE "Admissions_and_Completions";

SELECT
DISTINCT
a.*,
d.Professors,
d.AssociateProf,
d.AssistantProf,
d.Instructors,
d.Lecturers,
d.InstLevel,
d.InstControl,
d.InstSize,
d.GradRate,
d.TransferRate,
d.InstructionalStaff,
d.ResearchStaff,
d.PublicServiceStaff,
d.AcademicAffairStaff,
b.SAT25thPerReading,
b.SAT75thPerReading,
b.SAT25thPerMath,
b.SAT75thPerMath,
b.ACT25thPerComp,
b.ACT75thPerComp,
b.ACT25thPerEng,
b.ACT75thPerEng,
b.ACT25thPerMath,
b.ACT75thPerMath,
c.PredominantDemo_Bachelors,
c.PredominantDemo_Masters,
c.PredominantDemo_PHD
FROM "Instructors_Silver" d
LEFT JOIN "schools_silver" a on a.Institution=d.Institution
LEFT JOIN "scores_silver" b on d.Institution=b.Institution
LEFT JOIN "demographics_silver" c on d.Institution=c.Institution;