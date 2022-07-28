create table global_variable_tags
(
    id           integer not null
        constraint global_variable_tags_pk
            primary key,
    name         varchar(125),
    slug         varchar(125),
    order_column integer,
    created_at   timestamp,
    updated_at   timestamp
);

comment on table global_variable_tags is '[Reference] Tags for categorization in multiple levels/ontologies/types/subtypes e.g. Condition, Intervention, Biomarker and going deeper the ontology level: Laboratory test, Blood test, Lipid panel, or for logical grouping e.g. Risk scores, Hormones, Medical use';

comment on column global_variable_tags.name is '[Reference] Tags for categorization in multiple levels/ontologies/types/subtypes e.g. Condition, Intervention, Biomarker and going deeper the ontology level: Laboratory test, Blood test, Lipid panel, or for logical grouping e.g. Risk scores, Hormones, Medical use';

comment on column global_variable_tags.slug is 'URL-safe version of tag name';

comment on column global_variable_tags.order_column is 'Manually defined order for display purposes';

