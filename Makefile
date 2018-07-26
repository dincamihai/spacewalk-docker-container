deploy :
	ant resolve-ivy
	ant -f manager-build.xml refresh-branding-jar
	ant -f manager-build.xml refresh-branding-jar deploy -Ddeploy.host=$(TARGET)

# setup :
# 	# /root/setup.sh
# 	/manager/java/scripts/docker-testing-pgsql.sh checkstyle

test :
	ant -Dtests.includes=$(INCLUDES) -f /manager/java/manager-build.xml refresh-branding-jar test
