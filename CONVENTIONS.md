# Conventions

Rules that keep the design coherent across repositories. They exist because each one was learned
the hard way; break them deliberately or not at all.

## 1. Decisions are append-only

A decision is recorded in `docs/decisions/` with a number, a date, and a status. A later decision
**supersedes** an earlier one; it never rewrites it. Superseded decisions stay in the log, marked,
because the trail explains why the final answer is what it is.

## 2. Meaning lives in specifications, shape lives in the schema

- A specification defines behaviour and states requirements. Requirements are numbered `C-n`
  (core), `P-n` (process), `S-n` (composite) so other documents can cite them.
- The JSON Schema defines the document shape.
- Neither redefines the other. A field that appears in both must agree.

## 3. Nothing is stored that can be derived

Occupancy, footprint, display status, attention, availability, and run counts are functions of
stored records. Storing them guarantees two writers and eventual disagreement.

Corollary: **absent is not null.** A missing record and a record with a null value mean different
things everywhere.

## 4. Entity kinds do not proliferate

There are four: Blockie, Composite, Run, and definitions. A new *kind* needs an argument that a
Type, a relationship, or a mode cannot express it. "Computer Blockie" and "Drawing Blockie" are
the cautionary example: they turned a relationship into a kind and had to be deleted.

## 5. Every state has an owner

If something is described as a state, it appears in the FSM inventory with an owner, a transition
authority, a durability choice, and a recovery rule. Otherwise it is a projection and must be
labelled as one.

## 6. Relationships never imply each other

Placement, membership, nesting, management, hosting, parentage, communication, attention, and
lifecycle authority are nine separate facts. Collapsing any two produces a system that looks fine
in a demo and breaks when agents operate it.

## 7. Geometry is semantically inert

Randomising every coordinate in a World must leave its execution trace identical. If a behaviour
depends on where something is, that is a bug.

## 8. Traces before schemas

Write the scenario as a transaction log first. The trace forces the decision; the schema falls out
of the trace. Schemas written first encode guesses.

## 9. Execution failure is local; contract violation is fatal

A computation that cannot finish is a fact about the World and commits. A computation that returns
nonsense is a bug in a definition and aborts the transaction.

## 10. No native libraries

Computation plugins are JavaScript or WASM, capability-gated and digest-pinned. Native dynamic
libraries break the sandbox, the portability story, and the WASM story at once.

## Commits

Short imperative subject line, blank line, then *why* in the body. If a commit changes a decision
or a requirement, cite its id (`D-018`, `C-46`).
