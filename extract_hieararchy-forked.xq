import module namespace extractor = "https://github.com/~litlfred/extractor";

let $orgs := doc("organizations.xml")/organizations/organization
let $node := <organization id="urn:uuid:8ceefc09-7bb7-4ade-b45e-82f7fda1caa3"/>
let $extracted := 
  <organizations>
    {extractor:get_child_orgs-forked($orgs,$node)}
  </organizations>
return file:write("extracted-forked.xml",$extracted)

