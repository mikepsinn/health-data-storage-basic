-- global_data.cd_variables definition

CREATE TABLE `variables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '[db-gen] Meaningless auto assigned integer for relating to other data. ',
  `string_id` varchar(200) DEFAULT NULL COMMENT '[Admin-Setting] The string id is an identifier in human_readable snake_case keywords, used as id in API properties for data exchange or in document databases and frontends. This is the ecosystem wide unique id for data sharing and is curated by the CureDAO community.',
  `slug` varchar(200) DEFAULT NULL COMMENT '[Admin-Setting] The slug is an identifier in human-readable keywords, used urls.',
  `name` varchar(125) NOT NULL COMMENT '[Admin-Setting] A consumer friendly name for this item. The intent is to provide a test name that health care consumers will recognize.',
  `abbreviated_name` varchar(100) DEFAULT NULL COMMENT '[Admin-Setting] Canonical shorter version of the name or scientific abbreviation',
  `additional_meta_data` text COMMENT '[Admin-Setting] JSON-encoded additional data that does not fit in any other columns. JSON object',
  `canonical_variable_id` int(10) unsigned DEFAULT NULL COMMENT '[Admin-Setting] If a variable duplicates another but with a different name, set the canonical variable id to match the variable with the more appropriate name.  Then only the canonical variable will be displayed and all data for the duplicate variable will be included when fetching data for the canonical variable.',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '[db-gen] Timestamp when this variable was created',
  `creator_user_id` bigint(20) unsigned NOT NULL COMMENT '[api-gen] Identifier to the corresponding user that created this variable',
  `default_unit_id` smallint(5) unsigned NOT NULL COMMENT '[Admin-Setting] ID of the default ucum unit for the variable',
  `default_value` double DEFAULT NULL COMMENT '[Admin-Setting] Most usual value of this variable for reference',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '[db-gen] Timestamp when variable was soft deleted',
  `deletion_reason` varchar(280) DEFAULT NULL COMMENT 'The reason the variable was deleted.',
  `description` text COMMENT '[Admin-Setting] Text describing the variable in more detail than the name with information not covered by the other properties and as introduction text',
  `ranges` text COMMENT '[Admin-Setting] JSON-encoded matrix of precision ranges according to the ranges-protocoll containing values of range definitions structured in phenotypic or demographic tables like gender, age, ethnicity, pregnancy ',
  `references` varchar(2083) DEFAULT NULL COMMENT '[Admin-Setting] A wikipedia article or scientific paper with more information on the content or ranges',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT '[Admin-Setting] ID of the parent variable if this variable has any parent',
  `ref_aact_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_fdc_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_gene_ontology_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_hmdb_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_icd10_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_loinc_id` varchar(10) DEFAULT NULL COMMENT '[Reference] The international standard for identifying health measurements, observations, and documents. The unique LOINC Code is a string in the format of nnnnnnnn-n.',
  `ref_meddra_all_indications_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_meddra_all_side_effects_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_rxnorm_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_snomed_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_uniprot_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `synonyms` varchar(600) DEFAULT NULL COMMENT '[admin-edit,public-write] The primary variable name and any synonyms for it. This field should be used for non-specific variable searches.',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '[]',
  `tags` varchar(600) DEFAULT NULL COMMENT '[Reference] Tags for categorization in multiple levels/ontologies/types/subtypes e.g. Condition, Intervention, Biomarker and going deeper the ontology level: Laboratory test, Blood test, Lipid panel, or for logical grouping e.g. Risk scores, Hormones, Medical use',
  `version_first_released` varchar(255) DEFAULT NULL COMMENT 'The CureDAO version number in which the record was first released. For oldest records where the version released number is known, this field will be null.',
  `version_last_changed` varchar(255) DEFAULT NULL COMMENT 'The CureDAO version number in which the record has last changed. For records that have never been updated after their release, this field will contain the same value as the loinc.VersionFirstReleased field.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`) USING BTREE,
  UNIQUE KEY `variables_string_id_uindex` (`string_id`),
  KEY `fk_variableDefaultUnit` (`default_unit_id`) USING BTREE,
  KEY `IDX_cat_unit_public_name` (`default_unit_id`,`name`,`id`) USING BTREE,
  KEY `public_deleted_at_synonyms` (`deleted_at`,`synonyms`),
  CONSTRAINT `variable_id_fk` FOREIGN KEY (`variable_id`) REFERENCES `variables` (`id`) ON DELETE SET NULL,
  CONSTRAINT `variables_default_unit_id_fk` FOREIGN KEY (`default_unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6067536 DEFAULT CHARSET=utf8 COMMENT='Variables with their metadata for reference in measurement data points';
