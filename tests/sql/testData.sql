BEGIN;

-- Plan the tests
SELECT plan( 2 );

SELECT is(source::VARCHAR, 'sample', 'sample variables should be present')
  FROM meta_variables;

SELECT is(target_table::VARCHAR, 'SAMPLE_DATA', 'Target sample_data table should be present')
  FROM meta_variables;

-- Clean up
SELECT * FROM finish();
ROLLBACK;
