# training-overall
Training lab that will give the user an idea on how to use cloudify components 

# About the lab

this lab consists of three components [ network , database , webserver ]

# Network Component
inside network-setup you will have a simple blueprint that will create 2 networks over openstack [ private and public ]

we using the following command to execute it on a cloudify manager:

```
cfy install openstack-network.yaml -b openstack-simple-service-network -i external_network_name=external_network
```

# Database Component 
this component depends on the previous component in order to get connectivity for the database 
inside database-server you will have a blueprint that is linked to scripts [ which will be executed on database instance once it is up ] 

```
cfy install openstack-database.yaml -b database_server_simple -i database_user=[username] -i database_pass=[password] -i network_deployment_name=openstack-simple-service-network
```

# WebServer Component
this component depends on the previous components in order to work
inside web-server you will have a blueprint that is linked to scripts and resoruces [ which will be downloaded and executed on webserver instance once it is up]


```
cfy install openstack-web.yaml -b web_server_simple -i network_deployment_name=openstack-simple-service-network -i database_server_deployment_name=database_server_simple
```


since the above components depends on each other there is a way to link all deployments together in a chain like deployment using service-composition :

https://docs.cloudify.co/5.0.0/working_with/service_composition/

# e2e : End To End
inside this folder you will have a blueprint and resources [ which are the previous components archived ]
and it will create deployments for all components mentioned above

in order to execute it we use the following command :

```
cfy install openstack-e2e.yaml -b e2e -i database_user=[username] -i database_pass=[password] -i external_network_name=external_network -i network_deployment_name=openstack-simple-service-network -i database_server_deployment_name=database_server_simple -i web_server_dep_name=web_server_simple
```


