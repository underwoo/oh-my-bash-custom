# only load modules if MODULESHOME is set
#if [ ! -z ${MODULESHOME+x} ]
#then
#  # Load the globus module
#  module load globus
#fi
# Trying specific globus location without using module.  
X509_CERT_DIR=/usr/local/x64/globus/5.2.1/etc/grid-security/certificates
X509_USER_PROXY=/home/sdu/.globus/x509up_u
export X509_CERT_DIR X509_USER_PROXY
pathmunge /app/spack/linux-rhel7-x86_64/gcc-4.8.5/globus-toolkit/globus_6_branch-zj2kw6rza52jffzg7ihfrwad5jz3x3fz/bin
