-- PCA Region 10 — CSC Form No. 6 leave applications
-- 1. Create a project at https://supabase.com
-- 2. SQL Editor > New query > paste this file > Run
-- 3. Copy Project URL and anon public key into config.js

create table if not exists public.leave_applications (
    id text primary key,
    office text,
    date_filing date,
    name_last text,
    name_first text,
    name_middle text,
    full_name text,
    position text,
    salary text,
    leave_type_raw text,
    leave_type_others text,
    leave_type text,
    vacation_location text,
    vacation_ph_address text,
    vacation_abroad text,
    sick_location text,
    sick_hospital text,
    sick_outpatient text,
    women_illness text,
    study_purpose text,
    other_purpose text,
    working_days text,
    inclusive_dates text,
    commutation text,
    created_at timestamptz not null default now()
);

alter table public.leave_applications enable row level security;

drop policy if exists "anon can insert leave applications" on public.leave_applications;
create policy "anon can insert leave applications"
    on public.leave_applications
    for insert
    to anon
    with check (true);

drop policy if exists "anon can read leave applications" on public.leave_applications;
create policy "anon can read leave applications"
    on public.leave_applications
    for select
    to anon
    using (true);

create index if not exists leave_applications_created_at_idx
    on public.leave_applications (created_at desc);
