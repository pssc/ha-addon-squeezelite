CLONEZ="1 2 3 4 5 6 7 8 9"
MASTER="squeezelite"
FILEZ="CHANGELOG.md  DOCS.md  Dockerfile  README.md  build.json  config.yaml  icon.png  logo.png  patches  rootfs  squeezelite"

set -u 

for i in ${CLONEZ};do
	mkdir -p ${MASTER}${i}
	( cd ${MASTER} ; cp -ru ${FILEZ} ../${MASTER}${i}/ )
	sed -i "s/name: Squeezelite/name: Squeezelite Clone ${i}/" ${MASTER}${i}/config.yaml
	sed -i "s/slug: squeezelite/slug: squeezelite${i}/" ${MASTER}${i}/config.yaml
done

