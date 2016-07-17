import module namespace xquery = " http://basex.org/modules/xquery";

let $function := function($i) {  <blah /> }

let $out := 
    <out>
        {
	  let $fac_funcs :=     
  	    for $fac in ()
	    return function() {$function($fac)}
	  return xquery:fork-join($fac_funcs) 
	}
    </out>


return file:write('/tmp/out.xml',$out)