screen NewHires "HR Coordinator's list of new hires and their onboarding progress"
  navbar "Track Each Hire | New Hires -> NewHires | Template -> OnboardingTemplate"
  row
    heading "New Hires"
    right
    button "Add New Hire" primary -> AddNewHire
  table "Name | Role | Start Date | Progress" -> NewHireDetail
    row "Jordan Lee | Engineer | 2026-09-08 | 2/6 complete"
    row "Amara Diallo | Designer | 2026-09-15 | 0/6 complete"

screen AddNewHire "HR Coordinator adds a new hire, generating their checklist from the template"
  navbar "Track Each Hire | New Hires -> NewHires | Template -> OnboardingTemplate"
  heading "Add New Hire"
  input "Full name"
  input "Role"
  input "Start date"
  row
    right
    button "Cancel" -> NewHires
    button "Create" primary -> NewHireDetail

screen NewHireDetail "Cross-team onboarding progress for one new hire"
  navbar "Track Each Hire | New Hires -> NewHires | Template -> OnboardingTemplate"
  heading "Jordan Lee"
  text "Engineer | Starts 2026-09-08"
  table "Task | Team | Due Date | Status"
    row "Provision laptop | IT | 2026-09-05 | Pending"
    row "Prepare desk | Facilities | 2026-09-06 | Complete"
    row "Collect signed offer | HR | 2026-09-04 | Overdue"

screen OnboardingTemplate "HR Coordinator manages the shared onboarding task template"
  navbar "Track Each Hire | New Hires -> NewHires | Template -> OnboardingTemplate"
  row
    heading "Onboarding Template"
    right
    button "Add Task" primary -> AddTemplateTask
  table "Task | Team | Due Offset (days)"
    row "Provision laptop | IT | -3"
    row "Prepare desk | Facilities | -2"
    row "Collect signed offer | HR | -4"

screen AddTemplateTask "HR Coordinator adds or edits a shared template task"
  navbar "Track Each Hire | New Hires -> NewHires | Template -> OnboardingTemplate"
  heading "Add Template Task"
  input "Task title"
  select "Team"
  input "Due offset (days from start date)"
  row
    right
    button "Cancel" -> OnboardingTemplate
    button "Save" primary -> OnboardingTemplate

screen ITTaskQueue "IT Staff's queue of IT tasks across all new hires"
  navbar "Track Each Hire | IT Queue -> ITTaskQueue"
  heading "IT Task Queue"
  table "New Hire | Task | Due Date | Status"
    row "Jordan Lee | Provision laptop | 2026-09-05 | Overdue"
    row "Amara Diallo | Create accounts | 2026-09-12 | Pending"
  button "Mark Complete" -> ITTaskQueue

screen FacilitiesTaskQueue "Facilities Staff's queue of Facilities tasks across all new hires"
  navbar "Track Each Hire | Facilities Queue -> FacilitiesTaskQueue"
  heading "Facilities Task Queue"
  table "New Hire | Task | Due Date | Status"
    row "Jordan Lee | Prepare desk | 2026-09-06 | Complete"
    row "Amara Diallo | Issue badge | 2026-09-14 | Pending"
  button "Mark Complete" -> FacilitiesTaskQueue

flow "Manage new hires and template"
  role "HR Coordinator"
  description "HR adds a new hire, watches cross-team progress, and keeps the shared template current"
  NewHires
  AddNewHire
  NewHireDetail
  OnboardingTemplate
  AddTemplateTask

flow "Work the IT queue"
  role "IT Staff"
  description "IT staff work through their own onboarding tasks across all new hires"
  ITTaskQueue

flow "Work the Facilities queue"
  role "Facilities Staff"
  description "Facilities staff work through their own onboarding tasks across all new hires"
  FacilitiesTaskQueue
