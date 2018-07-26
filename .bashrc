function deploy() {
	ant resolve-ivy
	ant -f manager-build.xml refresh-branding-jar
	ant -f manager-build.xml refresh-branding-jar deploy -Ddeploy.host=$(TARGET)
}

# function setup() {
# 	/manager/java/scripts/docker-testing-pgsql.sh
# }

# Postgres shutdown (avoid stale memory by shmget())
function reset() {
    rcpostgresql stop ||:;
}

function ant-run() {
    INCLUDES=""
    if [ -n "$2" ]; then
        INCLUDES="-Dtests.includes=$2"
    fi
    ant ${INCLUDES} -f /manager/java/manager-build.xml refresh-branding-jar $1
}

# function test() {
#     ant-run test $1
# }
# 
# function checkstyle() {
#     ant-run checkstyle
# }
# 
# function compile() {
#     ant-run compile
# }
