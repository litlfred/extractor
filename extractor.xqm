module namespace extractor = "https://github.com/~litlfred/extractor"

import module namespace xquery = " http://basex.org/modules/xquery";
import module namespace functx = "http://www.functx.com";

declare function extractor:get_child_orgs-forked($orgs,$org) {
  let $org_id := $org/@id
  return
    if (functx:all-whitespace($org_id))
    then ()
    else
      let $c_orgs := $orgs[./parent[@id = $id]]
      let $t0 := trace($org_id, "creating func for ")
      let $t1 := trace(count($c_orgs), " func checks children: ")
      let $c_org_funcs:=
        for $c_org in $c_orgs
        return function() {       
	  ( trace($org_id, "executing child func for") 
	  , $c_org, extractor:get_child_orgs-forked($orgs,$c_org))
        }
      return xquery:fork-join($c_org_funcs)
}

declare function extractor:get_child_orgs($orgs,$org) {
  let $c_orgs :=
    if (functx:all-whitespace($org_id))
    then ()
    else $orgs[./parent[@id = $org_id]]
  return
    for $c_org in $c_orgs
    let $t0 := trace($org_id, "processing children for ")
    return ($c_org,extractor:get_child_orgs($orgs,$c_org))

};