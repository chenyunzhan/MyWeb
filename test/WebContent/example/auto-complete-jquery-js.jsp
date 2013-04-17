<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.10.0.custom.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/ui-lightness/jquery-ui-1.10.0.custom.css">
<script type="text/javascript">
<!--
$(function() {
	
				var availableTags = [
         			"ActionScript",
         			"AppleScript",
         			"Asp",
         			"BASIC",
         			"C",
         			"C++",
         			"Clojure",
         			"COBOL",
         			"ColdFusion",
         			"Erlang",
         			"Fortran",
         			"Groovy",
         			"Haskell",
         			"Java",
         			"JavaScript",
         			"Lisp",
         			"Perl",
         			"PHP",
         			"Python",
         			"Ruby",
         			"Scala",
         			"Scheme"
         		];
         		$( "#autocomplete" ).autocomplete({
         			source: availableTags
         		});
});


var TextUtil = new Object();
var ListUtil = new Object();

ListUtil.remove = function(oListbox,iIndex)
{
    oListbox.remove(iIndex);
}

ListUtil.clear = function(oListbox)
{
    for(var i = oListbox.options.length -1; i >=0;i--)
    {
        ListUtil.remove(oListbox,i);
    }
}

ListUtil.add = function(oListbox,sName,sValue)
{
    var oOption = document.createElement("option");
    oOption.appendChild(document.createTextNode(sName));
    
    if(arguments.length == 3)
    {
        oOption.setAttribute("value",sValue);
    }
    oListbox.appendChild(oOption);
}

TextUtil.autosuggestMatch= function (sText,arrValues)
{
    var arrResult = new Array;
    if(sText !="")
    {
        for(var i = 0; i < arrValues.length;i++)
        {
            if(arrValues[i].indexOf(sText) == 0)
            {
                arrResult.push(arrValues[i]);
            }
        }
    }
    return arrResult;
}

TextUtil.autosuggest = function(oTextbox,arrValues,sListboxId)
{
    var oListbox = document.getElementById(sListboxId);
    ListUtil.clear(oListbox);

    var arrMatches = TextUtil.autosuggestMatch(oTextbox.value,arrValues);
    for(var i = 0; i < arrMatches.length;i++)
    {
        ListUtil.add(oListbox,arrMatches[i]);
    }
    
}


var arrColors  = ["red","orange","yellow","green","blue","indigo","violet","brown","black","tan","ovory","navy",
                  "aqua","white","purple","pink","gray","silver"];
arrColors.sort();

function setText(oListbox,sTextboxId)
{
  var oTextbox = document.getElementById(sTextboxId);
  if(oListbox.selectedIndex>-1)
  {
      oTextbox.value = oListbox.options[oListbox.selectedIndex].text;
  }
}   
//-->
</script>
<h2 class="demoHeaders">Autocomplete</h2>
<div>
	<div>
		<input id="autocomplete" title="type &quot;a&quot;"/>
	</div>
</div>

<input type ="text" value = "" id="txtColor" onkeyup="TextUtil.autosuggest(this,arrColors,'lstColors')" /><br />
    <select id="lstColors" size="5" style="width:200px" onclick="setText(this,'txtColor')"></select>