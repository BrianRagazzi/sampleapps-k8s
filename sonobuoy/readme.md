
 * Download release from https://github.com/vmware-tanzu/sonobuoy/releases
 * extract tarball: tar -xvf <RELEASE_TARBALL_NAME>.tar.gz
 * move executable to path

 * run: sonobouy run --mode quick --wait
 * get results: results=$(sonobouy retrieve)
 * show results:  sonobouy results $results

 * Clean up: sonobouy delete --wait
