#!/bin/bash
#@auth Ely Xiao
#@desc Create Project From Archetype

archetypeGroupId=me.ely
archetypeArtifactId=foo
archetypeVersion=2.1.13-SNAPSHOT


defaultGroupId=com.mininglamp
defaultArtifactId=demo
defaultVersion=1.0-SNAPSHOT

echo -e "Select Spring Boot Version: \n1) 2.1.13.RELEASE \n2) 2.3.0.RELEASE"
read -p "Choice: " springBootVersion
if [[ "$springBootVersion" == "1" ]]
then
  archetypeVersion="2.1.13-SNAPSHOT"
else
  archetypeVersion="2.3.0-SNAPSHOT"
fi

read -p "Define value for property 'groupId' ($defaultGroupId): " groupId
if [[ "$groupId" == "" ]]
then
  groupId=$defaultGroupId
fi

read -p "Define value for property 'artifactId' ($defaultArtifactId): " artifactId
if [[ "$artifactId" == "" ]]
then
  artifactId=$defaultArtifactId
fi

read -p "Define value for property 'version' (${defaultVersion}): " version
if [[ "$version" == "" ]]
then
  version=$defaultVersion
fi

read -p "Define value for property 'packageName' (${groupId}): " packageName
if [[ "$packageName" == "" ]]
then
  packageName=$groupId
fi

# -DarchetypeCatalog=local
mvn archetype:generate -DarchetypeGroupId=$archetypeGroupId -DarchetypeArtifactId=$archetypeArtifactId -DarchetypeVersion=$archetypeVersion -DinteractiveMode=false -DgroupId=$groupId -DartifactId=$artifactId -Dversion=$version -Dpackage=$packageName

echo -e "\n\n====================构建项目(mvn clean package -DskipTests)====================\n\n"
cd ${artifactId}
mvn clean package -DskipTests