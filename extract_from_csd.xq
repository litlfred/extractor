declare namespace csd = "urn:ihe:iti:csd:2013"; 


let $doc := doc("DATIM-Global.2.23.2016.xml")
let $orgs := 
  <ogranizations>
   {
     for $org in $doc/csd:CSD/csd:organizationDirectory/csd:organization
     return 
       <organization id="{$org/@entityID}">
         {
	   let $p := $org/csd:parent
	   return
	     if (exists($p))
	     then <parent id="{$p/@entityID}"/>
	     else () 
	 }
       </organization>
   }
  </ogranizations>
 
return file:write("org_hiearchy.xml",$orgs)