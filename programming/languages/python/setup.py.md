# setup.py Debugging

rm -rf dist lib pybuild device_application.egg-info
mkdir -p ./lib/python3.6/site-packages pybuild
PYTHONPATH=lib/python3.6/site-packages python3 setup.py build --build-base=pybuild --debug install --prefix=. --dry-run
