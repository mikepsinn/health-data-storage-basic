create table global_variable_tag_relations
(
    global_variable_tag_id integer
        constraint global_variable_tag_relations_global_variable_tags_id_fk
            references qm_production.global_variable_tags,
    global_variable_id     bigint
        constraint global_variable_tag_relations_global_variables_id_fk
            references qm_production.global_variables
);

comment on table global_variable_tag_relations is 'Defines the tags assigned to  each variable';

comment on column global_variable_tag_relations.global_variable_tag_id is 'The related tag id';

comment on column global_variable_tag_relations.global_variable_id is 'The related variable id
';


