BEGIN;

-- Plan the tests
SELECT plan( 12 );

SELECT is(source::VARCHAR, 'sample', 'sample variables should be present')
  FROM meta_variables where source = 'sample';

SELECT is(target_table::VARCHAR, 'SAMPLE_DATA', 'Target sample_data table should be present')
  FROM meta_variables where source = 'sample';

SELECT is(source::VARCHAR, 'churn', 'churn variables should be present')
  FROM meta_variables where source = 'churn';

SELECT is(target_table::VARCHAR, 'CHURN', 'Target churn table should be present')
  FROM meta_variables where source = 'churn';

SELECT is(source::VARCHAR, 'cde_features_a', 'cde_features_a variables should be present')
  FROM meta_variables where source = 'cde_features_a';

SELECT is(target_table::VARCHAR, 'CDE_FEATURES_A', 'Target cde_features_a table should be present')
  FROM meta_variables where source = 'cde_features_a';

SELECT is(source::VARCHAR, 'cde_features_a', 'cde_features_a variables should be present')
  FROM meta_variables where source = 'cde_features_a';

SELECT is(target_table::VARCHAR, 'CDE_FEATURES_B', 'Target cde_features_b table should be present')
  FROM meta_variables where source = 'cde_features_b';

SELECT is(source::VARCHAR, 'cde_features_c', 'cde_features_c variables should be present')
  FROM meta_variables where source = 'cde_features_c';

SELECT is(target_table::VARCHAR, 'CDE_FEATURES_C', 'Target cde_features_c table should be present')
  FROM meta_variables where source = 'cde_features_c';

SELECT is(source::VARCHAR, 'mip_cde_features', 'mip_cde_features variables should be present')
  FROM meta_variables where source = 'mip_cde_features';

SELECT is(target_table::VARCHAR, 'MIP_CDE_FEATURES', 'Target mip_cde_features table should be present')
  FROM meta_variables where source = 'mip_cde_features';

-- Clean up
SELECT * FROM finish();
ROLLBACK;
