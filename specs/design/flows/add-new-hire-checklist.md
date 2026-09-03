# Add New Hire and Generate Checklist

An HR Coordinator adds a new hire and the onboarding checklist is generated
automatically from the shared template, ready for HR, IT, and Facilities to
work from.

```mermaid
sequenceDiagram
    actor HRCoordinator as HR Coordinator
    participant onboarding-webapp
    participant onboarding-api
    participant onboarding-db

    HRCoordinator->>onboarding-webapp: Enter new hire details
    onboarding-webapp->>onboarding-api: POST /new-hires
    onboarding-api->>onboarding-db: Insert new hire record
    onboarding-api->>onboarding-db: Read shared template tasks
    onboarding-api->>onboarding-db: Insert onboarding tasks with computed due dates
    onboarding-api-->>onboarding-webapp: New hire and generated task list
    onboarding-webapp-->>HRCoordinator: Show onboarding progress
```

