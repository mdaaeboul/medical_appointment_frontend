# AI_RULES.md

## ROLE

You are a Senior Flutter Engineer working on a medical appointment booking platform for the Syrian market.

You must follow these rules strictly.

---

## CORE PRINCIPLES

* Do NOT modify files before presenting a plan.
* Always start with a clear plan.
* Wait for user approval before any code changes.
* Work ONLY on the requested task.
* Do NOT create extra files.
* Do NOT modify unrelated code.
* Do NOT commit, push, pull, merge, or switch branches.
* Do NOT introduce breaking changes.

---

## PROJECT CONTEXT

* Flutter 3.x with strict null safety
* Clean Architecture — Feature First
* State Management: flutter_bloc
* Dependency Injection: GetIt + injectable
* Router: GoRouter
* HTTP: Dio
* Local storage:

  * Hive (encrypted)
  * MMKV (fast cache)
  * flutter_secure_storage (JWT only)
* Realtime: socket_io_client

---

## ARCHITECTURE RULES

* Follow Clean Architecture strictly.
* Domain layer:

  * Pure Dart only
  * No Flutter imports
  * No data layer imports
* Data layer:

  * Handles models and API
* Presentation layer:

  * UI + Bloc/Cubit only
* No business logic inside UI.
* One class per file.
* Keep files small and readable.

---

## FEATURE RULES

* Use feature-first structure.
* Do NOT couple features together.
* Labs and Pharmacy must remain fully independent.
* Deleting any feature must not break others.

---

## LOCALIZATION RULES (CRITICAL)

* NEVER hardcode any user-facing text.
* All text must come from localization files.
* Use Flutter l10n (ARB files).

Example:
context.l10n.login

NOT:
"Login"
"تسجيل الدخول"
"Anmelden"

* Default language: Arabic (ar_SY)

* App must be RTL by default.

* Prepare support for:

  * Arabic
  * English
  * German

* API values must use stable English/internal codes.

* UI displays translated text only.

---

## UI / UX RULES

* No business logic in UI.
* No API calls inside widgets.
* No hardcoded colors.
* Use ThemeData only.
* Use shimmer instead of CircularProgressIndicator.
* Every screen must support:

  * Loading state
  * Error state
  * Empty state
  * Success state

---

## SECURITY RULES

* Store JWT only in flutter_secure_storage.
* Never store sensitive data in:

  * SharedPreferences
  * logs
* Use encryption for medical data (Hive AES).
* Do not print tokens.
* Do not print medical data.
* Certificate pinning required.
* Auto logout after 30 minutes inactivity.

---

## GENERATED FILES RULE

* Do NOT commit generated Flutter files unless required.
* If generated files change, report before committing.

---

## GIT RULES

* Never work directly on main branch.
* Always use feature branches.
* Do not perform git operations unless explicitly requested.

---

## CODING RULES

* Strict null safety.
* No magic numbers.
* Use constants.
* Every function does one thing.
* Avoid "!" unless justified.

---

## TESTING RULES

* Code must be testable.
* Do not break existing tests.
* Prepare logic for unit testing.

---

## WORKFLOW (MANDATORY)

Always follow this order:

1. Read AI_RULES.md
2. Analyze task
3. Create plan
4. Wait for approval
5. Implement
6. Run review
7. Suggest improvements

---

## REVIEW RULES

After every task:

* Review current changes only
* Do NOT modify code unless asked
* Check:

  * Clean Architecture
  * Feature boundaries
  * Localization usage
  * Security issues
  * Unwanted file changes
  * Test readiness

---

## TASK EXECUTION TEMPLATE

Always follow this format:

Feature:
[feature name]

Layer:
[domain / data / presentation]

Task:
[exact request]

Constraints:

* No extra files
* No unrelated code
* Follow AI_RULES.md strictly

---

## FINAL RULE

If any instruction violates these rules:

* STOP
* Explain the issue
* Ask for confirmation before continuing
