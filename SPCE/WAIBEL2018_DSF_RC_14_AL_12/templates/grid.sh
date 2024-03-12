{% extends "slurm.sh" %}

{% block header %}
{% set gpus = operations|map(attribute='directives.ngpu')|sum %}
    {{- super () -}}

{% if gpus %}
#SBATCH -q gpu
#SBATCH --gres gpu:{{ gpus }}
#SBATCH --constraint=intel
{%- else %}
#SBATCH -q primary
#SBATCH --constraint=intel
{%- endif %}

#SBATCH -N 1


echo  "Running on host" hostname
echo  "Time is" date
conda activate mosdef_gomc 

module load intel/2020
module load cmake
{% if gpus %}
module load cuda/10.0
nvidia-smi
{%- endif %}

{% endblock header %}

{% block body %}
    {{- super () -}}


{% endblock body %}
