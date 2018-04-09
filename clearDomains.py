import json
from   cloudfoundry_client.client import CloudFoundryClient

target_endpoint = 'https://api.ng.bluemix.net'

client = CloudFoundryClient(target_endpoint, skip_verification=True)
client.init_with_user_credentials('XXXX@XX.ibm.com', 'XXXXXXXXX')

for organization in client.organizations:
    #print json.dumps(organization, indent=4, sort_keys=True)
    print "ORG:" + organization['entity']['name']
    for space in organization.spaces():
        #print json.dumps(space, indent=4, sort_keys=True)
        used_routes = []
        print " SPACE:" + space['entity']['name']
        for app in space.apps():
            #print json.dumps(app, indent=4, sort_keys=True)
            print "  APP_NAME:" + app['entity']['name']
            print "  APP_STATE:" + app['entity']['state']
            for route in app.routes():
                print "   ROUTE:" + route['entity']['host']
                used_routes.append(route['entity']['host'])
            #for bindings in app.service_bindings():
            #    print json.dumps(bindings, indent=4, sort_keys=True)
        print "cf t -o '%s' -s '%s'" % (organization['entity']['name'], space['entity']['name'])
        for route in space.routes():
            if route['entity']['host'] in used_routes:
                pass
            else:
                print "cf delete-route mybluemix.net --hostname '%s' -f" % route['entity']['host']
