#!/usr/bin/env sh
set -ex
export RBENV_ROOT="/usr/local/rbenv"
export CONFIGURE_OPTS="ac_cv_func_isnan=yes ac_cv_func_isinf=yes --disable-install-doc"
export ac_cv_func_isnan="yes"
export ac_cv_func_isinf="yes"
git clone --depth 1 git://github.com/sstephenson/rbenv.git ${RBENV_ROOT}
git clone --depth 1 https://github.com/sstephenson/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build
${RBENV_ROOT}/plugins/ruby-build/install.sh
echo 'eval "$(rbenv init -)' >> /etc/profile.d/rbenv.sh
mkdir -p /usr/local/etc
echo "---\ngem: --no-document\ninstall: --no-document\nupdate: --no-document" >> /usr/local/etc/gemrc
