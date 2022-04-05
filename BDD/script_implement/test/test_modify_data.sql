/*
    Tests for the modify functions
*/

-- Test 1 : tests on the modify_points_appuis function

INSERT INTO masks(id_masks, url) VALUES (4, 'pouet4');
INSERT INTO sources(id_sources, credit, home, url, viewer, thumbnail, lowres, highres, iip, footprint) VALUES (4, 'mi4', 'mi4', 'mi4', 'mi4', 'mi4', 'mi4', 'mi4', 'mi4', ST_GeomFromText('MULTIPOLYGON(((1 1,5 1,5 5,1 5,1 1),(2 2,2 3,3 3,3 2,2 2)),((6 3,9 2,9 4,6 3)))', 2154));
INSERT INTO images(id_images, t0, t1, image, size_image, id_sources, id_masks) VALUES (4, '2016-06-22 19:10:25-07', '2016-06-22 19:10:25-07', 'pouet4', ST_GeomFromText('POINT(0 0)', 2154), 4, 4);
INSERT INTO points_appuis(id_points_appuis, point_2d, point_3d, id_images) VALUES (4, ST_GeomFromText('POINT(0 0)', 2154), ST_GeomFromText('POINTZ(0 0 0)', 2154), 4);

SELECT modify_points_appuis(-1, '''POINT(0 0)''', '''POINTZ(0 0 0)''', 2154);
SELECT modify_points_appuis(1, '''POINT(0 0)''', '''POINTZ(0 0 0)''', 215);
SELECT modify_points_appuis(1, '''POINT(2 2)''', '''POINTZ(2 2 2)''', 2154);

-- Test 2 : tests on the modify_georefs function

INSERT INTO interne(id_interne, pp, focal, skew, distorsion) VALUES (4, ST_GeomFromText('POINTZ(0 0 0)', 2154), ST_GeomFromText('POINTZ(0 0 0)', 2154), 0, '{0, 0}');
INSERT INTO externe(id_externe, point, quaternion, srid) VALUES (4, ST_GeomFromText('POINTZ(0 0 0)', 2154), ST_GeomFromText('POINTZM(0 0 0 0)', 2154), 2154);
INSERT INTO transfo2d(id_transfo2d, image_matrix) VALUES (4, '{0, 0}');
INSERT INTO georefs(id_georefs, user_georef, date, georef_principal, footprint, near, far, id_transfo2d, id_interne, id_externe, id_images) VALUES (4, 'ama4', '2016-06-22 19:10:25-07', TRUE, ST_GeomFromText('POLYGON((50.6373 3.0750,50.6374 3.0750,50.6374 3.0749,50.63 3.07491,50.6373 3.0750))', 2154), ST_GeomFromText('POLYGON((50.6373 3.0750,50.6374 3.0750,50.6374 3.0749,50.63 3.07491,50.6373 3.0750))', 2154), ST_GeomFromText('POLYGON((50.6373 3.0750,50.6374 3.0750,50.6374 3.0749,50.63 3.07491,50.6373 3.0750))', 2154), 4, 4, 4, 4);

SELECT modify_georefs(id_georefs => 1, user_georef => '''AMAMAA''', georef_principal => True);

SELECT modify_georefs(id_georefs => 4, user_georef => '''AMAAMA''', footprint => '''POLYGON((0 0,0 0,0 0,0 0,0 0))''',
					 epsg => 2154);
					 
-- Test 3 : tests on the modify_images function

SELECT modify_images(id_images => 1);

SELECT modify_images(id_images => 4, image => '''mimimimimi''');

-- Test 4 : tests on the modify_transfo2d function

SELECT modify_transfo2d(id_transfo2d => 0);

SELECT modify_transfo2d(id_transfo2d => 4, image_matrix => '''{1, 1}''');

-- Test 5 : tests on the modify_externe function

SELECT modify_externe(id_externe => 0);

SELECT modify_externe(id_externe => 4);

SELECT modify_externe(id_externe => 4, quaternion => '''POINTZM(0 0 0 0)''', srid => 2154);

-- Test 6 : tests on the modify_interne function

SELECT modify_interne(id_interne => 0), modify_interne(id_interne => 4);
SELECT modify_interne(id_interne => 4, skew => 1.4, distorsion => '''{2, 2}''');

-- Test 7 : tests on the modify_sources function

SELECT modify_sources(id_sources => 0), modify_sources(id_sources => 4);
SELECT modify_sources(id_sources => 4, credit => '''TestByAma''', url => '''UneURL''');

-- Test 8 : tests on the modify_masks function

SELECT modify_masks(id_masks => 0), modify_masks(id_masks => 4, url => '''UneURLAuHasard''');




