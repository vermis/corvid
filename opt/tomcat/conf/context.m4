<Context reloadable="_RELOADABLE" allowLinking="true">
    <!-- Default set of monitored resources -->
    <WatchedResource>WEB-INF/web.xml</WatchedResource>

    <!-- Disable session persistence across Tomcat restarts -->
    <!-- Comment below enable session persistence across Tomcat restarts -->
    <Manager pathname="" />

    <!-- Uncomment this to enable Comet connection tacking; -->
    <!-- provides events on session expiration as well as webapp lifecycle -->
    <!--
    <Valve className="org.apache.catalina.valves.CometConnectionManagerValve" />
    -->
</Context>
