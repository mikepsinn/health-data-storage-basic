create table global_variable_tag_relations
(
    global_variable_tag_id integer
        constraint global_variable_tag_relations_global_variable_tags_id_fk
            references global_variable_tags,
    global_variable_id     bigint
        constraint global_variable_tag_relations_global_variables_id_fk
            references global_variables
);

alter table global_variable_tag_relations
    owner to postgres;
