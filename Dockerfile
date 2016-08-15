FROM dlord/minecraft:java8
MAINTAINER John Paul Alcala jp@jpalcala.com

ENV FTB_INFINITY_URL http://owncloud.criticalgaming.zone/pz2/ProjectOzone_2.0_server.zip
ENV LAUNCHWRAPPER net/minecraft/launchwrapper/1.12/launchwrapper-1.12.jar

RUN curl -SL $FTB_INFINITY_URL -o /tmp/infinity.zip && \
    unzip /tmp/infinity.zip -d /opt/minecraft && \
    mkdir -p /opt/minecraft/$(dirname libraries/${LAUNCHWRAPPER}) && \
    curl -S https://libraries.minecraft.net/$LAUNCHWRAPPER -o /opt/minecraft/libraries/$LAUNCHWRAPPER && \
    find /opt/minecraft -name "*.log" -exec rm -f {} \; && \
    rm -rf /opt/minecraft/world /tmp/* && \
	mkdir -p /opt/minecraft/java_pref && echo "xBendingUnit22x" >>/opt/minecraft/ops.txt && \
	echo "xBendingUnit22x" >> /opt/minecraft/whitelist.txt

ENV MINECRAFT_VERSION 1.7.10
ENV MINECRAFT_OPTS -server -Xms2048m -Xmx3072m -XX:MaxPermSize=256m -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -Djava.util.prefs.userRoot=/opt/minecraft/java_pref/
ENV MINECRAFT_STARTUP_JAR FTBServer-1.7.10-1614.jar
# ENV GENERATOR_SETTINGS
# ENV OP_PERMISSION_LEVEL
# ENV ALLOW_NETHER
# ENV LEVEL_NAME
# ENV ENABLE_QUERY
# ENV ALLOW_FLIGHT
# ENV ANNOUNCE_PLAYER_ACHIEVEMENTS
ENV LEVEL_TYPE botania-skyblock
# ENV ENABLE_RCON
# ENV FORCE_GAMEMODE
# ENV LEVEL_SEED
# ENV SERVER_IP
# ENV MAX_BUILD_HEIGHT
# ENV SPAWN_NPCS
# ENV WHITE_LIST
# ENV SPAWN_ANIMALS
# ENV SNOOPER_ENABLED
# ENV ONLINE_MODE
# ENV RESOURCE_PACK
# ENV PVP
# ENV DIFFICULTY
ENV ENABLE_COMMAND_BLOCK true
# ENV PLAYER_IDLE_TIMEOUT
# ENV GAMEMODE
# ENV MAX_PLAYERS
# ENV SPAWN_MONSTERS
# ENV VIEW_DISTANCE
# ENV GENERATE_STRUCTURES
# ENV MOTD