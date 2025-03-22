drop trigger if exists on_auth_user_created;  -- delete this manually if not working

drop policy if exists "Allow logged-in read access" on users;
drop policy if exists "Allow individual insert access" on users;
drop policy if exists "Allow individual update access" on users;
drop policy if exists "Allow logged-in read access" on users;
drop policy if exists "Allow individual insert access" on variables;
drop policy if exists "Allow individual delete access" on variables;
drop policy if exists "Allow authorized delete access" on variables;
drop policy if exists "Allow individual insert access" on measurements;
drop policy if exists "Allow individual delete access" on measurements;
drop policy if exists "Allow authorized delete access" on measurements;
drop policy if exists "Allow individual update access" on measurements;
drop policy if exists "Allow individual read access" on public.user_roles;

drop function if exists public.handle_new_user;
drop function if exists public.authorize;

drop table if exists public.user_roles;
drop table if exists public.role_permissions;
drop table if exists public.user_tier;
drop table if exists public.user_gender;

drop table if exists variables;
drop table if exists measurements;
drop table if exists variable_categories;

drop type if exists public.user_tier;

drop table if exists users;

drop type if exists public.user_gender;
drop type if exists public.app_role;
drop type if exists public.app_permission;
drop type if exists public.user_status;
