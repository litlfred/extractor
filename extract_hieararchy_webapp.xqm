module namespace page = 'http://basex.org/modules/web-page';


import module namespace extractor = "https://github.com/~litlfred/extractor";

declare 
  %rest:path("/extractor")
function page:process() {
  let $orgs := doc("/var/lib/openinfoman/webapp/organizations.xml")/organizations/organization
  let $node := <organization id="urn:uuid:8ceefc09-7bb7-4ade-b45e-82f7fda1caa3"/>
  let $extracted := 
    <organizations>
      {extractor:get_child_orgs($orgs,$node)}
    </organizations>
  return $extracted
};


declare 
  %rest:path("/extractor2")
function page:process2() {
  let $orgs := db:open('provider_directory' , "organizations.xml")/organizations/organization
  let $node := <organization id="urn:uuid:8ceefc09-7bb7-4ade-b45e-82f7fda1caa3"/>
  let $extracted := 
    <organizations>
      {extractor:get_child_orgs($orgs,$node)}
    </organizations>
  return $extracted
};

