# Track Each Hire — PRD

## Problem Statement

When a new employee joins, their onboarding work is split across HR, IT, and
Facilities — accounts to provision, paperwork to collect, a desk and badge to
prepare, equipment to order. Today nothing ties these tasks to one new hire or
one deadline, so items fall through the cracks silently: nobody notices a
laptop request is late until the new hire's first day arrives without one.

## Solution

A shared onboarding tracker that, the moment a new hire is added, spins up a
standard checklist of tasks split across HR, IT, and Facilities. Each team
works from its own queue, marks its tasks done, and gets reminded the moment
one of its tasks goes overdue — so every new hire's onboarding is visible,
owned, and on time.

## Actors

- **HR Coordinator** — adds new hires, triggers their onboarding checklist,
can view progress across all teams for any new hire, and manages the
standard onboarding task template.
- **IT Staff** — works from a queue of only the IT onboarding tasks across all
new hires, and marks their own tasks complete.
- **Facilities Staff** — works from a queue of only the Facilities onboarding
tasks across all new hires, and marks their own tasks complete.

## User Stories

1. As an HR Coordinator, I want to add a new hire, so that their onboarding
record exists in the system.
2. As an HR Coordinator, I want a standard onboarding checklist to be created
automatically for every new hire I add, so that I don't have to assemble
tasks by hand each time.
3. As an HR Coordinator, I want to view every task for a given new hire across
HR, IT, and Facilities in one place, so that I can track their overall
onboarding progress.
4. As an HR Coordinator, I want to manage the standard onboarding task
template (add, edit, or remove tasks and which team owns each), so that the
checklist stays current as processes change.
5. As an IT Staff member, I want to see a queue of only the IT tasks across
all new hires, so that I can work through them without HR/Facilities noise.
6. As a Facilities Staff member, I want to see a queue of only the Facilities
tasks across all new hires, so that I can work through them without
HR/IT noise.
7. As an HR Coordinator, I want to complete my own HR tasks for a new hire, so
that their record reflects real progress.
8. As an IT Staff member, I want to mark an IT task complete, so that HR and
the rest of the team can see it's done.
9. As a Facilities Staff member, I want to mark a Facilities task complete, so
that HR and the rest of the team can see it's done.
10. As an HR Coordinator, IT Staff member, or Facilities Staff member, I want
to be reminded when one of my team's tasks for a new hire is overdue, so
that nothing slips past its deadline unnoticed.

## Product Decisions

- Every user signs in via SSO through Thunder, the platform IDP.
- Onboarding tasks are split into three fixed teams — HR, IT, and Facilities —
matching the three actors; a task belongs to exactly one team.
- Every new hire's checklist is generated from a single, shared standard
onboarding template (not per-role) at the moment HR adds them.
- Each template task carries a due-date offset (e.g. "3 days after start
date"); the new hire's checklist tasks get concrete due dates computed from
their start date.
- A task becomes "overdue" the day after its due date passes while still
incomplete. *assumed*
- Overdue-task reminders are delivered as in-app notifications only (no
email); each team sees its own overdue tasks flagged inside the tracker.
- HR Coordinators can view all tasks for a new hire across all three teams,
but can only mark HR-owned tasks complete themselves — IT and Facilities
each complete only their own tasks.
- IT Staff and Facilities Staff see only their own team's task queue across
all new hires; they cannot see other teams' tasks. *assumed*

## Out of Scope

- New hires do not get their own login or self-service view in this version.
- No integration with external HRIS, IT provisioning, or facilities-management
systems — tasks are tracked and completed manually inside this product.
- No support for multiple onboarding templates per role or department.

## Open Questions

*None at this time.*

## Further Notes

*None.*