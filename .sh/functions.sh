# puppet module creation

# $1 = module name
mk_puppet_module () {
  if [[ $# = 1 ]] ; then
    mkdir -p ${1}/{files,lib,manifests,templates,tests}
    echo "class ${1} {\n\n}" >  ${1}/manifests/init.pp
    echo "class { '${1}': }" >  ${1}/tests/init.pp
    echo "Running the following command: puppet apply --noop ${1}/tests/init.pp"
    puppet apply --noop ${1}/tests/init.pp
  else
    echo "Usage $0 module_name"
  fi
}
