function testDataJoint()

testPath = fileparts(mfilename('fullpath'));
addpath(testPath)
ts = matlab.unittest.TestSuite.fromFolder(testPath);
run(ts)
rmpath(testPath)
