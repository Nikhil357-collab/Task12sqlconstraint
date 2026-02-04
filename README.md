# Task12sqlconstraint
Constraint Design Decisions (Documentation)

CHECK constraints used for business rules that rarely change (age, salary range).

DEFAULT values reduce null handling and ensure audit consistency.

UNIQUE constraints prevent data duplication at the lowest level.

Composite UNIQUE keys model real-world uniqueness (user + time).

Database-level validation chosen to ensure integrity across all applications.
