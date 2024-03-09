## Installation

To get started you must install mamba and the mamba environment using these steps:

```bash
wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
# Note the -b argument invokes the non-interactive installation, the prefix is in the home directory
bash ./Mambaforge-Linux-x86_64.sh -b -p "${HOME}/conda"
mamba init
source "${HOME}/conda/etc/profile.d/conda.sh"
source "${HOME}/conda/etc/profile.d/mamba.sh"
conda activate
#To launch Snakemake the Snakemake-minimal environment needs to be created.
mamba env create --file=envs/mosdef-gomc.yml