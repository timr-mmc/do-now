# Do-Now — Project Checkpoint
**Date:** March 25, 2026  
**Branch:** main  
**Build:** ✅ Passing (15 routes, no errors)

---

## What the app does

**Do-Now** is a web application for NZ secondary school maths teachers (Year 9–10). It lets teachers:

1. **Set up a class profile** (class name, year group, subject)
2. **Create a Do-Now activity** — select up to 5 question slots by category → topic → subtopic, then generate a set of questions for each slot using a spaced-repetition / retrieval algorithm
3. **Display the activity** full-screen for the class projector, rendering LaTeX maths and geometry diagrams
4. **View results** after the session (per question performance)
5. **Review analytics** by profile, including historical session data
6. **Review and edit questions** in the question bank (admin)
7. **Manage account settings** (email / password)

---

## Tech stack

| Layer | Technology |
|---|---|
| Framework | Next.js 16 (App Router, Turbopack) |
| Language | TypeScript 5 |
| Styling | Tailwind CSS 4 |
| Auth & Database | Supabase (PostgreSQL + Row Level Security) |
| Supabase client | `@supabase/ssr` — `createBrowserClient` in client components, `createServerClient` in middleware |
| Maths rendering | KaTeX (via `MathText` component) |
| Geometry diagrams | JSXGraph (via dynamically-imported `GeometryDiagram` component) |
| Maths input | MathQuill (in `MathQuillEditor` component) |
| Deployment target | Vercel (or any Node.js host) |

---

## Routes

| Route | Type | Description |
|---|---|---|
| `/` | Static (client) | Landing / session entry — create Do-Now or enter session code |
| `/auth/login` | Static | Email/password login |
| `/auth/register` | Static | New account registration |
| `/login` | Static | Auth group login (legacy alias) |
| `/signup` | Static | Auth group signup (legacy alias) |
| `/dashboard` | Static (client) | Class profiles list; entry point for teachers |
| `/setup-class` | Static (client) | Create a new class profile |
| `/profiles/new` | Static (client) | Create profile (same as setup-class) |
| `/create-do-now/[profileId]` | Dynamic (client) | Build a Do-Now — select question slots, generate questions |
| `/display/[sessionId]` | Dynamic (client) | Full-screen display for classroom projector |
| `/results/[sessionId]` | Dynamic (client) | Session results — per-question stats |
| `/analytics/[profileId]` | Dynamic (client) | Profile analytics overview |
| `/analytics/[profileId]/sessions` | Dynamic (client) | Historical sessions for a profile |
| `/review-questions` | Static (client) | Browse, filter and edit questions in the question bank |
| `/question-builder` | Static | Placeholder page (not yet built) |
| `/settings` | Static (client) | Account settings — change email / password |
| `/shape-test` | Static | Developer test page for geometry diagram shapes |

---

## Database schema summary

All tables live in a Supabase (PostgreSQL) project.

| Table | Purpose |
|---|---|
| `profiles` | Teacher class profiles (user_id, class_name, year_group, subject) |
| `question_banks` | Taxonomy: category → topic → subtopic; one row per subtopic |
| `questions` | Individual questions (question_text, answer, hint, difficulty 1–4, diagram_data JSONB, bank_id FK) |
| `sessions` | A Do-Now session (profile_id, session_code, status, slots JSONB) |
| `session_questions` | Questions used in a session, with student response data and proportions correct |

### RLS policies summary

| Table | SELECT | INSERT | UPDATE | DELETE |
|---|---|---|---|---|
| `profiles` | Own rows | Authenticated | Own rows | Own rows |
| `question_banks` | Public | — | — | — |
| `questions` | Public | Authenticated | Authenticated | Authenticated |
| `sessions` | Own rows | Authenticated | Own rows | Own rows |
| `session_questions` | Via session | Via session | Via session | Via session |

> **Note:** The `questions` UPDATE/INSERT/DELETE policy was added in `database/migrations/add-questions-update-policy.sql`. Run this in the Supabase SQL editor if you haven't already.

---

## Key components

| File | Purpose |
|---|---|
| `src/components/MathText.tsx` | Renders LaTeX strings via KaTeX into a `<div>` (never `<p>`) |
| `src/components/GeometryDiagram.tsx` | Dynamically imported JSXGraph renderer; accepts `DiagramData` JSONB |
| `src/components/AngleDiagramTemplates.ts` | Pre-built diagram data objects for common angle/geometry questions |
| `src/components/MathQuillEditor.tsx` | Wraps MathQuill for question-text input |
| `src/utils/retrievalAlgorithm.ts` | Spaced-repetition logic for selecting questions per slot |
| `src/utils/diagramValidator.ts` | Validates `diagram_data` JSONB structure |
| `src/utils/supabase/client.ts` | Browser-side Supabase client (`createBrowserClient`) |
| `src/utils/supabase/server.ts` | Server-side Supabase client (`createServerClient`) |
| `src/utils/supabase/middleware.ts` | Session refresh helper used in `middleware.ts` |
| `middleware.ts` | Root middleware — refreshes auth session, redirects unauthenticated users |

---

## Project folder structure

```
do-now/
├── src/
│   ├── app/                  # Next.js App Router pages
│   │   ├── (auth)/           # Auth group (login, signup)
│   │   ├── auth/             # Auth pages (login, register)
│   │   ├── analytics/        # Analytics pages
│   │   ├── create-do-now/    # Do-Now builder
│   │   ├── dashboard/        # Teacher dashboard
│   │   ├── display/          # Full-screen session display
│   │   ├── profiles/         # Profile creation
│   │   ├── question-builder/ # (Placeholder — not yet built)
│   │   ├── results/          # Session results
│   │   ├── review-questions/ # Question bank browser & editor
│   │   ├── settings/         # Account settings
│   │   ├── setup-class/      # Class setup
│   │   └── shape-test/       # Dev test page for geometry diagrams
│   ├── components/           # Shared React components
│   ├── scripts/              # Developer scripts (diagram validation)
│   └── utils/                # Supabase clients, algorithms, validators
├── database/
│   ├── schema/               # supabase-schema.sql (full schema)
│   ├── migrations/           # Incremental patches applied to the DB
│   ├── seeds/                # Question bank & question data
│   └── diagnostics/          # Utility queries for checking data
├── docs/                     # Project documentation & guides
├── public/                   # Static assets (JSXGraph, MathQuill, jQuery)
├── middleware.ts             # Auth session middleware
├── .env.example              # Environment variable template
└── .env.local                # Local secrets (not committed)
```

---

## Environment variables required

| Variable | Where to find it |
|---|---|
| `NEXT_PUBLIC_SUPABASE_URL` | Supabase Dashboard → Settings → API → Project URL |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase Dashboard → Settings → API → anon public key |

Copy `.env.example` to `.env.local` and fill in the values.

---

## Deploying to Vercel

1. Push the repo to GitHub (ensure `.env.local` is in `.gitignore` ✅)
2. Import the repo in [vercel.com](https://vercel.com)
3. Add the two environment variables in **Project Settings → Environment Variables**
4. Deploy — Vercel will auto-detect Next.js and use `next build`

> The app uses only the anon key (no service-role key) so no sensitive secrets are exposed beyond what Supabase's RLS policies protect.

---

## Known issues / items to tidy before go-live

- [ ] `/question-builder` — page is a placeholder stub, no functionality yet
- [ ] `/shape-test` — developer test page; consider removing or protecting with an auth guard before public launch
- [ ] `src/app/question-builder/` contains three leftover draft files (`page-clean.tsx`, `page-new.tsx`, `page.tsx.backup`) — safe to delete manually
- [ ] `(auth)/login` and `(auth)/signup` routes are legacy aliases for `/auth/login` and `/auth/register` — can be consolidated
- [ ] No automated tests yet

---

## Database setup order (fresh environment)

Run these SQL files in the Supabase SQL editor **in order**:

1. `database/schema/supabase-schema.sql`
2. `database/migrations/anonymous-sessions-migration.sql`
3. `database/migrations/add-profile-archive.sql`
4. `database/migrations/spaced-repetition-enhancement.sql`
5. `database/migrations/supabase-add-diagram-column.sql`
6. `database/migrations/add-question-flagging.sql`
7. `database/migrations/session-questions-delete-policy.sql`
8. `database/migrations/optimize-database-indexes.sql`
9. `database/migrations/add-questions-update-policy.sql`
10. `database/seeds/initialize-question-banks.sql`
11. Run seed files in `database/seeds/` for question content (algebra, number, geometry, measurement, statistics, probability)
