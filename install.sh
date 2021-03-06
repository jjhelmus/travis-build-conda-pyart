MINICONDA_URL="http://repo.continuum.io/miniconda"
MINICONDA_FILE="Miniconda-latest-MacOSX-x86_64.sh"
wget "${MINICONDA_URL}/${MINICONDA_FILE}"
bash $MINICONDA_FILE -b

export PATH=/Users/travis/miniconda2/bin:$PATH

conda update --yes conda
conda install --yes conda-build jinja2 anaconda-client
conda config --add channels https://conda.anaconda.org/jjhelmus

# Remove gfortran so that all fortran Py-ART modules are not built.
# This avoids the need to package the gfortran run time in the conda package.
rm /usr/local/bin/gfor*
