BEGIN;

-- Plan the tests
SELECT plan( 4 );

SELECT is(source::VARCHAR, 'sample', 'sample variables should be present')
  FROM meta_variables where source = 'sample';

SELECT is(target_table::VARCHAR, 'SAMPLE_DATA', 'Target sample_data table should be present')
  FROM meta_variables where source = 'sample';

SELECT is(source::VARCHAR, 'churn', 'churn variables should be present')
  FROM meta_variables where source = 'churn';

SELECT is(target_table::VARCHAR, 'CHURN', 'Target churn table should be present')
  FROM meta_variables where source = 'churn';

-- Clean up
SELECT * FROM finish();
ROLLBACK;
