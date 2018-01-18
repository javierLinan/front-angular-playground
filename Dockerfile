FROM sonarqube

LABEL maintainer="javier.linmanzaneda@zenika.com"

#Bundled plugins
ENV GIT_PLUGIN_VERSION=1.3.0.869

#Plugins
ENV WEB_PLUGIN_VERSION=2.5.0.476 \
	CSS_PLUGIN_VERSION=2.1 \
	GITHUB_PLUGIN_VERSION=1.4.2.1027

RUN cd /opt/sonarqube/extensions/plugins \
	# Web
	&& curl -sLo sonar-web-plugin-${WEB_PLUGIN_VERSION}.jar \
    https://sonarsource.bintray.com/Distribution/sonar-web-plugin/sonar-web-plugin-${WEB_PLUGIN_VERSION}.jar \
  # CSS
  && curl -sLo sonar-css-plugin-${CSS_PLUGIN_VERSION}.jar \
    https://github.com/SonarQubeCommunity/sonar-css/releases/download/${CSS_PLUGIN_VERSION}/sonar-css-plugin-${CSS_PLUGIN_VERSION}.jar \
	# Github
	&& curl -sLo sonar-github-plugin-${GITHUB_PLUGIN_VERSION}.jar \
    https://sonarsource.bintray.com/Distribution/sonar-github-plugin/sonar-github-plugin-${GITHUB_PLUGIN_VERSION}.jar